# Přehled úloh

|                    |                                       |          |
|--------------------|---------------------------------------|----------|
| Název úlohy        | Soubor k odevzdání                    | Max bodů |
| Vyhodnocení lambda výrazu I, II, III       | `eval1.txt`, `eval2.txt`, `eval3.txt` | 3 x 0.5  |
| Lambda funkce pro bool výraz      | `boolOp.txt`                          | 0.5      |
| Lambda funkce pro operátor NAND | `nand.txt`                            | 0.5      |
| Lambda funkce pro matematický výraz       | `math.txt`                            | 0.5      |
| isNor      | `isNor.txt`                           | 1        |
| Tvorba rekurzivní funkce  | `recursion.txt`                       | 1        |
| mod2       | `mod2.txt`                            | 1        |
| isDiv2     | `isDiv2.txt`                          | 1        |
| mod3       | `mod3.txt`                            | 1.5      |
| isDiv3     | `isDiv3.txt`                          | 1.5      |

## Formát zadávání lambda výrazů

Používejte jednoznakové proměnné (a-z). **Jednotlivé proměnné oddělujte
mezerou a pojmenovávejte je malými písmeny (lowercase).** (Uppercase
identifikátory jsou rezervovány pro názvy maker.) Pro symbol lambda lze
použít zpětné lomítko (backslash) `\`, případně přímo lambdu `λ`. Kromě
úlohy Vyhodnocení lambda výrazu I, II, III (podrobné instrukce v definici úlohy) se odevzdává
jen výsledný lambda výraz. Testovací prostředí si načte celý obsah
souboru (který může obsahovat i odřádkování a odsazení), a bude ho
považovat za jeden výraz. Definice vlastních maker není podporována.

## Zadání úloh
### Vyhodnocení lambda výrazu I, II, III
Vyhodnoťte výraz (najděte normální formu) následujících výrazů. Dodržte
strategii vyhodnocení. Jednotlivé kroky vyhodnodování zapište do
uvedeného souboru. **Každý jeden krok uveďte na samostatnou řádku.**
**Testovací prostředí odmítne více beta-redukcí v jednom kroku.**

|                                                                   |             |             |
|-------------------------------------------------------------------|-------------|-------------|
| Výraz                                                             | Strategie   | Soubor      |
| `(λ y x x . x ( x y y ) x) ( y x ) ( x x )`                       | Normální    | `eval1.txt` |
| `(λ y x s z . x s ( y s z )) (λ s z . s z) (λ s z . s ( s z ))`   | Normální    | `eval2.txt` |
| `++(λ p . p p p ) ((λ a . c a l) ( (λ k . k k) ((λ i . i) o)))++` | Aplikativní | `eval3.txt` |

### Lambda funkce pro bool výraz
Napište lambda funkci v **normálním tvaru bez použití maker**, která
bude implementovat v booleovskou funkci stem:\[f(x, y) = (!x) \|\| (!y)
\|\| (! (x && y))\] (kde `!` je NOT, `&&` značí logický `AND` a `||`
značí logický OR) a

`x` a `y` jsou nějaké logické výrazy.

Funkci zapište do souboru `boolOp.txt` jako lambda výraz.

Testy (kde `OP` je obsah vašeho souboru):

- `OP T F` = `T`

- `OP T T` = `F`

- `OP F F` = `T`

- `OP F T` = `T`

### Lambda funkce pro operátor NAND
Vytvořte lambda funkci v **normálním tvaru bez použití maker**, která
simuluje binární operátor NAND. Funkci zapište do souboru `nand.txt`
jako lambda výraz.

Definici [NANDu](https://en.wikipedia.org/wiki/Logical_NAND) můžete
najít např. na wikipedii.

Testy (kde `OP` je obsah vašeho souboru):

- `OP T F` = `T`

- `OP T T` = `F`

- `OP F T` = `T`

- `OP F F` = `T`

### Lambda funkce pro matematický výraz
Vytvořte lambda funkci v **normálním tvaru bez použití maker**, která
simuluje matematickou funkci stem:\[f(x, y) = (2 + 2 \cdot x) \cdot y\].
Funkci zapište do souboru `math.txt` jako lambda výraz.

Testy (kde `FOO` je obsah vašeho souboru):

- `FOO 0 0` = `0`

- `FOO 0 1` = `2`

- `FOO 2 5` = `30`

- `FOO 3 2` = `16`

### isNor
Vytvořte lambda funkci, která otestuje, zda se její argument (říkejme mu
`FOO`) **chová stejně** jako operátor `NOR` pro boolovské hodnoty `T` a
`F`. Tj., vaše funkce má otestovat zda `FOO F F` vrací `T`, `FOO T F`
vrací `F`, a tak dále.

Testy (kde `ISNOR` je obsah vašeho souboru):

- `ISNOR (λ x y t f . x (λ t f . t) y f t)` = `T`

- `ISNOR (λ x y . x T y)` = `F`

- `ISNOR (λ x y . x)` = `F`

Funkci zapište do souboru `isNor.txt` jako lambda výraz.

### Tvorba rekurzivní funkce
Napište lambda funkci pro následující rekurzivní funkci:

- f(0, 0) = 1

- f(0, m) = m + f(m - 1, 0)

- f(n, 0) = n + f (0, n - 1)

- f(n, m) = f(n, m - 1) + f(n - 1, m)


Testy (kde `R` je obsah vašeho souboru):

- `Y R 0 0` = `1`

- `Y R 0 1` = `2`

- `Y R 0 2` = `4`

- `Y R 1 0` = `2`

- `Y R 1 1` = `4`

- `Y R 1 2` = `8`

- `Y R 2 0` = `4`

- `Y R 2 1` = `8`

- `Y R 2 2` = `16`

Výraz `R` reprezentující funkci `f` zapište do souboru `recursion.txt`.
Vaše funkce bude testována výrazem `Y R args...`, kde `R` je vaše
odevzdaná funkce. `Y` a `args...` budou dodány testovacím prostředím.

### mod2
Vytvořte lambda funkci, která spočítá zbytek po celočíselném dělení
číslem 2. Jinými slovy, funkce implementuje operaci `mod 2`.


Testy (kde `MOD2` je obsah vašeho souboru):

- `MOD2 0` = `0`

- `MOD2 1` = `1`

- `MOD2 2` = `0`

- `MOD2 3` = `1`

- `MOD2 4` = `0`

- `MOD2 5` = `1`

- `MOD2 6` = `0`

Výraz k vyhodnocení zapište do souboru `mod2.txt`.

### isDiv2
Vytvořte lambda funkci, která otestuje, zda dané číslo je celočiselně
dělitelné číslem 2. Tedy jestli při dělení 2 je zbytek po dělení roven
0.


Testy (kde `ISDIV2` je obsah vašeho souboru):

- `ISDIV2 0` = `T`

- `ISDIV2 1` = `F`

- `ISDIV2 2` = `T`

- `ISDIV2 3` = `F`

- `ISDIV2 4` = `T`


Výraz k vyhodnocení zapište do souboru `isDiv2.txt`.

### mod3
Vytvořte lambda funkci, která spočítá zbytek po celočíselném dělení
číslem 3. Jinými slovy, funkce implementuje operaci `mod 3`.

Testy (kde `MOD3` je obsah vašeho souboru):

- `MOD3 0` = `0`

- `MOD3 1` = `1`

- `MOD3 2` = `2`

- `MOD3 3` = `0`

- `MOD3 4` = `1`

- `MOD3 5` = `2`

- `MOD3 6` = `0`

Výraz k vyhodnocení zapište do souboru `mod3.txt`.

### isDiv3
Vytvořte lambda funkci, která otestuje, zda dané číslo je celočiselně
dělitelné číslem 3. Tedy jestli při dělení 3 je zbytek po dělení roven
0.

Testy (kde `ISDIV3` je obsah vašeho souboru):

- `ISDIV3 0` = `T`

- `ISDIV3 1` = `F`

- `ISDIV3 2` = `F`

- `ISDIV3 3` = `T`

- `ISDIV3 4` = `F`

- `ISDIV3 5` = `F`

- `ISDIV3 6` = `T`

Výraz k vyhodnocení zapište do souboru `isDiv3.txt`.
