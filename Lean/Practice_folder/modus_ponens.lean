
/- # ***Modus ponens*** -/

def MP {P Q : Prop} (hP : P) (hPQ : P → Q) : Q :=
begin
  apply hPQ,
  exact hP,
end

/- MP appears as a function that, given propositions P and Q, sends a proof of the propositions P and (P → Q) to a proof of Q. -/

#check @MP

/-
MP : ∀ {P Q : Prop}, P → (P → Q) → Q
-/

variables {P Q : Prop} (hP : P) (hPQ : P → Q)

/- A proof that, in the context defined  by the functions MP and the variables P, Q, hP and hPQ, the Proposition Q is true: we simply apply the *modus ponens* function to the proofs of the propositions P and (P → Q). -/

def In_our_context_Q_is_true : Q := MP hP hPQ

/- The following terms are both of type Q, i.e. proofs of the Proposition Q. In fact, it is the same term, namely MP hP hPQ, but in the first notation we include the *implicit variables* P and Q.-/

#check @MP P Q hP hPQ
#check MP hP hPQ

/- The tactic proof that Q is true in our context uses the `exact` tactic.

Note that here, in order to use the variables hP and hQ *in tactic mode*, we need to include them in the local context.-/

def In_our_context_Q_is_true_bis (hP : P) (hPQ : P → Q) : Q :=
begin
    exact MP hP hPQ,
end

/- At the end of the day, the two proof terms are indeed identical -/

#print In_our_context_Q_is_true
#print In_our_context_Q_is_true_bis