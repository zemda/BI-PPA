mirror(empty, empty).
mirror(btree(V, L1, R1), btree(V, L2, R2)) :- mirror(L1, R2), mirror(R1, L2).

test1 :- mirror(empty, empty).
test2 :- mirror(empty, T), T = empty.
test3 :- mirror(btree(1, empty, empty), T), T = btree(1, empty, empty).
test4 :- mirror(T, btree(5, btree(2, empty, empty), empty)), T = btree(5, empty, btree(2, empty, empty)).
test5 :- mirror(btree(1, btree(2, empty, empty), empty), T), T = btree(1, empty, btree(2, empty, empty)).
test6 :- mirror(btree(2, btree(1, empty, empty), btree(3, empty, empty)), T), T = btree(2, btree(3, empty, empty), btree(1, empty, empty)).
test7 :- mirror(btree(10, btree(5, btree(3, empty, empty), empty), btree(20, empty, btree(25, empty, empty))), T), T = btree(10, btree(20, btree(25, empty, empty), empty), btree(5, empty, btree(3, empty, empty))).
test8 :- mirror(T, btree(V, empty, empty)), T = btree(V, empty, empty).
test9 :- mirror(btree(V, btree(5, empty, empty), empty), T), T = btree(V, empty, btree(5, empty, empty)).
test10 :- \+ mirror(2, _).
test11 :- \+ mirror(btree(2), _).

run_tests :- test1, test2, test3, test4, test5, test6, test7, test8, test9, test10, test11, print('All tests passed!').