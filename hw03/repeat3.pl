repeat3(Lst, X) :-
    append([_, X, _, X, _, X, _], Lst),
    X \= [].

test1 :- \+ repeat3([1], _).
test2 :- \+ repeat3([1,1], _).
test3 :- repeat3([1,1,1], [1]).
test4 :- repeat3([1,2,1,1], [1]).
test5 :- repeat3([1,1,1,1], [1]).
test6 :- \+ repeat3([1,2,3,4,1,2,3,4], _).
test7 :- repeat3([1,2,3,4,1,2,3,4,3,4], [3]).
test8 :- repeat3([1,2,3,4,1,2,3,4,1,2,3,4], [1]).
test9 :- repeat3([5,9,5,9,9,2,3,4], [9]).
test10 :- repeat3([1,2,3,4,3,2,1,2,3,4,3,2,1,2,3,4], [1]).

run_tests :- test1, test2, test3, test4, test5, test6, test7, test8, test9, test10, print('All tests passed!').