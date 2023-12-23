letters(2, [a, b, c]).
letters(3, [d, e, f]).
letters(4, [g, h, i]).
letters(5, [j, k, l]).
letters(6, [m, n, o]).
letters(7, [p, q, r, s]).
letters(8, [t, u, v]).
letters(9, [w, x, y, z]).

t9(0, []).

t9(Num, Word) :-
    Digit is Num mod 10,
    Rest is Num // 10,
    letters(Digit, Letters),
    member(Letter, Letters),
    t9(Rest, RestWord),
    append(RestWord, [Letter], Word).

test1 :- t9(2, [a]).
test2 :- t9(2, [b]).
test3 :- t9(2, [c]).
test4 :- t9(232, [a, d, a]).
test5 :- \+ t9(1, _).
test6 :- \+ t9(202, _).
test7 :- \+ t9(212, _).

run_tests :- test1, test2, test3, test4, test5, test6, test7, print('All tests passed!').