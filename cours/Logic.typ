

#let tDocument(
  title:[Title],
  authors:[Tijn Struben-Huising],
  authors_intro:"Author: ",
  contacts:[tijn.strubenhuising\@gmail.com],
  contacts_intro:",Contact: ",
  abstract:[],
  contents:[]

) = [


#set page(  
  

  margin: (top: 1.5in, bottom: 1.1in, x: 1in),




  header: [
    #v(100%)
    #text(style:"italic",weight: "bold",)[#title]
    #h(0.5cm) 
    #text(style:"italic")[#authors_intro] 
    #authors
    #text(style:"italic")[#contacts_intro] 
    #contacts
    #h(1fr) 
    #(context counter(page).get().first() - 1)
    #line(length: 100%, stroke: 0.5pt)
    #v(1fr)
    
  
  ],


)

#align(center)[
#rect(stroke:(top:black,bottom:black,right:black, left:black))[#text(style:"oblique",size:50pt)[#title]
]
]
\
\


#abstract
#set heading(numbering: "I.1.1")
//#show heading.where(level: 1): it => { pagebreak(weak: true); it }
#outline(indent:10pt,depth: 2)
#pagebreak()


#contents
\

]











#tDocument(title:[Proofs and Logic],abstract:[

Hello reader, this is a introductory document for anyone wanting to learn about the logical models of mathematics. Keep in mind I am just a undergrad. A lot of this comes from what I have learned from *Introduction to Proof Theory* by Samuel R.Buss, *Lecture 4: Frege and Extended Frege* by Toniann Pitassi give them a read!.


],contents:[
= Introduction 

Mathematical theories need to be presented in a formal system, in this chapter we will explore different logics that are used or extended in the foundation of mathematics. Due to their frequent adaptation, the details and naming conventions are not what's important but the structure and workings.
We will mainly be going over defintions and concepts, but some fun theorems will be presented.

== How to read this document

In the following 3 chapters, we will go over propositional logic, first order logic and higher order logic, exploring each in the same way;
+ First, we will go over the Synthax of the formal language that is associated
+ Then we will look at an interpretation of the Synthax, the Semantics
+ Then we will look at proofs in the domain
+ Finally we might go over some interesting theorems

== Some notes for clairity's sake

This might been covered in previous chapters, however we shall ensure it is said;
Logics are the more general systems that have a synthax (well defined purely linguistic form) a sematic (interpretation) and proofs along with their study.
Formal systems generally base themselves on a logic and provide axioms in the goal of deriving statements, however at it's basis is just a formalisation of whatever we want to study.

#pagebreak()
= Zeroth order logic (propositional logic)

This is the simplest, but also the least powerfull (we can't prove or do much with it) that we will see, it is however interresting especially in computer science (see S.A.T problem).
This logic bases everything on true and false arguments and binairy connectors.

== Synthax 

We define our alphabet as:
- Our variables $V = {p_1, p_2, ...}$ for all natural numbers
- Our constants $tack.b$, and $tack.t$ (these are also seen as propositional connectives of arity 0)
- Our propositional connectives with their arity. Often used ones include: $and$ of arity 2, $or$ of arity 2, $not$ of arity 1, $->$ of arity 2, $<->$ of arity 2. There are many more and we can even build all of them from one but that has to do with the Semantics.
  These are also called logical connectives.
\
We define the set of Formulas as:
- all elements of $V$ are Formulas.
- $tack.b$, and $tack.t$ are Formulas.
- If $A_1..., A_n$ are Formulas and $*$ is a propositional connective or arity n then $*(A_1..., A_n)$ is too.

This creates a tree like structure.\
Here are a couple examples (here they are written in infix notation, $p_1 and p_2$ instead of $and(p_1,p_2)$:\
$p_1 and not p_2$ #h(20pt) $tack.t and p_4$ #h(20pt) $p_2 and not (p_2 or p_1)$

We use the parenthesis for clarity, by convention $not$ has most priority and then $and$, followed by $or$
\
> With $x_1..., x_n$ the variables used in a Formula, the formula is essentially a propositional connective of arity $n$ however we shall reserve that name for the ones defined in our alphabet and call it a $n$ arity relation.

We can define the variables in a formula as :
- $"Var"(tack.b) = emptyset$ and $"Var"(tack.t) = emptyset$
- $"Var"(p_k) = {p_k}$
- $"Var"(*(x_1..., x_n)) = "Var"(x_1) union ... union "Var"(x_n)$

== Semantics

Here we will offer an interpretation of a formula.
We define true and false written $T, F$.
We call a truth assigment $tau$ a function $V arrow.r {T,F}$, which we can limit to be from the variables used in a certain formula ($"Var"(A)$) instead of all of $V$, this gives us the advantage of having a finite set of variables.


We then extend the value of our truth assigment $accent(tau,~)$ for any Formula by
Let $A$ be a fomula
- If $A = p_n$, $accent(tau,~)(A) = tau(p_n)$
- If $A = *(p_1..., p_n)$, a propositional connective of arity $n$ we define $accent(tau,~)(A) = accent(*,~)(accent(tau,~)(p_1)..., accent(tau,~)(p_n))$ with $accent(*,~)$ as defined bellow, in what is called a truth table.
#pagebreak(weak: true)
#grid(columns:(1fr,1fr,auto),
[
#table(columns: (auto,auto,auto,auto,auto,auto),stroke:none,
[$A$],[$B$],[$and$],[$or$],[$->$],[$<->$],table.hline(start: 0,stroke: 0.6pt),
[$F$],[$F$],[$F$],[$F$],[$T$],[$T$],
[$F$],[$T$],[$F$],[$T$],[$T$],[$F$],
[$T$],[$F$],[$F$],[$T$],[$F$],[$F$],
[$T$],[$T$],[$T$],[$T$],[$T$],[$T$]
)]
,

table(columns: (auto,auto),stroke:none,
[$A$],[$not A$],table.hline(start: 0,stroke: 0.6pt),
[$F$],[$T$],
[$T$],[$F$]
),

table(columns: (auto,auto),stroke:none,
[$tack.b$],[$tack.t$],table.hline(start: 0,stroke: 0.6pt),
[$T$],[$F$])
)

We say $accent(tau,~)$ satisfies a Formula $A$ if $accent(tau,~)(A)$ is true ($T$).
We say $A$ is satisfiable if there exists such a truth assigment, that truth assigment is called a model for $A$.
We say $Gamma$, a set of Formulas is satisfiable if there exists such a truth assigment that satisfies all of its elements.
We say $A$ is a tautology if every truth assigment satisfies $A$ we write $tack.double A$.
We say $Gamma$ tautologically implies $A$ if for every truth assigment that satisfies $Gamma$, it satisfies $A$, we then write $Gamma tack.double A$.
Notice that if $p_n in.not "Var"(A)$ then $accent(tau,~)(A)$ is independant of $accent(tau,~)(p_n)$.

#underline[Note on functional completeness]: We say a set of logical connectives is functionnaly complete if we can build every truth table with them. ${->, and, or, not, <->}$ is functionaly complete, in fact we can limit ourselves to a single connective: nand ($a,b: not (a and b)$) or a nor ($a,b: not (a or b)$).

#table(columns: (auto,auto,auto,auto),stroke:none,
[$A$],[$B$],[$accent(and,-)"(nand)"$],[$accent(or,-)"(nor)"$],table.hline(start: 0,stroke: 0.6pt),
[$F$],[$F$],[$T$],[$T$],
[$F$],[$T$],[$T$],[$F$],
[$T$],[$F$],[$T$],[$F$],
[$T$],[$T$],[$F$],[$F$]
)

