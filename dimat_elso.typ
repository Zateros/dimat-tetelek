#import "@preview/cetz:0.2.2"

#let colorS = color.rgb("#B4D3B4")

#set page(
  paper: "a4",
  numbering: "1.",
  margin: (x: 40pt, y: 40pt)
)

#set document(
  author: "Krasznai Dániel & Tóth Zalán",
  title: "Diszkrét matematika vizsgatételek"
)

#set text(
  size: 15pt,
  font: "Times New Roman"
)

#set par(
  justify: true,
)

#set enum(
  numbering: "1.)",
  spacing: 15pt,
)

#set block(
  below: 15pt
)

#show heading.where(level: 2): it => block(
  breakable: false,
  fill: colorS,
  inset: 10pt,
  radius: 4pt,
)[#it]

#show heading.where(level: 1): it => align(center)[#it]

#show heading.where(level: 3): it => [#underline[#it]]

= Diszkrét matematika vizsgára kért tételek

== Logika és halmazok

+ #box()[_Definiálja a predikátum fogalmát!
Az alábbiak közül melyik predikátum:_
#set enum(numbering: "a)")
+ $P (x)$

+ $P (x) and O(x)$;
_ahol adott $x$ egész esetén $P (x)$ és $O(x)$ jelentése, hogy $x$ prı́m, ill. $x$ páratlan._

*Predikátum*: olyan változóktól függő kijelentések, amelyhez a változóik értékétől fűggően valamilyen igazságérték tartozik.

Az *_a)_ lesz predikátum*, a _b)_ már formulának számít.
]

+ #box()[
_Írja fel az _és_ és a _vagy_ igazságtábláját! \
Mi lesz az $I and (H or I)$ igazságértéke?_

- #grid(
  columns: (auto, auto),
  gutter: 15pt,
  table(
    columns: (auto,auto,auto),
    [$and$],[*Igaz*],[*Hamis*],
    [*Igaz*],[Igaz],[Hamis],
    [*Hamis*],[Hamis],[Hamis],
  ),
  table(
    columns: (auto,auto,auto),
    [$or$],[*Igaz*],[*Hamis*],
    [*Igaz*],[Igaz],[Igaz],
    [*Hamis*],[Igaz],[Hamis],
  )
)

- $underbrace(I and underbrace((H or I),"Igaz"), "Igaz") $
]

+ #box()[
_Írja fel a tagadás és az implikáció igazságtábláját! \
Mi lesz az $A arrow.double B$ tagadása?_

- #grid(
  columns: (auto, auto),
  gutter: 15pt,
  table(
    columns: (auto,auto,auto),
    [$not$],[*Igaz*],[*Hamis*],
    [],[Hamis],[Igaz],
  ),
  table(
    columns: (auto,auto,auto),
    [$A$],[$B$],[$A arrow.double B$],
    [Igaz],[Igaz],[Igaz],
    [Igaz],[Hamis],[Hamis],
    [Hamis],[Igaz],[Igaz],
    [Hamis],[Hamis],[Igaz],
  ),
)

- $A arrow.double B$ ekvivalens $not A or B$-vel, ennek a tagadása $A and not B$ lesz a De Morgan azonosságok miatt.
]

+ #box()[
_Mik az egzisztenciális és univerzális kvantorok? \
Mutasson példát olyan $H(x, y)$ kétváltozós predikátumra, melyre $forall x exists y H(x, y) eq.not exists y forall x H(x, y)$!_

- Egzisztenciális kvantor: $exists$ "létezik", univerzális kvantor: $forall$ "minden". Kvantorokkal "lokális változókat" képezhetünk.

- Az első része azt állítja, hogy minden x számhoz létezik olyan szám, amire igaz ez a H predikátum. A másik része pedig, hogy létezik olyan szám, amihez minden x számmal igaz H predikátum. Így például, ha H predikátum azt állítja, hogy x és y különbsége páros, akkor az állítás igaz lesz, mert:
  - Minden számhoz létezik olyan szám, amivel a különbségük páros lesz (pl.: $x eq 3 "és" y_1 eq 0 space (x - y_1 eq 3 arrow.zigzag) "vagy" y_2 eq 1 arrow.r x - y_2 eq 2$)
  - Nem létezik olyan szám, ami minden számmal a különbsége páros
  #line(end: (100%,0%))
  Igaz $eq.not$ Hamis
]

