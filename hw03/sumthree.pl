sumThree(Values, K) :-
    select(X, Values, Rest1),
    select(Y, Rest1, Rest2),
    select(Z, Rest2, _),
    X + Y + Z =:= K.

test1 :- \+ sumThree([], 6).
test2 :- \+ sumThree([1], 1).
test3 :- \+ sumThree([0,1,2], 5).
test4 :- sumThree([1,2,3,2,1], 6).
test5 :- sumThree([1,2,3,2,1], 5).
test6 :- \+ sumThree([1,2,3,2,1], 9).
test7 :- sumThree([3,7,-2,10,0,-5], 0).
test8 :- sumThree([3,7,-2,10,0,-5], 2).
test9 :- \+ sumThree([3,7,-2,10,0,-5], 4).

run_tests :- test1, test2, test3, test4, test5, test6, test7, test8, test9, print('All tests passed!').