== Proofs

Say we have a Formula $A$ using the variables $p_1..., p_n$ to figure out if it is a tautology, we can just test out all possibilities on say a computer. Thats "just" $2^n$ possibilities, sometimes acceptable. However, not only does it quickly get out of hand, we will also learn a method that will help us furter on, when we extend it to higher orders of logic. Proofs.

Here we will introduce some methods of prooving that we can show are both #underline[complete] (if it's a tautology we can proove it) and #underline[sound] (if it verifies the proof it's a tautology).
\
Proof theory studies how these systems interact, if they can prove the same things and the relation between the size of the proofs.

=== Substitutions, sequents, axioms and inference rules

In order to prepare for proofs we'll define some notions first.\
With $P$ and $Q$ formulas and $p$ a variable, we define the substitution of $p$ with $Q$ within $P$ ($P[Q"/"p]$) as:
- If $P = p_k in V$, $P[Q"/"p]$ is $Q$ if $p_k$ is $p$ else $p_k$
- If $P = *(x_1..., x_n)$, $P[Q"/"p]$ is $*(x_1[Q"/"p]..., x_n[Q"/"p])$
For example $(not p_1 and (p_2 or p_1))[(p_3 or p_1)"/"x]$ is $(not (p_3 or p_1) and (p_2 or (p_3 or p_1)))$
\
\
Inference rules are descriptions of how we will pass from one formula to another, written under the form $(P_1..., P_n)/accent(P,~)$  with $P_1..., P_n$ and $accent(P,~)$ formulas where the top formulas are previously deduced formulas and the bottom one is the one deduced. One famous example (probably the most used) is _modus ponens_ $(P_1, P_1 -> P_2)/P_2$. In proofs these are used to pass from one line to another.\
Axioms are a little different, they are used along with inference rules, they are formulas, along with all of their possible substitutions, for example $(phi and psi) -> phi$ where $phi$ and $psi$ denote all possible formulas. These are used within inference rules within the proof.\