+ #box()[
_Definiálja logikai jelek segı́tségével halmazok metszetét és unióját! \
Mutasson egy-egy példát olyan _A, B, C_ halmazokra melyekre $(A union B) sect C$ megegyezik, ill. nem egyezik meg $A union (B sect C)$ halmazzal!_

- Legyen _A, B_ két halmaz
  - $A sect B eq {x colon x in A and x in B}$
  - $A union B eq {x colon x in A or x in B}$

- $(A union B) sect C eq A union (B sect C)$
  - pl.: $A eq {1,2}, B eq {1,2}, C eq {1,2}$ \ $arrow.r ({1,2} union {1,2}) sect {1,2} eq {1,2} union ({1,2} sect {1,2}) eq {1,2}$
- $(A union B) sect C eq.not A union (B sect C)$
  - pl.: $A eq {1,2}, B eq {1}, C eq {2}$ \ \ $arrow.r ({1,2} union {1}) sect {2} &eq {2} \ {1,2} union ({1} sect {2}) &eq {1,2}$ \ #line(end: (100%,0%)) ${2} eq.not {1,2}$
]
+ #box()[
_Definiálja halmazok szimmetrikus differenciáját! \ Mi lesz az $A eq {a, b, c}$ és $B eq {b, c, d}$ halmazok szimmetrikus differenciája?_

- $A triangle.t.small B eq (A \\ B) union (B \\ A) eq {a colon (a in A) plus.circle (b in B)}$
- ${a,b,c} triangle.t.small {b,c,d} eq ({a,b,c} \\ {b,c,d}) union ({b,c,d} \\ {a,b,c}) eq {a} union {d} eq {a,d}$
]

== Relációk

+ #box()[
_Definiálja a binér reláció fogalmát! \ Mutasson két példát relációra az $X eq {a, b, c}$ és $Y eq {1, 2, 3}$ halmazok között!_

- *Binér reláció:* Legyen $X, Y$ két tetszőleges halmaz. Ekkor az $R subset X times Y$ egy (binér) reláció az $X, Y$ halmaz között. Ha $X eq Y$ , akkor $R subset X times X$ egy (binér) reláció $X$-en. 

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    grid((0,0), (6,6), name: "gr", stroke: blue)
    set-style(mark: (end: ">"), fill: black)
    line((0,-0.5), (0,6.5), name: "y")
    line((-0.5,0), (6.5,0), name: "x")
    content("x.end", [$X$],anchor: "north", padding: .2)
    content("y.end", [$Y$],anchor: "east", padding: .1)
    content("x.mid", [$A$], anchor: "north", padding: .2)
    content("y.mid", [$B$], anchor: "east", padding: .4)
    content("gr.north-east", [$A times B$], anchor: "north-east", padding: -0.6)
    set-style(fill: rgb(204, 255, 204), stroke: none)
    rotate(z: 35deg)
    circle((4.5,0), radius: (1.75, 1), name: "hz")
    content("hz.center", [$R$])
  })

//TODO
- Pl.:
  - *Descartes-szorzat ($X times Y$)*: \ $X times Y eq {(a,1),(a,2),(a,3),(b,1),(b,2),(b,3),(c,1),(c,2),(c,3)}$
  - *Descartes-szorzat ($Y times X$)*: \ $Y times X eq {(1,a),(1,b),(1,c),(2,a),(2,b),(2,c),(3,a),(3,b),(3,c)}$
]]


+ #box()[
_Definiálja relációk értelmezési tartományát és értékkészletét! \ Mi lesz az $R eq {(a, 1), (a, 2), (b, 1), (b, 4)} subset {a, b, c, d} times {1, 2, 3, 4}$ reláció értelmezési tartománya és értékkészlete?_ 

