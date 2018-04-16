eight_queens(N,Qs) :- length(Qs,N), Qs ins 1..N, legal(Qs).

legal([]).
legal([Q|Qs]) :- legal(Qs,Q,1), legal(Qs).

legal([],_,_).
legal([Q|Qs], Q0, D0) :- Q0 #\= Q, abs(Q0 - Q) #\= D0, D1 #= D0 + 1, legal(Qs, Q0, D1).
