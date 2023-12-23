less_than(empty, _).
less_than(btree(V, L, R), X) :- V < X, less_than(L, X), less_than(R, X).

greater_than(empty, _).
greater_than(btree(V, L, R), X) :- V > X, greater_than(L, X), greater_than(R, X).

isBst(empty).
isBst(btree(V, L, R)) :- less_than(L, V), greater_than(R, V), isBst(L), isBst(R).

test1 :- isBst(empty).
test2 :- \+ isBst(not_a_tree).
test3 :- isBst(btree(5, empty, empty)).
test4 :- isBst(btree(5, btree(2, empty, empty), empty)).
test5 :- \+ isBst(btree(5, empty, btree(7, btree(3, empty, empty), empty), empty)).
test6 :- isBst(btree(10, btree(5, btree(3, empty, empty), empty), btree(20, empty, btree(25, empty, empty)))).
test7 :- \+ isBst(btree(3, btree(4, empty, empty), btree(5, empty, empty))).
test8 :- \+ isBst(btree(1, btree(1, empty, empty), empty)).

run_tests :- test1, test2, test3, test4, test5, test6, test7, test8, print('All tests passed!').