- Legyen $R supset X times Y$ egy reláció
  - R értelmezési tartománya: $"dmn"(R) eq {x in X: exists y in Y: (x,y) in R}$
  - R értékkészlete: $"rng"(R) eq {y in Y: exists x in X: (x,y) in R}$

#align(center)[#cetz.canvas({
  import cetz.draw: *
  content((0,0),  [a], name: "a")
  content((0,-1), [b], name: "b")
  content((0,-2), [c], name: "c")
  content((0,-3), [d], name: "d")
  content((3,0),  [1], name: "1")
  content((3,-1), [2], name: "2")
  content((3,-2), [3], name: "3")
  content((3,-3), [4], name: "4")
  content(("a",1.5,"1"), [$R$], anchor: "south", padding: .5)
  set-style(mark: (end: ">"), stroke: green, fill:green)
  line("a", "1")
  line("a", "2")
  line("b", "1")
  line("b", "4")
})]

- $"dmn"(R) eq {a,b}$
- $"rng"(R) eq {1,2,4}$

]

+ #box()[
_Definiálja relációk kompozı́cióját! \ 
Legyen $R eq {(a, 1), (a, 2), (b, 1), (b, 4)} "és" S eq {(1, alpha), (1, beta), (2, alpha), (3, gamma)}.$ Mi lesz az $S circle.stroked.tiny R$ kompozı́ció?_ 

- Legyenek _R_ és _S_ binér relációk. Ekkor az $R circle.stroked.tiny S$ kompozı́ció (összetétel, sorozat) reláció: $R circle.stroked.tiny S eq {(x,y) colon exists z colon (x,z) in S, (z,y) in R}$

#align(center)[#cetz.canvas({
  import cetz.draw: *
  content((0,0),  [a], name: "a")
  content((0,-1), [b], name: "b")
  content((0,-2), [c], name: "c")
  content((0,-3), [d], name: "d")
  content((3,0),  [1], name: "1")
  content((3,-1), [2], name: "2")
  content((3,-2), [3], name: "3")
  content((3,-3), [4], name: "4")
  content((6,0),  [$alpha$], name: "al")
  content((6,-1), [$beta$], name: "be")
  content((6,-2), [$gamma$], name: "ga")
  content((6,-3), [$delta$], name: "de")
  content(("a",1.5,"1"), [$R$], anchor: "south", padding: .5)
  content(("1",1.5,"al"), [$S$], anchor: "south", padding: .5)
  set-style(mark: (end: ">"), stroke: green, fill:green)
  line("a", "1")
  line("a", "2")
  line("b", "1")
  line("b", "4")
  set-style(mark: (end: ">"), stroke: blue, fill:blue)
  line("1", "al")
  line("1", "be")
  line("2", "al")
  line("3", "ga")
})]

- $S circle.stroked.tiny R eq {(a,alpha),(a,beta),(b,alpha),(b,beta)}$

#align(center)[#cetz.canvas({
  import cetz.draw: *
  content((0,0),  [a], name: "a")
  content((0,-1), [b], name: "b")
  content((0,-2), [c], name: "c")
  content((0,-3), [d], name: "d")
  content((3,0),  [1], name: "1")
  content((3,-1), [2], name: "2")
  content((3,-2), [3], name: "3")
  content((3,-3), [4], name: "4")
  content((6,0),  [$alpha$], name: "al")
  content((6,-1), [$beta$], name: "be")
  content((6,-2), [$gamma$], name: "ga")
  content((6,-3), [$delta$], name: "de")
  content(("a",1.5,"1"), [$R$], anchor: "south", padding: .5)
  content(("1",1.5,"al"), [$S$], anchor: "south", padding: .5)
  set-style(mark: (end: ">"), stroke: gray, fill:gray)
  line("a", "1")
  line("a", "2")
  line("b", "1")
  line("b", "4")
  set-style(mark: (end: ">"), stroke: rgb(36, 36, 36), fill:rgb(36, 36, 36))
  line("1", "al")
  line("1", "be")
  line("2", "al")
  line("3", "ga")
    set-style(mark: (end: ">"), stroke: red, fill:red)
  line("a", "al")
  line("a", "be")
  line("b", "al")
  line("b", "be")

})]

]