For example with modus ponens as the only inference rule and $not (p_1 and p_2) -> not p_1 or not p_2$, $not not p_1 or p_2 -> p_1 or p_2$ and $not (p_1 and not p_1)$ as our axioms, we can show the law of excluded middle ($p_1 or not p_1$).
+ $not (p_1 and not p_1)$ (axiom 3)
+ $not not p_1 or not p_1$ (first line + axiom 1 + modus ponens)
+ $not not p_1 or not p_1 -> p_1 or not p_1$ (axiom 2)
+ $p_1 or not p_1$ (last two lines + modus ponens)
\
Finaly, sequents are a little like a mix between both, they are the main element in a different type of proof system called sequent calculus. They have both roles, they express things that are true $p -> p$ while also giving us a way to pass between lines of the proof.\
They have a very specific form, to write them we use a character that means "implies" called the sequent arrow, but for clarity reasons is syntaxicaly different then our logical connective $->$, it is often $tack$ or $supset$, here we will use $tack$. Sequents are under the form $P_1..., P_n tack accent(P_1,~)..., accent(P_k,~)$ which should be interpreted as $P_1 and ... and P_n -> accent(P_1,~) or ... or accent(P_k,~)$. $P_1..., P_n$ are called the antecedent and $accent(P_1,~)..., accent(P_k,~)$ is called the succedent, they are both sedents. In sequent calculus the inference rules are all under the form of $Gamma / Delta$ where $Gamma$ and $Delta$ are sequents. For example:\
$ ()/(p_1 -> p_1) #h(20pt) (p_1..., p_k -> accent(p,~)_1..., accent(p,~)_n)/(p_1..., p_k, p_(k+1) -> accent(p,~)_1..., accent(p,~)_n) $
There are also several ways to look at the sedents, such as in the form of a set of formulas, in that sense the rules of exchange ($(...,a,b,...->c)/(...,b,a,... -> c)$) are natural, while in other perspectives, they may be presented as inference rules, furthermore there may be several ways to express things like $...,a,b,...$ such as $...,A,B...$ where $A$ and $B$ are every possible formula, or $Gamma, a, b, Delta$ where $Gamma$ and $Delta$ are cedents (our cedent $Delta,a,b,Gamma$ would then be $Delta union {a,b} union Delta$).
=== Frege and Hilbert style proof system

Frege and Hilbert style proofs are general categories of systems that share usefull properties, Frege sytems are a subset of Hilbert systems, however these systems are equivalent in what they can prove, the difference is mainly minimalism compared to readability.
\
Frege systems use axioms and 
#underline[Defintion]: 
A frege style prooving system consists of a finite set of inference rules under the form $(p_1..., p_n)/accent(p,~)$, and a set of functionaly complete logical connectives, where proofs created by applying the rules of deduction with any substitutions is a sound and implicationally complete system.
\
This might seem a little vague, let's look at some examples.

