fun map_char_to_string cs = map(fn c => implode [c]) cs;

(* 1.a *)
fun insert_at (a, 0, xs) = (a::xs)
  | insert_at (a, b, (x::xs)) =  x::insert_at (a, b - 1, xs);

(* 1.b *)
fun insert_at_none (i, lst) 
  = insert_at("None", i, map_char_to_string lst);


datatype 'a binary_tree = Empty | Node of 'a * 'a binary_tree * 'a binary_tree;


(* 2. *)
fun add_to_search_tree (Empty, x) =
        Node (x, Empty, Empty)
  | add_to_search_tree (Node (v, left, right), x) =
        if x < v then
            Node (v, add_to_search_tree(left, x), right)
        else
            Node (v, left, add_to_search_tree(right, x));

(* 2.b We create two comperison functions, one for compering floats and one for compering ints, and change the method signature to receive the comperison mathod as an argument. The floats comperison method will  *)

(* 3 *)