+ #box()[
_Definiálja a szimmetrikus relációkat! \ 
Szimmetrikus-e az $R eq {(1, 2), (1, 3), (2, 3), (3, 1)} subset {1, 2, 3} times {1, 2, 3}$ reláció?_

- Legyen $R subset X times X$. R reláció szimmetrikus, ha $forall x, y in X colon x R y arrow.double y R x$ (pl.: $eq, K$) \ $arrow.r space K eq {(x,y) in RR times RR colon abs(x - y) lt.eq 1} "(közelségi reláció)"$

- Nem, mivel $(1,2) in R, "de" (2,1) in.not R "és" (2,3) in R, "de" (3,2) in.not R$

]

+ #box()[
_Definiálja a reflexı́v relációkat! \ 
Reflexı́v-e az $R eq {(1, 2), (1, 3), (2, 3), (3, 1)} subset {1, 2, 3} times {1, 2, 3}$ reláció?_

- Legyen $R subset X times X$. R reláció reflexı́v, ha $forall x in X colon x R x$ (pl.: $eq, lt.eq, subset, bar, K$)

- Nem reflexı́v, mert $(1,1) in.not R, (2,2) in.not R, (3,3) in.not R$.

]

+ #box()[
_Definiálja a tranzitı́v relációkat! \ 
Tranzitı́v-e az $R eq {(1, 2), (1, 3), (2, 3), (3, 1)} subset {1, 2, 3} times {1, 2, 3}$ reláció?_

- Legyen $R subset X times X$. R reláció tranzitı́v, ha $forall x,y,z in X colon x R y and y R z arrow.double x R z$ (pl.: $eq, lt.eq, subset, bar$)

- Nem, mivel $(2,3) in R, (3,1) in R, "de" (2,1) in.not R$.

]

+ #box()[
_Definiálja az ekvivalencia reláció fogalmát! \ 
Adjon két különböző példát ekvivalencia relációra az $X eq {1, 2, 3}$ halmazon!_

- Egy _R_ reláció ekvivalencia reláció, ha reflexı́v, tranzitı́v és szimmetrikus.

- pl.:
  - $R eq {(1,1), (2,2), (3,3)} subset X times X$
  - $R eq {(1,1), (1,2),(1,3),(2,1), (2,2), (2,3),(3,1), (3,2), (3,3)} subset X times X$

]

+ #box()[
_Definiálja az osztályozás fogalmát! \ 
Adjon két különböző példát osztályozásra az $X eq {1, 2, 3}$ halmazon!_

- Egy _X_ halmaz részhalmazainak _O_ rendszerét osztályozásnak nevezzük, ha
  - _O_ elemei páronként diszjunkt nemüres halmazok
  - $union O eq X$

- pl.:
  - $O eq {{1,3},2}$
  - $O eq {{1},{2},{3}}$

]

#pagebreak()

== Komplex számok

+ #box()[
_Definiálja komplex számok trigonometrikus alakját! \
Mi lesz a $z eq 1 + i in CC$ szám trigonometrikus alakja?_

- Legyen $z eq a plus b i in CC \\ {0}$.
  - Az $r eq abs(z)$ az $(a,b) in RR^2$ vektor hossza
  - A $phi eq arg(z) in [0,2pi)$ az $(a,b)$ vektor irányszöge, a $z$ argumentuma.
  - Ekkor $a eq r cos phi "és" b eq r sin phi$, így $z eq r(cos phi plus i sin phi)$
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(mark: (end: ">"), fill: black)
    line((0,-0.5), (0,4.5), name: "y")
    line((-0.5,0), (6.5,0), name: "x")
    line((0,0), (4,2.5), name: "diag")
    set-style(mark: (end: none), stroke: (dash: "dashed"))
    line((0,2.5), (4,2.5), name: "xproj")
    line((4,0), (4,2.5), name: "yproj")
    content("xproj.start", anchor: "east", padding: .3, [$b eq "Im"(z)$])
    content("yproj.start", anchor: "north", padding: .3, [$a eq "Re"(z)$])
    content("diag.end", anchor: "west", padding: .3, [$z eq a plus b i$])
    content("diag.mid", angle: "diag.end", anchor: "south", padding: .2, [$r eq abs(z)$])
    set-style(fill: none, stroke: (dash: none))
    arc((2,0),start: 0deg, stop: 65deg, name: "deg")
    content("deg.mid", anchor: "east", padding: .4, [$phi$])
  })
]

