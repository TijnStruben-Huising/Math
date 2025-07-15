

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
#outline(indent:true,depth: 2)
#pagebreak()


#contents
\

]











#tDocument(title:[Set theory],abstract:[

Hello reader, this is meant for my bizuth and others wanting to learn. Keep in mind I am just a undergrad. Consider reading *Proofs and Logic* first


],contents:[

= Introduction

Lets go into a little depth about a domain of mathematical logic, set theory. Set theory studies sets, a way of collecting elements together but defined differently depending on the axioms. The main interests are arithmetic based, around the cardinality (size) of sets and contructability.

Here we will go over different axiomitazations and some theorems.

#pagebreak()


= Ordinals and cardinality

It would be fun to jump right into the different commonly used theories but first we must adress some important theoretical notions around cardinality and ordinals.

#underline[Finite]: Can be defined as: there is only one element in $cal(P)(X)$ isomorphic to $X$.

== Ordinals

=== Von Neumann definition

= ZF (and ZFC)

It is impossible to talk about sets without talking about Zermelo-Fraenkel, probably the most popular set of axioms around sets.

== Axioms 

These axioms are stated in first order logic.
We add the binairy propositional connective $in$
We also consider that at least one set exists (this is usualy taken care of by $exists x(x=x)$ and the nonemptyness of the domain)

=== List of axioms

+ Axiom of Extensionality
  $ forall x forall y ((z in x <-> z in y) -> x = y) $
  This basically "defines" equality for sets, if they share all elements
  This is used when = is consiedred to be a binairy propositional connective rather than equality over the domain.

+ Axiom of empty set
  $ exists x forall y not(y in x) $
  We will call this x the empty set ($emptyset$) (axiom of Extensionality gives us its unicity)

+ Axiom of Pairs
  $ forall x forall y exists w forall z(z in w <-> (z = x or z = y)) $
  This axioms lets us construct ${a,b}$ for all sets $a$ and $b$

+ Axiom of Power Set
  $ forall x exists y forall z (z in y <-> (forall w (w in z -> w in x))) $
  This can be refomulated with $x subset y$ defined as $forall w (w in x -> w in y)$
  $ forall x exists y forall z (z in y <-> z subset x) $
  This axiom helps us construct the power set often written $cal(P)(x)$
  
+ Axiom of Unions
  $ forall x exists y forall z (z in y <-> exists w (w in x and z in w)) $
  This axiom lets us take the union of all sets in x.

+ Axiom of Infinity
  $ exists x (emptyset in x and forall y (y in x -> {y,{y}} in x)) $
  With ${y,{y}}$ the element composed of the use of the axioms of pairs on $y$ and $y$ and then $y$ and the result of that.

  This is a very powerfull axiom because we now have an infinite set, so we can build the natural numbers as a subset of that, speaking of subsets...

  It will look a little like ${{{{{emptyset,emptyset},emptyset},emptyset},emptyset},emptyset}$

+ Axiom of Seperation (aka restricted comprehension or specification)
  For every formula in ZF $phi$, with $x,z, w_1... w_n$ free in $phi$ and $y$ not free in $phi$\
  $ forall z forall w_1... w_n exists y forall x (x in y <-> (x in z and phi(x,w_1...,w_n,z)))$
  With this we can build a subset of $z$ with a formula.

+ Axiom of schema Replacement
  For every formula in ZF $phi$, with $X,x,y, w_1... w_n$ free in $phi$ and $B$ not free in $phi$\
  $ forall X forall w_1... w_n( forall x (x in X -> exists! y phi(y,x,w_1..., w_n)) -> exists B forall x (x in X -> exists y (y in B and phi(y,x,w_1..., w_n)))    ) $
  Bascially, if for all $x in X$ there is a unique set y holding then we can build the set of all of those sets.

+ Axiom of Foundation (aka regularity)
  $ forall x exists y (y in x and not (exists a (a in x and a in y)))$
  With pairing and union we now have $forall x (x in.not x)$ and an ordinal rank.
  Furthermore we have removed loops from sets (infinitely descending).
  To note, this axioms restricts sets quite a lot but it makes it a lot easier to work with.


- From here on we will start to write things like $forall x in X ...$ instead of $forall x (x in X -> ...)$


=== Choice of axioms

A lot of these axioms imply one another:
- if at least one set exists, Seperation implies existence of $emptyset$
- The axiom of infinity often has the empty set defined within it, therefore forgoing the need for that axiom.
- Replacement and Powerset give us pairing

You can keep all of these axioms but I will propse the usage of:

+ Axiom of Extensionality
+ Axiom of Foundation
+ Axiom of Power Set
+ Axiom of Union
+ Axiom of Infinity (with Empty Set version)
+ Axiom of Restricted Comprehention
+ Axiom of Replacement
 
But it doesnt really matter, we could use less.

Furthermore many set theories are just weakend verions of ZF, for more security but less power (General set theory is just strong enough for arithmetic).


== Axiom of choice

So, is that all folks?

Well, as the great Yoda once said... *No... There is another*
But this one is controversial so oft omitted, Here we will show a couple versions of it and consequences along with consequences of not having it. Without it we write ZF the set of axioms, with it we write ZFC

=== Classic formulation

So suppose you have 42 nonempty sets and you want to add one element from each set to build a new set, you can do this, with $a_1..., a_42$ these sets $(a_1 eq.not emptyset and ... and a_42 eq.not emptyset) -> (exists x_1 (x_1 in a_1)) and ... and exists x_42 (x_42 in a_42)$ now we either apply the pairing axiom of the replacement axiom on $x_1..., x_42$.
But $...$ is doing some heavy lifting here, with 42 we can just write it out, but does it hold true for an infinite amount? That is the axiom of choice.

$ forall x (emptyset in.not x -> exists f (f in X arrow.r.bar union_(A in X) A and forall A (A in X -> f(A) in A))) $

- Construction of a function:\

  Lets start by constructing an ordered pair $(a,b)$ as ${a,{a,b}}$ then the (cartesian) product between two sets $A times B$ defined as
  $ {x in cal(P)(cal(P)(A union B)) : exists , exists b (a in A and a in B and x = (a,b))} $ 
  this works because for all $a in A, b in B$ $(a,b) in cal(P)(cal(P)(A union B))$, this is essentially ${ (a,b) : a in A, b in B}$

  Next we can define a function as a subset of $A times B$ such that $forall a in A, exists! x in A times B, exists b in B, x = (a,b)$
  Written $f in A arrow.r.bar B$

=== Well ordering theorem

The well ordering theorem is an important equivalent axiom of choice in ZF.
#underline[Ordering]: An ordering is a relationship over a set (if $E$ is a set, a relationship over $E$ is exactly a supset of $E^2$), that has the properties of reflexivity, transitivity, antisymmetry and , which is to say:
With $E$ a set, $R subset E^2$ is a ordering if:
- $forall x in E . (x,x) in R$
- $forall x in E forall y in E forall z in E . (x,y) in R and (y,z) in R -> (x,y) in R$
- $forall x in E forall y in E . (x,y) in R and (y,x) in R -> x = y$
From here on we will write $x <= y$ to say $(x,y) in R$ when $R$ is clearly stated.
#underline[Total ordering]: A total ordering over $E$ is an ordering such that :
- $forall x in E forall y in E . x <= y or y <= x$ meaning, any two objects can be compared.
#underline[Well ordering]: A total ordering over $E$ is a well ordering if for every subset of $E$ there is a least element :
- $forall A subset E exists x in A forall y in A . x <= y$
(a well ordered set is often called a woset)
\

The well Ordering Theorem states that every nonempty set can be well ordered.


This brings us to a really usefull notion:
#underline[Transfinite induction]

#underline[Proofs sketches]
- #underline[proof from AC]: Let $E$ be a set and $f$ a choice function over $cal(P)(E) \\ emptyset$ (meaning ${x : x in cal(P)(E) and x eq.not emptyset}$), we will define a "bijection" between elements of $E$ and ordinals :
For every ordinal $alpha$ we define $a_alpha$ as $f(A \ {a_zeta : zeta in alpha})$
And we write $a_alpha < a_beta$ if $alpha in beta$

- #underline[Proof of AC from WOT]: We can take the smallest element as the choice function. The important part is to order over the union of the sets, and not each set individualy.

=== Zorns lemma

Zorn's lemma is another fun equivalent to the AC

Zorn's lemma states that for a set $E$ and an ordering $<=$ if for every subset of $E$ where $<=$ is a total order, there exists a maximal element, then there exists a maximal element to $E$\
$forall E eq.not emptyset forall R subset E^2 . ((forall x in E . (x,x) in R) and (forall x in E forall y in E forall z in E . (x,y) in R and (y,z) in R -> (x,y) in R) and (forall x in E forall y in E . (x,y) in R and (y,x) in R -> x = y)) -> (forall A subset E . (forall x in A forall y in A . (x,y) in R or (y,x) in R -> (exists z in A . not exists w in A . (w,z) in R)) ) -> exists x in E not exists y in E . (y,x) in R$
(That was fun to write)

#underline[Proofs sketches]

- #underline[proof from AC]: 

- #underline[Proof of AC from Zorn's lemma]: With the hypothesises of Zorn's lemma : 



=== Consequences and fun!

A couple other noteworthy equivalents include :
- All vector spaces have a base

Weaker forms: depenant choice

== Continuum hypothesis

== Consistancy

It must be noted by Godels work that ZFC and ZF cannot prove its own consistency (the fact that one cannot prove $A and not A$), but this is deemed unlikely. It is however immune to common paradoxes.
Furthermore, it can be shown that ZF does not decide the axiom of choice or the Continuum hypothesise, that is to say that if ZF is consistent then so is ZF with AC, ZF with $not$AC, ZF with CH and ZF with $not$CH.

== Tarsky

= New Foundations (NF)

This one is my favorite, the Hindenburg with seatbelts of set theories.
Is a first order logic theory that resembles naive set theory.

== Naive set theory
So, let's talk about the Hindenburg. Naive set theory is a collection of theories in informal languages around sets. They tend to be very simple, much like our New Foundation and strongly use the ability to be able to arbitrarily decide what a set contains.
It kind of makes sens, say you have a predicate $phi$ that tells you wether an element is in a set or not, you just have $x in X <-> phi(x) = 1$.
We can simply write that ${x : phi(x)}$, so say ${x : y in x}$ is the set of all sets containing y. but this is when shit hits the fan. Take ${x : x in.not x}$ seems fine no? Let's call that set $A$. The question is, does $A in A$ in both cases we have a problem. This is called Russel's paradox.

== Base axioms

Let's now have a look at NF's axioms... there are 2, far shot from the 8-10 of ZFC

It is first order logic with the $in$ and $=$ predicates
+ Extentionality
  $ forall x forall y . (x = y <-> forall w . w in x <-> w in y) $
  Same as in ZF
+ Restricted axiom schema of comprehention
  For each stratisfied formula $phi$,
  $ exists X forall x . x in X <-> phi(x) $
  - A stratisfied formula is there exists a function from $phi$'s synthax to $NN$ with, if \"$x in y$\" is present then $f(x) = f(y) + 1$ and if \"$x = y$\" is present then $f(x) = f(y)$. (notice that this is for a variable in its scope not all variables with such a name).
  Thus $forall x forall y . (exists w . w in x and x in y) -> (exists w . w in y)$ is stratisfied but not $forall x . x in x$

Please note that this is not well founded!
Furthermore, the statement of the axioms are not first order, but second order, or first order with a seperate metalogic, so it is not complete.

== Finitely statable axioms

This however can be put in a more usefull form with more axioms. We can eliminate the need for infinite axiomatisation.
What is finite or infinite axiomatisation ? 

Let's define the axiom schema as the set of phrases in our language used as axioms. ZF has an infinite amount. Why thought, it only had 7-9 axioms ? Well, the axioms of replacement and separation are both stated for all formulas, which are infinite in number. Here we can actually use a finite amount of phrases in our axiom schema.

We do this by proposing a seperate state of finitely axiomatizable axioms and prooving the restricted axiom schema of comprehension as a theorem.

These axioms are :

+ Extensionality
  $ forall A  forall B . A = B <-> forall x . (x in A <-> x in B) $

+ Singleton
  $ forall x exists accent(x,~) forall a . a in accent(x,~) <-> a = x $
  Basically for all $x$ we have ${x}$

+ Union
  $ forall A forall B exists C forall x . x in C <-> x in A or x in B $

+ 
+ Complement set
  $ forall A exists B forall x . x in A <-> not ( x in B) $
  We write $A_C = { x : x in.not A}$
  From this we can conclude the existance of the univeral set $V = {x : x = x} (= A union A_C)$

== Relationship to AC

= Construction of $NN, ZZ, QQ, RR$
We will get back to other set theories, similar to ZF, but first we shall apply ZF to build the sets we are familiar with!
== $NN$
We can very easily create implement PA, due to the axiom of infinity giving us the existence of a set that will contain our $NN$.\
We define $0$ as $emptyset$, $1$ as ${emptyset}$, $2$ as ${emptyset,{emptyset}}$, $3$ as ${emptyset,{emptyset,{emptyset}}}$ and so on, such that $n+1$ is ${n} union n$. Althought the axiom of infinity isn't necessairy here, it gives us a set containing all these elements.\
If we want to extract $NN$ exactly from our infinite set we'll call $I$ (this isn't a recognized notation) we will have to use the axiom of schema specification, the property to define a set as finite will be:
$phi(n) attach(=,t:"def") (exists m space space n = m union {m}) and (forall m in n (m = emptyset or exists k in n space space m = k union {k}))$. Notice the first part of this avoids $n$ being a limit ordinal and the second part avoids it containing one. So we can define $NN$ as ${n in I : phi(n)}$.\
\
To define addition we will use recursive functions (see first order logic on recursive functions). We have $n+1$ as the successor of $n$, and if $n eq.not 0$ we can define $n-1$ as the only $m$ such that $m + 1 = n$. Next we can work on generalising addition.\
$ n + m attach(=,t:"def") cases(n "if" m = 0, (n+1)+(m-1) "else") $
And then multiplication.
$ n times m attach(=,t:"def") cases(0 "if" m = 0, n+n times (m-1) "else") $

== $ZZ$

Now let's look at two methods to build $ZZ$.\
\
The first one is simple but a little brutish. We take $ZZ attach(=,t:"def") NN$ and for every element in $ZZ$ we say it is positive if even, negative if odd, and the "value" of $n$ is $n/2$ if $n$ is positive or $(n+1)/2$ if odd. We can then accordingly build our operators $+$ and $times$.\
\
The second way is a little more fun, it uses equivalency classes of $NN^2$.\
#underline[Equivalency relationship]: Let $R$ be a relationship over $A$ (here we will consider the set based defintion of relationship, but it holds for first order logic version) that is to say a subset of $A^2$ for which we write $x R y$ if $(x,y) in R$ for $x,y in A$. A relationship is a equivalency relation if it is:
- Reflexive ($forall x in A, x R x$)
- Symmetrical ($forall x,y in A, x R y <-> y R x$)
- Transitive ($forall x,y,z in A, (x R y and y R z) -> x R z$)
Some well known examples are $=$, $eq.triple$, and $<->$.\
#underline[Equivalency classes]: We can show that, for a set $A$ with a equivalency relation $R$, we can show that there exists a partition of $A$ (A set $B subset cal(P)(A)$ such that $emptyset in.not B$, and $forall x in A space space exists ! X in B space space x in X$) such that $forall X in B, forall x in X, y in X <-> x R y$. For example, with $NN$ as our set, the relation $x eq.triple y [2]$ is an equivalency relation and the equivalency classes are the set of even numbers and odd numbers ${{1,3,5,...},{0,2,4,...}}$.\
\
We take $NN^2$ and the relation defined over it by $(a,b) R (c,d) attach(<->,t:"def") a + d = b + c$ (mind that $R$ is a subset of $(NN^2)^2$ and not $NN^2$). It's easy to verify that this is in fact a equivalency relation.\ We then define members of $ZZ$ as equivalency classes. This ends up working great, and the equivalency class of the result of $(a,b),(c,d) arrow.bar (a+c,b+d)$ is independant of the representatives of each equivalency class.\
For all $n in NN$ their equivalent in $ZZ$ is the equivalency class of $(n,0)$ and a number $(a,b)$ is said to be negatice if $a <= b$.
== $QQ$
With $ZZ$ defined, we can build a lot of algebra, which can be usefull for building $QQ$.
Once again I'll propose two ways, but these are a lot closer to each other.\
\
The first one, much like our last construction of $ZZ$ will use the equivalency classes of $ZZ times NN^*$ for the relation $(a,b) R (c,d) attach(<->,t:"def") a times d = b times c$.
\
The second one is just taking the subset of $ZZ times NN^*$ such that $forall (a,b) in QQ, a "^" b = 1$. (This is just taking one element from each equivalency class of the previous construction, in this case the elements whith minimal second element).
== $RR$
This is where it gets interesting, all the previous structures have the same cardinality, this one is different. Furthermore I will explain two drastically different constructions.\
\
First lets do this with cauche sequences, these are sequences such that $forall epsilon > 0 exists N in NN forall n,m in NN, n >= N and m >= N -> abs(a_n - a_m) <= epsilon$. This property is often equivalent to convergence (such as in real numbers) but not in all sets.\
To build $RR$ here, we build the equivalency classes of cauche sequences of $QQ^NN$ where equivalecy means $a_n - b_n attach(->, b:n->infinity) 0$. All classic operations work great and contrairily to $QQ$, all cauchy sequences converge within the set.\
\
The other method I will explain uses Dedekind cuts. A cut is a nonempty set $A subset.neq QQ$ such that:
- A is closed downwards ($forall x in A, forall y in QQ, y < x -> y in A$)
- A has no maximum ($not exists m in A, forall x in A, x <= m$)
= Von Neumann\-Bernays\-Gödel 

It is what we call a conservative extention of ZFC, which is to mean that is is a supertheory (keeps axioms and predicates and adds more) but prooves no new theories therefore proves exactly the same. It's interesting because it is easier to work with.

To do this NBG adds classes. They are essentially collections of sets defined over formulas. For example $ forall x . x not in x $ is the class of all sets not containing themselves, this causes no problems because classes are not contained within this. You can axiomatise this finetly because formulas are constructed with a finite amount of objects (quantifiyers, logical symbols, ...).

== Proper classes

Classes that are not also sets

== Global axiom of choice

We can now define $x : x eq.not emptyset$ and choice function over it, $forall x . x eq.not emptyset -> G(x) in x$



= Morse Kelley


])