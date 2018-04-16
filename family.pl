%Facts

%is_male = some male
is_male(matt).
is_male(mike).
is_male(mario).
is_male(peter).
is_male(joseph).
is_male(kane).
is_male(abel).
is_male(david).
is_male(jesus).

%is_female = some female
is_female(mary).
is_female(jessica).
is_female(alex).
is_female(esther).
is_female(lilly).
is_female(karen).

%family([father,mother],[children])
family(peter,david).
family(peter,jessica).
family(peter,alex).
family(katie,david).
family(katie,jessica).
family(katie,alex).

family(joseph,jesus).
family(joseph,kane).
family(joseph,abel).
family(mary,jesus).
family(mary,kane).
family(mary,abel).

family(mario,peter).
family(mario,mary).
family(mario,matt).
family(mario,mike).
family(mario,esther).
family(karen,peter).
family(karen,mary).
family(karen,matt).
family(karen,mike).
family(karen,esther).

family(zeus,mario).
family(hera,mario).

%Rules

father(P,C) :- family(P,C), is_male(P).
mother(P,C) :- family(P,C), is_female(P).

siblings1(S1,S2) :- family(P1,S1), family(P2,S2), S1 \= S2, P1==P2.
brother1(B,X) :- siblings1(B,X), is_male(B).
sister1(S,X) :- siblings1(S,X), is_female(S).

siblings2(S1,S2) :- family(P1,S1), family(P2,S2), S1 \= S2, P1==P2.
brother2(B,X) :- siblings2(B,X), is_male(B).
sister2(S,X) :- siblings2(S,X), is_female(S).

cousin(X,Y) :- family(A,X), family(B,Y), siblings2(A,B).
uncle(U,C) :- family(X,C), siblings2(X,U), is_male(U).
aunt(A,C) :- family(X,C), siblingsq2(X,A), is_female(A).
grandparent(G,C) :- family(X,C), family(G,X).
grandmother(G,C) :- grandparent(G,C), is_female(G).
grandfather(G,C) :- grandparent(G,C), is_male(G).
grandchild(C,G) :- grandparent(G,C).

greatgrandparent(G,C) :- family(G,Y), grandparent(Y, C).

ancestor(A,C) :- greatgrandparent(A,C).