- $z eq sqrt(2)(cos pi / 4 plus i sin pi / 4)$
  - $r eq abs(z) eq sqrt(1^2 plus 1^2) eq sqrt(2)$
  - $sin phi eq 1 / abs(z) eq 1 / sqrt(2) arrow.double phi eq pi / 4$

]

+ #box()[
_Mondja ki a szorzásra vonatkozó Moivre azonosságot! \
Mi lesz a $z eq 3(cos(pi/3) + i dot sin(pi/3))$ és $w = 7(cos((5pi)/6)+i dot sin((5pi)/6))$ számok szorzatának trigonometrikus alakja?_

- Legyen $z, w in CC \\ {0}$ nem-nulla komplex számok: $ z eq abs(z)(cos phi plus i sin phi), w eq abs(w)(cos psi plus i sin psi). $ Ekkor $ z w eq abs(z) abs(w)(cos (phi plus psi) plus i sin (phi plus psi)) $

- $z w eq 3 dot 7(cos (pi/3 plus (5pi)/6) plus i sin (pi/3 plus (5pi)/6)) eq 21(cos ((7pi)/6) plus i sin ((7pi)/6))$

]

+ #box()[
_Mondja ki az osztásra vonatkozó Moivre azonosságot! \
Mi lesz a $z eq 3(cos(π/3) + i dot sin(π/3))$ és $w eq 7(cos((5pi)/6) + i dot sin((5pi)/6))$ számok hányadosának trigonometrikus alakja?_

- Legyen $z, w in CC \\ {0}$ nem-nulla komplex számok: $ z eq abs(z)(cos phi plus i sin phi), w eq abs(w)(cos psi plus i sin psi). $ Ekkor $ z / w eq abs(z) / abs(w)(cos (phi minus psi) plus i sin (phi minus psi)) $

- $z / w eq 3 / 7(cos (pi/3 minus (5pi)/6) plus i sin (pi/3 minus (5pi)/6)) eq 3 / 7(cos (-(3pi)/6) plus i sin (-(3pi)/6))$

]

+ #box()[_Mondja ki a hatványozásra vonatkozó Moivre azonosságot! \ 
Mi lesz a $z = 3(cos(π/3) + i dot.op sin(π/3))$ számok tizenkettedik hatványának trigonometrikus alakja?_ \ \ Legyen $z in CC \\ {0}$ nem-nulla komplex számok: $ z eq abs(z) (cos(phi) + i sin(phi)) $ és legyen $n in NN$. Ekkor $z^n eq abs(z)^n (cos n phi + i sin n phi)$ \ \ $z eq 3(cos(pi/3) + i sin(pi/3))$ $ z^12 eq abs(3)^12 (cos 12 (pi/3) + i sin 12(pi/3)) eq 3^12 (cos 4 pi + i sin 4 pi) eq \ eq 3^12 (cos 0 + i sin 0) eq 3^12 ( 1+0i) eq 3^12  $
]