=== Hilbert style

In Hilbert style proofs, there are a set of axioms under the form $ (P_1(p_1..., p_n)..., P_k(p_1..., p_n) )/accent(P(p_1...,p_n),~) $ With $P_1..., P_k, accent(P,~)$ formulas of arity $n$.
Then each step in the proof is a line written from previous lines, by substituting the axioms.

For example :$ x_1 / (x_1 or x_2), (x_1 or x_1)/x_1, (x_1 or (x_2 or x_3))/((x_1 or x_2) or x_3),(x_1 or x_2, not x_1 or x_3)/(x_2 or x_3), ()/(x_1 or not x_1) $

#underline[Example Proof]: We will show the law of excluded middle ($p or not p$) from the following inference rules :
$ a) ()/(not (p_1 and not p_1)), b) (not (p_1 and p_2))/ (not p_1 or not p_2), c) (not not p_1)/p_1, d) (not not p_1 or p_2)/(p_1 or p_2), e) (p_1 or p_2)/(p_2 or p_1) $
Followed by a couple more to make the system complete. A proof is as follows (what is in [] is not part of the proof, just explanation):
+ $not (p_1 and not p_1)$ [using axiom $a)$]
+ $not p_1 or not not p_1$ [using line 1), and axiom $b)$ by substituting $p_2$ with $not p_1$]
+ $not not p_1 or not p_1$ [using line 2) and axiom $e)$ substituting $p_1$ with $not p_1$ and $p_2$ with $not not p_1$]
+ $p_1 or not p_1$ [using line 3) and axiom $d)$ substituting $p_2$ with $not p_1$]

Axioms need not be used, for example $c)$.

#underline[_Modus Ponens_]: We will point out a very used rule, _modus ponens_ that states $(p_1, p_1 -> p_2)/p_2$.



=== Gentzen style (or PK sequent calculus)
Gentzen style is a little diffrent to Hilbert, it is a tree like structure of sequents.



== Theorems


=== Canonical form
This is a way to normalise formulas, in order to simplify encoding for solving with computers (or without).

#underline[minterm]: Is a conjunction ($and$) of $n$ variables such that for each variable $x_k$ in $x_1..., x_n$, $x_k$ or $not x_k$ is used. For example $x_1 and x_2 and not x_3 and x_4$ (aka a product term in which each variable appears once)\
#underline[maxterm]: Is a disjuction ($or$) of $n$ variables such that for each variable $x_k$ in $x_1..., x_n$, $x_k$ or $not x_k$ is used. For example $x_1 or x_2 or not x_3 or x_4$ (aka a sum term in which each variable appears once)\
#underline[minterm canonical form (SoP (or sum of products))]: Is a sum term of minterms.\
#underline[maxterm canonical form (PoS (or product of sums))]: Is a product term of maxterms.\

Each formula of arity $n$ as an equivalent maxterm and minterm of arity $n$.

=== SAT Problem (Satisfiability)

The SAT problem is, given a formula of arity n, can we find an interpretation that satisfies it. This is NP complete. It is interesting to note for historical reasons that this is the first reference (or at least first proof of) and NP complete problem.





#pagebreak()
= First order logic (quantification or predicate logic)

This is one of the most frequent logic systems and incredibly powerfull, it remains complete and sound but it is much more flexible than zeroth order logic. It can also be seen as an extension based on quantification.

== Synthax

Our alphabet consists of:
- logical symbols
  - variables $p_1, p_2, ...$ indexed by $NN^*$
  - logical connectives from zeroth order logic (a functionally complete set)
  - the qantifiers: $forall$ and $exists$
  - an optional $=$ symbol

- non-logical symbols
  - predicate (aka relation) symbols, for each arity n there are an infinity indexed by $NN^*$: $R_1^n, R_2^n, ...$
  - function symbols, for each arity n there are an infinity indexed by $NN^*$: $f_1^n, f_2^n, ...$, note that functions of arity $0$ are called constants
\
We define
- Terms:
  - all variables are terms
  - if $f_k^n$ is an $n$ arity function and $t_1,... t_n$ are terms $f_k^n(t_1,... t_n)$ is a term
