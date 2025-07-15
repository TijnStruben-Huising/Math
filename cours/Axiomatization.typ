

#let tDocument(
  title:[Title],
  authors:[Tijn Struben-Huising],
  authors_intro:"Author: ",
  contacts:[tijn.strubenhuising\@gmail.com],
  contacts_intro:",  Contact: ",
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
#outline(indent:true,depth: 2)
#pagebreak()


#contents
\

]











#tDocument(title:[Formal Systems in mathematics],abstract:[

In this document we will talk about Axiomitasation and a lot of Gödel. Keep in mind I am just a undergrad.
Although this is the first of my chapters on formal systems and mathematics, I would recommend familiarising yourself with my chapter on logic.

],contents:[


= Introduction

Mathematics destinguishes itself from other sciences by its proofs. You could sit in an room with but a paper and a pencil and devise all of mathematics. Such is not the case for scientific fields such as physics or biology. Furthermore these proofs seem to give us absolute certainty. However the actual objects behind these proofs and therefore all of mathematics are often hidden away. \

It is also important to note that there is no certainty in this world, so it's interesting to look at these foundations and judge for yourself if they are rigourous enough.
\

I will present all of this in a series of chapters, assembling information I have researched on the subject from many sources into a small introductory guide. This one goes over the main ideas in the foundations, the chapter on logic goes over some powerful tools, and the chapters on set theory and type theory go over different foundations using their respective theories.

== Classification of mathematical foundations

Let's look at some related domains of study.
The important thing to understand is that they provide framworks for mathematical work and will use the logic introduced here as foundations to their theory, however in slighly different ways.

- Model theory
  studies the links between formal systems and models that satisfy them. (These terms will be defined later.)

- Proof theory
  studies the proofs in formal languages. What can we prove, and what we can prove that we can't, but also the lengths of proofs and the computerisation of proofs.

- Type theory.
  This is a collection of formal systems for mathematics basing themselves on defining objects as having a type. This is especially used in computer assistred proofs. Instead of axioms it has rules of inference.

- Set theory.
  This is another collection of formal systems, where everything is a set. This is often more powerfull (in terms of what we can prove) than type theory but also more prone to problems such as paradoxes and studies different things.

We will mainly be going over notions from proof theory and model theory in this chapter.

== Definitions and considerations

Before diving into the subject, let me adress a few definitions and problems.
We are exploring the foundations so we have no mathematics yet to work with, so proofs will not be perfectly rigourous and neither will defintions be, however, we do our best. Furthermore notions such as sets will be used both formally and informally. For example we would define sets in set theory while talking about the set of symbols in our language with an informal definition of sets. It is important to distinguish both.
The definitions are pretty loosely followed and used by different authors, however the internal logic is always more or less the same. For examples of models and tautologies see *Zeroth order logic* from the *Logic* chapter.

#underline[Formal language]:  A formal language a is set of possible sentences you can build from a defined alphabet following certain rules.\
An example would be with the alphabet $Sigma attach(=,t:"def") {0,1}$ the language defined by:
- $1$ is a sentence in the language
- if $alpha$ is a sentence in the language than so is $alpha 1$ and $alpha 0$
This language is essentially the set of all finite combinations of $0$ and $1$ starting with $1$ so the binairy numbers (except for 0).
Furthermore the word formula is often used in the place of sentence.\

#underline[Formal system]: Is a formal language with axioms and inference rules.

#underline[Inference rules]: Set of rules with which we can pass from one set of formulas to another in a finite amount of steps. Called our proof. If $Gamma$ is our first set, and $Delta$ is our second then we write $Gamma tack Delta$, or $Gamma attach(tack, b: cal(P)) Delta$ with $cal(P)$ referencing our inference rules (if there are several or for clarity)). We often call $Gamma$ our axioms, one frequent case is $Gamma = emptyset$, in that case we write $tack Delta$ (or $attach(tack,b:cal(P)) Delta$).

#underline[Universe]: This is the set of objects over which our variables range over, it is defined implicitly or explicitly by the formal system, this could be natural numbers. Our variables are specific characters in a formula defined by our interpretation.

#underline[Syntax]: The Syntax of a logical framework is the Formal theory in which it is written. (The formal language for the most part).

#underline[Semantics]: The Semantics is how we are going to give it meaning, interprete it. We will associate structures to it and say wether they hold or not. In that goal we define truth functions, a semantic interpretation will yield a set of truth functions.

#underline[Truth function]: This is a function that takes in a formula and returns True or False. Usually this is done by defining all the variables as objects in the universe and then applying the other synthaxical objects defined by the semantix. \
For example, in the sentence $x=y$ over the universe of natural numbers, a possible truth function $tau$ could be assigning $x$ as $3$ and $y$ as $4$ in which case $tau(\"x=y\") = "False"$. In a different semantical interpretation, we could also have the $=$ symbol be defined in the truth function. Also note that the $=$ we use in $tau(...) = "False"$ and $x=y$ is different in nature.

#underline[Satisfies]: With $tau$ a truth function and $gamma$ a sentence, we say $tau$ satisfies $gamma$ if $tau(gamma)="True"$. Furthermore if $Gamma$ is a set of sentences we say $tau$ satisfies $Gamma$ if $tau(gamma)="True"$ for every $gamma$ in $Gamma$. We say $Gamma$ is Satisfiable if there exists such a truth function.
 
#underline[Tautology]: With $Gamma$ a set of sentences (or one sentence $gamma$, but in that case we consider $Gamma ={gamma}$). We say $Gamma$ is a tautology if for all formulas $gamma$ in $Gamma$, for every truth function $tau$ our semantical interpretation provides $tau(gamma) = "True"$ ($tau$ satisfies $Gamma$). We write $tack.double Gamma$.\
One example could be over the universe of natural numbers and with the $=$ symbol defined in a usual manner, $x=x$ is a tautology because every truth function will just be assigning a natural number to $x$ and so for every truth function $tau(\"x=x\") = "True"$.

#underline[Implies]: With $Gamma$ and and $Delta$ sets of sentences, we say $Gamma$ implies $Delta$ if for every truth functions $tau$ that satisfies $Gamma$, $tau$ satisfies $Delta$. We write $Gamma tack.double Delta$.

#underline[Formal theory]: Might refer to formal systems or just the axioms. (If we use it, it will be as a synonym here.)

#underline[Model]: So far we have used the word truth function, often it is devided into a structure (individual functions for different parts of the language). Furthermore this structure may also reference the universe. A model for a sentence is a truth function or structure for which the sentence is verified.

#underline[Logic]: A logic system is much like a formal system but often simpler with true/false as affirmations and without complex mathematical objects. A formal system used in mathematics will often build on a logic.

= A historical note

Attempts at mathematical riguour have been constant throughout history with varying degrees of success, such as Euclid using a small set of axioms to deduce the geometric theories he wrote about (5 axioms, however some are still attempting to prove the 5th axiom from the first 4). Others prefer to rely on what is intuitively true. However, these aproaches were never unified and a problem emerged.

#underline[The Foundational Crisis of mathematics]\
The end of the 19th century spelled a great deal of loss and gain for mathematics, as numerous paradoxes and problems were discovered. On the one hand, we have the infamous Russel paradox destroying the then established set theory, and on the other hand, Gödel's incompleteness theorems showing that much cannot be proven.
\
In responce, many new fields sprouted up such as mathematical logic. And many systems were proposed to serve as the foundations of mathematics. Although Zermelo-Fraenkel set theory (ZF) remains the default, not only is it important to understand the rich ecosystem of mathematical logic but also other systems have there uses, such as type theory which is particularly important in computer proof verification.

= What is it we want from a formal system

As explained, we will explore different examples of formal systems in our chapters on logic, set theory, type theory and possibly more in the making, but we must ask ourselves, what makes a good formal system ? If our goal is the foundation of mathematics, it must be _consistent_ (this will be defined) and be able to prove useful theories. We will list some interesting systems to be able to emulate, and explore some properties.




== Peano arithmetic

Peano arithmetic (or PA) is one of the simplest constructs to implement and is very powerfull. We are essentially building natural numbers and arithmetic. Here we will show the axioms with an example in second order logic with an unspecified form of set theory.\

PA is generaly framed in first order logic thought if so needs an infinite amount of axioms (axiom schema will later be defined), second order logic may help here and provide more power but is not needed.\
It considers a constant $0$, a function $S$ of arity $1$ called the successor function, along with two more functions of arity $2$, $+$ and $times$. Furthermore we have the following axioms.
- $0$ is the successor of nothing $forall x, not (x = S(0))$
- Unicity of the successor function $forall x forall y, S(x) = S(y) -> x = y$
- Definition of addition $forall x, x+0 = x$ and $forall x forall y, x + S(y) = S(x + y)$
- Definition of multiplication $forall x, x times 0 = 0$ and $forall x forall y, x times S(y) = x + x times y$
- Axiom of induction :for all formula $phi$ of arity $n+1$, $forall x_1..., forall x_n, (phi(0,x_1...,x_n) and forall m (phi(m,x_1...,x_n) -> phi(S(m),x_1...,x_n))) -> (forall m phi(m,x_1...,x_n))$
\
Note that this is with equality defined as more than just a logical predicate, but equality over the universe, else we would have to add:
+ equality is transitive, reflexive and symmetric and $NN$ is closed under equality that is to say $forall x forall y  x in NN and x = y -> y in NN$, and that is holds through all functions and relations ($a = b -> f(a) = f(b)$ and $a = b -> (P(a)<->P(b))$)

With natural numbers and some ways to work with sets, say build functions and pairs, we can build real numbers, and a huge part of mathematics. Therefore it is usualy one of most central elements to be able to emulate in a formal system.


== Soundness and completeness

A formal system offers a means of inference, so we have defined two important notions :
#underline[Weak soundess/Strong soundess]: A system has weak soundess if for any formula $gamma$ that we can prove ($tack gamma$), it is a tautology $tack.double gamma$. The system is strongly sound if this is true while adding a set of formulas as axioms (if $Gamma tack gamma$ then $Gamma tack.double gamma$ with $Gamma$ a set of formulas and $gamma$ a formula). This might seem obvious but there is no real restriction forcing our proof system to be "true", this is how we define it.
#underline[Soundness]: When we say a system is sound we usually mean strong soundess. 

#underline[Arithmetic soundess]: With a system implementing PA, a proof system is arithmetically sound if for every integer $n$ and formula $P(n)$, if we prove $tack P(n)$ then $tack.double P(n)$

#underline[Completeness]: A system is complete if for every tautology we can build a proof of it. (essentially we can prove everything that is true). More formally, for all formulas $P$, $attach(tack,b:cal(F)) P$ or $attach(tack,b:cal(F)) not P$ (with $not$ the negation symbol seen in *Logic*).

#underline[Strong completeness]: Much like completeness, this is if for every set of formulas $Gamma$ and $Delta$ if $Gamma tack.double Delta$ then we can prove $Gamma tack Delta$.

=== Gödel's First incompleteness theorem
Completeness however usefull is lost with more complex systems, notably those interpreting PA.
It states that a consistent (one where you cannot prove $A and not A$, we will go over this in more detail later) formal system that has PA is not complete.
\
This is often proven by using a logic similar to the liars paradox (This sentence is a lie!) to do so, we construct what is called a Gödel sentence (there are an infinite amount) for the system $cal(P)$, written ($G_cal(P)$).
What we do is we associate a natural number to all formulas by associating syntaxical symbols to integers. Once again we can extend to finite sets of formulas (and therefore proofs). We can then construct a formula referencing itself (because we have natural numbers) and then construct a formula saying "This formula has no proof" ($not exists n . "is a proof of this"(n)$). If our system is sound and consistent, then we cannot formulate a proof for our Gödel sentence else it would be inconsistent.

== Consistency

#underline[Consistency]: A system is consistent if we cannot prove (infer) $A and not A$ for a formula $A$.

#underline[$omega$-inconsistent]: If there is a predicate $P$ such that the system proves $P(n)$ for all natural numbers $n$, but there exists $m$ such that it proves $not P(m)$. One need not find that interger simply prove it exists. This is independent of arithmetical soundness.

#underline[$omega$-consistent]: An arithmetic (Peano) system that is not $omega$-inconsistent (this implies consistency but the inverse is false).


=== Gödel's Second incompleteness theorem

Gödel's Second incompleteness theorem shows that we cannot prove that a certain system is consistent within that system if the proof system is strong enough. What are the requirements for strong enough ? Those are called the Hilbert-Bernays conditions.\
Let $\#phi$ be the Gödel number of a formula and $"Prov"(n)$ a formula that says that there exists a Gödel number of a proof of the formula of Gödel number $n$. The conditions are:
- That if we can prove $phi$ then we can prove $"Prov"(\#phi)$.
- We can prove $"Prov"(\#phi) -> "Prov"(\#"Prov"(\#phi))$
- We can prove modus ponens, that is to say: $"Prov"(\#phi -> \#psi) and "Prov"(\#phi) -> "Prov"(\#psi)$
\
As we have shown we cannot prove $G_cal(P)$ and therefore $G_cal(P)$ is true (if $cal(P)$ is consistent). With $"Con"(cal(P))$ the formula denoting that the system is complete ($not exists n "such that "n" proves" A and not A$) we have therefore $"Con"(cal(P)) -> G_cal(P)$ so if we can prove $"Con"(cal(P))$ along with modus ponens, we can prove $G_cal(P)$ which is absurd (inconsistent).


== Category theory

Some axioms in category theory are powerful enough to serve as the foundations of mathematics, and have certain needs from set theories that try to express it (ZF is insuficient). However this deserves its own chapter.

== Finite Axiomatisation

A description of finite axiomatisation is given on the section on set theory, I will repeat much of it here.

When we describe an axiom, we might say : for all relations $phi$ whe have $...$ however, although this is one axiom in second order logic, this isn't in first order logic. An axiom schema is all the formulas that we use as axioms so we would have our previous sentence but for all possible $phi$, an infinite amount.

We say something is finitely axiomatisable if it's axiom schema is finite. This is especially usefull for computer assisted proofs and theorems on finitely axiomatisable systems.

])