+	_Adott $w eq.not 0$ komplex szám és $n ≥ 1$ egész esetén mik lesznek a $z^n = w$ komplex megoldásai? \ Mondja ki a megfelelő tételt! Hány megoldása van a $z^3 = −1$ egyenletnek komplex számok körében?_ \ \ Legyen $w in CC \\ {0}$ komplex szám $w eq abs(w) (cos psi + i sin psi)$ trigonometrikus alakkal. $z^n eq w, space z in CC$ egyenlet megoldásai: $ z_k eq abs(w)^(1/n) (cos phi_k + i sin phi_k): phi_k = psi/n + (2k psi)/n, space k eq 0,1,...,n-1 $ $ z^3 eq -1 arrow.double.long z eq root(3,-1) arrow.double.long z eq root(3,1)(cos((pi+2k pi)/3)+i sin((pi + 2k pi)/3)) $ Egyenletbe $k = 0,1,2$-re különbőző eredményt kapunk, tehát a $z^3 eq -1$ egyenletnek 3 megoldása van.



== Kombinatorika

+ #box()[_Hányféleképpen lehet n különböző elemet sorba állítani? \ Mondja ki a megfelelő összefüggést! \ Hányféleképpen lehet 5 különböző könyvet a polcra felrakni?_ \ \ $n$ elemből az első helyre $n$-féleképpen választhatunk, a második helyre $n-1$ féleképpen és így tovább,... . Így a szorzás szabály szerint az összes lehetőségek száma: $n(n-1)...2 dot.op 1 eq n!$ \ 5 különböző könyvet $5! eq 120$ féleképpen lehet sorbaállítani.]

+ _Hányféleképpen lehet n, nem feltételen különböző elemet sorba állítani? Mondja ki a megfelelő összefüggést! Hányféleképpen lehet 7 hosszú szót lehet képezni három darab ’a’, két darab ’b’ és három darab ’c’ segítségével?_ \ \ Ha minden elem között különbséget teszünk, akkor $n!$ lehetséges sorrend van.\ Azonban ekkor egy lehetőséget többször is számoltunk. Nevezetesen, ha az $i$-edik elemből $k_i$ darab van, akkor a ismétlés nélküli permutáció és a szorzat-szabály szerint egy sorrendet $(k_1)! dot.op ... dot.op (k_m)!$-szer számoltunk. \ Így az osztás-szabály szerint, ha az azonos típusú elemek között nem teszünk különbséget, akkor $(k_1 + k_2 + ... k_m )!/(k_1 !k_2 !...k_m !)$ lehetséges sorrend van. \ \ $7!/(3!2!3!)$ féleképpen. 

+	_Hányféleképpen lehet k elemet választani egy n elemű halmazból, ha a kiválasztás sorrendje számít és egy elemet többször is felhasználhatunk? \ Hány 7 hosszú szót képezhetünk az ’a’, ’b’ és ’c’ karakterek felhasználásával?_ \ \ Mindegyik helyre $n$-féleképpen válaszhatunk elemet, tehát a szorzat-szabály 2 szerint, a lehetséges választások száma $n^k$ lehetséges sorrend van \ \ Mivel 3 fajta karakterünk van és 7 helyre kell választanunk, ezért $3^7$ féleképpen.

+	#box()[_Hányféleképpen lehet k elemet kiválasztani egy n elemű halmazból, ha a kiválasztás sorrendje számít és egy elemet csak egyszer választhatunk? \ Hány 5 hossz szót képezhetünk az ’a’, ’b’, ’c’, ’d’, ’e’, ’f’ és ’g’ karakterek felhasználásával, ha egy karaktert csak egyszer használhatunk?_ \ \ 1. helyre $n$-féleképpen válaszhatunk, 2. helyre $n-1$-féleképpen,..., a $k$-adik helyre $n-k+1$-féleképpen választanunk. Így a szorzat-szabály 2 szerint a lehetséges választások száma $n(n-1)(n-2)...(n-k+1) eq n!/(n-k)!$ lehetséges sorrend van. \ \ $n$ itt a betünk száma azaz 7 és a $k$ szó hossz azaz 5, tehát $7!/(7-5)!$ lehetséges sorrend van.]

