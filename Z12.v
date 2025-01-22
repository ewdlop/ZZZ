Require Import Coq.ZArith.ZArith.
Open Scope Z_scope.

Definition Z12 := { n : Z | 0 <= n < 12 }.

(* Projection function to get the integer value *)
Definition proj_Z12 (x : Z12) : Z := proj1_sig x.

(* Addition in Z12 *)
Definition add_Z12 (x y : Z12) : Z12 :=
  exist _ ((proj_Z12 x + proj_Z12 y) mod 12)
          (Z.mod_pos_bound _ _ ltac:(lia)).

(* Multiplication in Z12 *)
Definition mul_Z12 (x y : Z12) : Z12 :=
  exist _ ((proj_Z12 x * proj_Z12 y) mod 12)
          (Z.mod_pos_bound _ _ ltac:(lia)).

(* Equality check in Z12 *)
Definition eq_Z12 (x y : Z12) : Prop :=
  proj_Z12 x = proj_Z12 y.

(* Proving some properties as needed... *)

(* Create elements in Z12 *)
Definition a : Z12 := exist _ 3 ltac:(lia).
Definition b : Z12 := exist _ 10 ltac:(lia).

(* Add elements in Z12 *)
Compute proj_Z12 (add_Z12 a b). (* Result: 1 *)

(* Multiply elements in Z12 *)
Compute proj_Z12 (mul_Z12 a b). (* Result: 6 *)