- Formulas (aka well formed formulas)
  - if $P_k^n$ is an $n$ arity relation and $t_1,... t_n$ are terms $P_k^n(t_1,... t_n)$ is a formula
  - if using $=$ and $t_1, t_2$ are terms then $t_1 = t_2$ is a formula
  - if $*$ is an $n$ arity logical connecive and $alpha_1,... alpha_n$ are formulas then $*(alpha_1,... alpha_n)$ is a formula (though oft in infix notation)
  - if $phi$ is a formula and $x$ is a variable then $forall x . phi$ and $exists x . phi$ are formulas (the . is oft ommited or parenthesis are used)
\
For example, in peano arithmetic, we have two functions, $S$, the successor function of arity $1$, and $0$ of arity $0$.
In ZF we have $in$ as a relation.
It is important to note that the notion of funciton and relation here is one level above the objects in the universe, we might not be able to construct the sets of all sets but we can construct a relation over all sets without a problem.
Note also that functions can be built as relations with the added axiom that there is at most one (from the point of view of $=$) second value for all first values.

=== Free and bound variables:
For substitutions within a formula we first define free and bound variables inductively. It must be noted that 

#underline[Free variables]:
- $"Free"(p_n) = {p_n}$
- $"Free"(tack.b) = emptyset$ and $"Free"(tack.t) = emptyset$
- $"Free"(*(x_1,... x_n)) = "Free"(x_1) union ... union "Free"(x_n)$
- $"Free"(forall p P) = "Free"(P)\\{p}$ and $"Free"(exists p P) = "Free"(P)\\{p}$

#underline[Bound variables]:
- $"Bound"(p_n) = emptyset$
- $"Bound"(tack.b) = emptyset$ and $"Bound"(tack.t) = emptyset$
- $"Bound"(*(x_1,... x_n)) = "Bound"(x_1) union ... union "Bound"(x_n)$
- $"Bound"(forall p P) = "Bound"(P) union {p}$ and $"Bound"(exists p P) = "Bound"(P) union {p}$


== Semantics

Next we will define an interpretation for out logic. We define the (nonempty) universe $Omega$ the set of all objects we work on, for each function of arity $n$ used we define a function from $Omega^n$ to $Omega$, and for each relation symbol of arity $n$ we define a relation over $Omega$ (a subset of $Omega^n$). We also define truth tables for our logical connectives.\
Please note that the $=$ symbol is usualy considered equality over the universe, however there is an alternative definition as a relation with the following axioms:
- Reflexivity: $forall x . x = x$
- Symmetry: $forall x forall y . x = y <-> y = x$
- Transitivity: $forall x forall y forall z . x = y and y = z -> x = z$
- Substitution: with $R$ a $n$ arity relation $forall x_1 ... forall x_n forall y_1 ... forall y_n . x_1 = y_1 and ... and x_n = y_n -> (R(x_1..., x_n) <-> R(y_1..., y_n))$ and with $f$ a $n$ arity function $forall x_1 ... forall x_n forall y_1 ... forall y_n . x_1 = y_1 and ... and x_n = y_n -> (f(x_1..., x_n) = f(y_1..., y_n))$.
Furthermore constants like $tack.b$ or $tack.t$ can be represented by a function of arity $0$.
\
We can now define the truth function of formulas for first order logic, inductively much like prepositional logic.
- With $R$ a $n$ arity relation and $t_1..., t_n$ terms then $tau(R(t_1..., t_n))$ is True if $(t_1..., t_n)$ is in the set associated to $P$ else False.
- With $*$ a $n$ arity logical connective we do as prepositional logic
- With $P$ a formula, $forall p . P$ is True if $tau(P)$ is true for $p$ taking any possible value in $Omega$ else false, and $exists p . P$ is true if there exists a value in $Omega$ $p$ could take such that $tau(P)$ is True, else False

== Proofs
Proofs in first order logic are usually extended versions of prepositional logic with the addition of axioms handling $forall$ and $exists$ such as:
$ P(p_1) -> exists p_2 P(p_2), #h(20pt) forall p_1 P(p_1) -> P(p_2) $ 
 
= Second order logic

This will be added later on

= Higher order logic (aka Simple type theory)

This will be added later or in the typw theory segment

])