+	#box()[_Hányféleképpen lehet k elemet kiválasztani egy n elemű halmazból, ha a kiválasztás nem sorrendje számít és egy elemet csak egyszer választhatunk? \ Hányféleképpen tudunk kiválasztani 2 könyvet az 5-ből, amit nyaralásra viszünk magunkkal?_ \ \ Ha a sorrend számítana akkor $n!/(n-k)!$ lenne a lehetséges választások száma. Mivel azonban egy lehetőséget ekkor többször is számolunk ezért $k$ elem lehetséges sorrendjét figyelembe kell venni azaz $k!$. Így az osztás-szabály szerint, a lehetséges választások száma $(n!/(n-k)!)/k! eq vec(n,k)$ lehetséges sorend van. \ \ $n$ a könyvek száma és $k$ amennyit ki szeretnénk választani, azaz $vec(5,2)$]

+	_Hányféleképpen lehet k elemet kiválasztani egy n elemű halmazból, ha a kiválasztás nem sorrendje számít és egy elemet többször is választhatunk? \ Hányféleképpen tudunk kiválasztani 3 gombócot választani az 5-féle fagylaltból, ha a választás sorrendje nem számít?_ \ \ Minden lehetséges választás megfelel egy 0-1 sorozatnak: $ 1,1,...1,0,1,1...1,0,1 $ Ekkor elég leszámlálin a lehetséges ilyen típusú sorozatokat. Itt pontosan $k$ darab 1-es van (választott elemek) és $n-1$ darab 0 (szeparátorok száma) azaz $vec(n+k-1,k)$ \ \ $n$ a fagylalt-félék száma és $k$ a gombócok száma, tehát $vec(5+3-1,3) eq vec(7,3)$

#pagebreak()

== Gráfok

+	_Mondja ki a gráf csúcsainak fokszáma és a gráf elszáma közötti osszefüggést! \ Van-e olyan egyszerű gráf, mely csúcsainak fokszámai 1,2,2,2,2,4? Válaszát indokolja!_ \ \ Minden $G eq (V,E) "gráfra " limits(sum)_(v in V) d(v) eq 2 abs(E)$ \ \ Nem létezik, mivel a páratlan fokszámú csúcsok száma nem páros (1).

+	#box()[_Definiálja gráfok izomorfiáját! \ Mutasson példát két gráfra melyek izomorfak, és adja meg a közöttük lévő izomorfiát is!_ \ \ Két $G eq (V,E) "és " H eq (U,F)$ gráf izomorfak, ha létezik olyan $f : V arrow U$ és $g : E arrow F$ bijekciók (egyértelmű hozzárendelések), hogy $ forall v in V and e in E : v in e arrow.l.r.double.long f(v) in g(e) $ #grid(
  columns: (auto, auto, auto),
  gutter: 5pt,
  image("izom1.png"),
  image("izom2.png"),
  image("table.png")
)]

+	_Definiálja a részgráf és feszített részgráf fogalmát! \ Mutasson példát két G ill. H gráfra, melyekre H részgráfja, de nem feszített részgráfja G-nek!_ \ \ Egy $G eq (V,E)$ gráfnak a $H eq (U,F)$ gráf részgráfja, ha $U subset V and F subset E$ \ \ Egy $H eq (U,F)$ egy feszített részgráfja $G eq (V,E)$-nek, ha\ #box()[
- részgráfja: $U subset V and F subset E$
- feszített: $u_1,u_2 in U and {u_1,u_2} in E arrow.long.double {u_1,u_2} in F$
] #grid(
  columns: (auto, auto, auto),
  gutter: 5pt,
  image("resz1.png"),
  image("resz2.png"),
  $H eq G_3 "a feladat szövegében"$
)

