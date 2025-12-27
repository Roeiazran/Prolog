use crate::ast::*;
use crate::semantics::*;

// nos: (Stm, State) -> State
pub fn nos(c: (Stm, State)) -> State {
    let (stm, state) = c;

    match stm {
        // Assignment: [ass]
        Stm::Ass(x, e) => update(&x, &e, &state),

        // Skip: [skip]
        Stm::Skip => state,

        // Composition
        Stm::Comp(s1, s2) => {
            let s_prime = nos((*s1, state));
            nos((*s2, s_prime))
        }

        // If
        Stm::If(b, s1, s2) => {
            if solve_b(&b, &state) == "tt" {
                nos((*s1, state))
            } else {
                nos((*s2, state))
            }
        }

        // While
        Stm::While(b, body) => {
            if solve_b(&b, &state) == "tt" {
                let s_prime = nos((*body.clone(), state));
                nos((Stm::While(b, body), s_prime))
            } else {
                state
            }
        }

        // ✅ DoWhile — כאן זה צריך להיות
        Stm::DoWhile(body, cond) => {
            // execute body at least once
            let s1 = nos((*body.clone(), state));
            if solve_b(&cond, &s1) == "tt" {
                nos((Stm::DoWhile(body, cond), s1))
            } else {
                s1
            }
        }
    }
}
