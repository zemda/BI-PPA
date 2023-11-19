## Povolené funkce

- funkce: `define`, `lambda`, `λ`

- aritmetika: `+`, `-`, `*`, `/`, `<`, `>`, <=, `>=`, `=`,
  `floor`, `modulo`

- logika: `and`, `or`, `not`

- porovnání objektů (**i rovnosti seznamů**) přes `equal?`

- operace se seznamy `null`, `null?` (a ekvivalentní `empty?`), `pair?`,
  `list?`, `car`, `cdr`, `cons` (a deriváty jako `cadr`, …)

- makra `if`, `cond`, `let` a `let*`

- `quote` (`'`), `unquote` (`,`) a `quasiquote` (`)

- zpracování seznamů pomocí `map`, `foldl`, `foldr`, `filter`

- `match`

- `struct`

<br>

# Přehled úloh

|                      |                    |          |
|----------------------|--------------------|----------|
| Název úlohy          | Soubor k odevzdání | Max bodů |
| reverse-tree | `reverse-tree.rkt` | 0.5      |
| decorate     | `decorate.rkt`     | 1        |
| coffee-shop  | `coffee-shop.rkt`  | 1        |
| comb         | `comb.rkt`         | 1.5      |
| cnf          | `cnf-value.rkt`    | 1.5      |
| cities-path  | `cities-path.rkt`  | 2        |
| rotate-mat   | `rotate-mat.rkt`   | 2.5      |

# Zadání úloh

## Otočení stromu
Na vstupu dostanete binární vyhledávací strom. Napište funkci
`(reverse-tree bst)`, která vrátí "otočenou" (zrcadlovou) kopii takového
stromu (tj pravý a levý potomek jsou prohozeni).

Prázdný binární vyhledávací strom je reprezentován prázdným seznamem.
Jinak jako seznam tří prvků, kde prvním prvkem je hodnota uložená v
kořeni a následují levý a pravý potomek.

Základní testy:

- (reverse-tree '()) → ()

- (reverse-tree '(1 () ())) → (1 () ())

- (reverse-tree '(1 (2 () ()) ())) → (1 () (2 () ()))

- (reverse-tree '(2 (1 () ()) (3 () ()))) →
  (2 (3 () ()) (1 () ()))

- (reverse-tree '(10 (5 (3 () ()) ()) (20 () (25 () ())))) →
  (10 (20 (25 () ()) ()) (5 () (3 () ())))

## Dekorátor
Vytvořte funkci `(decorate f g)`, která vrátí novou funkci, jež zavolá
funkci `f` a na její návratovou hodnotu zavolá funkci `g`. Funkce `f` je
unární.

Základní testy:

- ((decorate (lambda (x) (+ x 1)) (lambda (x) (+ x 2))) 1) → `4`

- ((decorate (lambda (lst) (foldl + 0 lst)) (lambda (x) (* x x))) '(1 2 3))
  → `36`

- ((decorate (lambda (lst) (foldl + 0 lst)) (lambda (x) (/ x 2))) '(1 2 3))
  → `3`

- ((decorate (lambda (lst) (foldl + 0 lst)) (lambda (x) (= x 0))) '())
  → `#t`

- ((decorate (lambda (lst) (foldl + 0 lst)) (lambda (x) (= x 0))) '(1))
  → `#f`


## Kavárna
Manažer kavárny ví, v kolik přijdou všichni zákazníci v daný den.
Obsloužit zákazníka trvá přesně 1 minutu. Pokud ale zákazník přijde a
uvidí, že žádná přepážka není volná, ihned odejde.

Manažer ale chce obsloužit všechny zákazníky. Napište funkci
`(coffee-shop times)`, která spočítá, kolik přepážek bude potřebovat.
Seznam `times` je seznam dvouprvkových seznamů `(h m)` udávající časy
příchodů zákazníků. Kavárna je otevřená od 8 do 23 hodin. Můžete počítat
s tím, že hodnoty budou tento rozsah dodržovat. Časy v seznamu jsou
seřazené vzestupně.

Základní testy:

- coffee-shop '( (8 0) (8 10) (8 10) (8 45) )) → `2`

- coffee-shop '( (8 12) (10 11) (10 11) (15 15) (15 15) (15 15) (22 22) (22 22) (22 59) ))
  → `3`

- coffee-shop '()) → `0`


## Kombinace
Implementujte funkci `(comb lst n)`, kde `lst` je seznam čísel a `n`
číslo. Např. `lst` může být `(1 1 1 2)` a `n` může být `3`. Představte
si, že mezi jednotlivými prvky v seznamu je plus, tedy `1 + 1 + 1 + 2`.
Zároveň můžeme některá čísla vynechat, tím vznikne například `1 + 2`
nebo `1 + 1 + 1` a další. Kolik různých kombinací čísel takových, že po
jejich sečtení vznikne číslo `n`, můžeme vynecháním vytvořit?

Můžete se spolehnout, že stem:\[n \geq 1\].

Základní testy:

- (comb '(1) 1) → `1`

- (comb '(1 1) 1) → `2` (Můžeme vynechat první nebo druhou
  jedničku.)

- (comb '(1 1) 2) → `1`

- (comb '(1 1 1 2) 3) → `4` (Každou jedničku můžeme sečíst s
  dvojkou; tedy můžeme třemi způsoby vybrat jedničku, a poté vynechat
  dvojku.)

- (comb '(1 2 1 2) 3) → `4`

- (comb '(1 3 4 2) 3) → `2`

- (comb '(1 2 3 4 5) 15) → `1`

- (comb '(1 2 3 4 5) 10) → `3`

- (comb '(1 2 3 4 5) 5) → `3`


## Cesty mezi městy
Napište funkci `(cities-path? paths from to)`, která zjistí, mezi
dvojicí měst existuje cesta. Tato cesta může vést přes i jiná města.

Města budou kódována jedním číslem. Parametr `paths` je seznam dvojic
reprezentující cesty mezi jednotlivými městy, např. ((0 2) (2 1))
znamená, že existuje cesta z města `0` do města `2` a z města `2` do
města `1`. Specifikované cesty jsou jednosměrné, tzn. v předchozím
příkladu existuje cesta z `2` do `1`, ale neexistuje cesta z `1` do `2`.

Funkce vrátí `#t`, pokud existuje cesta z `from` do `to`. V opačném
případě vrátí `#f`.


To, že město není uvedené v hranách nutně neznamená, že neexistuje.
Např. pro `(cities-path? '() 100 100)` očekáváme `#t`.

Základní testy:

- (cities-path? '() 1 2)→ `#f`

- (cities-path? '() 2 2)→ `#t`

- (cities-path? '((1 2)) 1 2)→ `#t`

- (cities-path? '((1 2)) 1 3)→ `#f`

- (cities-path? '((1 2)) 2 1)→ `#f`

- (cities-path? '((2 1)) 1 2)→ `#f`

- (cities-path? '((1 2) (2 1)) 1 2)→ `#t`

- (cities-path? '((1 2) (2 1)) 2 1)→ `#t`

- (cities-path? '((1 2) (2 3) (3 4) (4 2)) 1 2)→ `#t`

- (cities-path? '((1 2) (2 3) (3 4) (4 2)) 1 3)→ `#t`

- (cities-path? '((1 2) (2 3) (3 4) (4 2)) 1 4)→ `#t`

- (cities-path? '((1 2) (2 3) (3 4) (4 2)) 2 3)→ `#t`

- (cities-path? '((1 2) (2 3) (3 4) (4 2)) 2 4)→ `#t`

- (cities-path? '((4 2) (3 4) (2 3) (1 2)) 3 2)→ `#t`


## Ohodnocení KNF
Implementujte funkci `(cnf-value form values)`, která na vstupu dostane
logickou klauzuli v konjunktivním normálním tvaru a ohodnocení
proměnných v této formuli. Funkce odpoví, zda je pod tímto ohodnocením
formule pravdivá, či nikoli.

Příklad vstupu:

``` racket
(cnf-value
    '((0 1) (1 3) (2 0))
    '((0 #f) (1 #t) (2 #f) (3 #t))
)
```

První seznam je formule v konjunktivním normálnim tvaru. Znamená
následující: stem:\[(0 \lor 1) \land (1 \lor 3) \land (2 \lor 0)\], kde
čísla jsou jednotlivé proměnné.

Druhý seznam je ohodnocení proměnných, tedy `(0 #f)` značí, že proměnná
stem:\[0\] má ohodnocení `false`, apod. Jednotlivé proměnné jsou vždy
celá čísla od nuly.

Základní testy:

- (cnf-value '((0 1 2)) '((0 #f) (1 #t) (2 #f))) → `#t`

- (cnf-value '((0 1) (1 2)) '((0 #f) (1 #t) (2 #f))) → `#t`

- (cnf-value '((0) (2)) '((0 #f) (1 #t) (2 #f))) → `#f`

- (cnf-value '((0)) '((0 #f) (1 #t) (2 #f))) → `#f`

- (cnf-value '((0 1) (1 3) (2 0)) '((0 #f) (1 #t) (2 #f) (3 #t)))
  → `#f`

- (cnf-value '((1 0 1)) '((0 #f) (1 #t)) ) → `#t`


## Posouvání řádků a sloupců matice
Implementujte funkci `(rotate-mat matrix commands)`, která bude posouvat
hodnoty v rámci řádku či sloupce matice. Parametr `matrix` je list listů
reprezentující stem:\[m \times n\] matici.

Parametr `commands` je list trojic (trojice reprezentovaná seznamem
délky 3).

1.  První číslo trojice značí, jestli se budou posouvat hodnoty v řádku
    (`0`) nebo sloupci (`1`).

2.  Druhé číslo značí index řádku/sloupce.

3.  Třetí číslo značí velikost posunu.

Posun hodnot o jednu pozici znamená posunutí všech čísel o jednu pozici
doprava. Poslední člen listu bude nyní na začátku
(`(1 2 3) -> (3 1 2)`). Posun o stem:\[n\] pozic provede tuto operaci
stem:\[n\]-krát. Naivní řešení, které by posouvalo stem:\[n\]-krát o
jedna však pravděpodobně nezvládne časový limit.

V rotacích uvažujeme jen nezáporná čísla, můžete se tedy spolehnout, že
ve vstupu nebude posun na opačnou stranu.

Základní testy:

- (rotate-mat '((1)) '((0 0 1))) → '((1))

- (rotate-mat '((1)) '((0 0 10))) → '((1))

- (rotate-mat '((1 2 3)) '((0 0 0))) → '((1 2 3))

- (rotate-mat '((1 2 3)) '()) → '((1 2 3))

- (rotate-mat '((1 2 3)) '((0 0 1))) → '((3 1 2))

- (rotate-mat '((1 2 3)) '((0 0 1) (0 0 1))) → '((2 3 1))

- (rotate-mat '((1 2 3)) '((0 0 3))) → '((1 2 3))

- (rotate-mat '((1 2 3)) '((0 0 4))) → '((3 1 2))

- (rotate-mat '((1 2 3)) '((0 0 10))) → '((3 1 2))

- (rotate-mat '((1 2 3)) '((1 0 1))) → '((1 2 3))

- (rotate-mat '((1 2 3) (4 5 6)) '((1 0 1))) →
  '((4 2 3) (1 5 6)) 

- (rotate-mat '((1 2 3) (4 5 6)) '((1 0 1) (0 0 1))) →
  '((3 4 2) (1 5 6)) 

- (rotate-mat '((1 2 3) (4 5 6)) '((1 0 3) (0 0 4))) →
  '((3 4 2) (1 5 6)) 

- (rotate-mat '((1 2 3) (4 5 6)) '((1 2 1) (1 0 1))) →
  '((4 2 6) (1 5 3)) 