+	#box()[_Definiálja a séta fogalmát gráfokra! \ Adjon példát két különböző sétára $v_1$ és $v_8$ között az alábbi gráfban:_ \ \ #grid(
  columns: (auto, auto),
  gutter: 5pt,
  align: horizon,
  image("seta.png"),
  grid(
    rows: (auto, auto),
    gutter: 10pt,
    $"Legyen "space G eq (V,E) "egy gráf. Egy" v_0,e_1,v_1,...,v_(k-1), e_k, v_k \ "sorozatot "space k"-hosszú sétának nevezünk, ha"$,
    box()[
      - $v_i in V (0 lt.eq i lt.eq k), space e_i in E (1 lt.eq i lt.eq k)$
      - $e_i eq {v_(i-1), v_i} (1 lt.eq i lt.eq k)$
      ]
  )
  
) \ \ #box()[
  + $v_1,e_4,v_5,e_9,v_7,e_8,v_8$
  + $v_1,e_1,v_2,e_5,v_3,e_11,v_8$
]
]
+	_Definiálja az út fogalmát gráfokra! \ Adjon példát két különböző sétára $v_1$ és $v_8$ között az alábbi gráfban:_ #grid(
  columns: (auto, auto),
  gutter: 5pt,
  align: horizon,
  image("seta.png"),
  grid(
    rows: (auto, auto),
    gutter: 10pt,
    $"Legyen "space G eq (V,E) "egy gráf. Egy" v_0,e_1,v_1,...,v_(k-1), e_k, v_k \ "sorozatot "space k"-hosszú útnak nevezünk, ha"$,
    box()[
      - ez egy séta
      - $v_i eq.not v_j space (i eq.not j)$
      ]
  )
) \ \ #box()[
  + $v_1,e_4,v_5,e_9,v_7,e_8,v_8$
  + $v_1,e_1,v_2,e_5,v_3,e_11,v_8$
]

+	#box()[_Definiálja az összefüggő gráfok fogalmát! \ Mutasson egy-egy példát összefüggő és nem összefüggő gráfra!_ \ \ Egy $G eq (V,E)$ gráf összefüggő, ha $forall u,v in V, u eq.not v$ van $u$ és $v$ között séta. #align(center, grid(
    columns: (auto, auto),
    gutter: 5pt,
    align: center,
    grid(
      columns: (auto, auto),
      gutter: 5pt,
      
      align: horizon,
      "Összefüggő:",
      image("ossz.png")
    ),
    grid(
      columns: (auto, auto),
      gutter: 5pt,
      align: horizon,
      "Nem összefüggő:",
      image("nemossz.png",width: 56%)
      
    ),
  
  ) 
)
]

+	_Definiálja a fa fogalmát gráfok körében! \ Mutasson egy-egy példát fa és nem fa gráfra!_ \ \ Egy $G eq (V,E)$ gráfot fának hívunk, ha\ #box[
  - összefüggő
  - körmentes
] #align( center,grid(
  columns: (auto, auto, auto, auto),
  gutter: 5pt,
  align: horizon,
  "fa:",
  image("fa.png"),
  "Nem fa mert van benne kör:",
  image("izom1.png")

  )
)

+	_Definiálja az Euler-séta fogalmát! \ Mutasson példát Euler-sétára az alábbi gráfban:_ \ \ Egy $G$ gráfban a $v_0,e_1,v_1,...,v_(k-1),e_k,v_k$ séta egy Euler-séta, ha #box[
  - $e_i eq.not e_j space ( i eq.not j)$
  - a séta $G$ minden élét tartalmazza.
  - zárt Euler-séta: $v_0 eq v_k$
] #grid(
  columns: (auto, auto),
  gutter : 5pt,
  align: horizon,
  image("euler.png"),
  $v_5,e_8,v_6,e_6,v_3,e_5,v_2,e_1,v_1,e_4,v_5,e_7,v_2,e_2,v_4,e_3,v_5$
)

+ #box()[_Definiálja a Hamilton-út fogalmát! \ Mutasson példát Hamilton-útra az alábbi gráfban:_ \ \ Legyen $G$ egy véges egyszerű gráf. A $G$ gráfban egy út Hamilton út, ha minden csúcsot pontosan egyszer tartalmaz. \ #align(center, grid(
  columns: (auto, auto),
  gutter: 5pt,
  align: horizon,
  image("euler.png"),
  $v_1, e_1, v_2, e_2, v_4, e_3, v_5, e_8, v_6, e_6, v_3$
  )
)
]