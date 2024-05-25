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

- Pl.:
  - *Descartes-szorzat ($X times Y$)*: \ $X times Y eq {(a,1),(a,2),(a,3),(b,1),(b,2),(b,3),(c,1),(c,2),(c,3)}$
  - *Descartes-szorzat ($Y times X$)*: \ $Y times X eq {(1,a),(1,b),(1,c),(2,a),(2,b),(2,c),(3,a),(3,b),(3,c)}$
]

+ #box()[
_Definiálja relációk értelmezési tartományát és értékkészletét! \ Mi lesz az $R eq {(a, 1), (a, 2), (b, 1), (b, 4)}$ és az ${a, b, c, d} times {1, 2, 3, 4}$ reláció értelmezési tartománya és értékkészlete?_ \ #text(style: "italic", fill: gray)[Picit lemaradt a feladat szövege az eredeti pdf-ben, így nem biztos, hogy értelmes a feladat]

- Legyen $R supset X times Y$ egy reláció
  - R értelmezési tartománya: $"dmn"(R) eq {x in X: exists y in Y: (x,y) in R}$
  - R értékkészlete: $"rng"(R) eq {y in Y: exists x in X: (x,y) in R}$

#align(center)[#cetz.canvas({
  import cetz.draw: *
  content((0,0),  [a], name: "a")
  content((0,-1), [b], name: "b")
  content((0,-2), [c], name: "c")
  content((0,-3), [d], name: "d")
  content((0,-4), [e], name: "e")
  content((3,0),  [1], name: "1")
  content((3,-1), [2], name: "2")
  content((3,-2), [3], name: "3")
  content((3,-3), [4], name: "4")
  content((3,-4), [5], name: "5")
  content((3,-5), [6], name: "6")
  content(("a",1.5,"1"), [$R$], anchor: "south", padding: .5)
  set-style(mark: (end: ">"), stroke: green, fill:green)
  line("a", "3")
  line("b", "1")
  line("b", "6")
  line("d", "1")
  line("e", "6")
})]
]

+ Definiálja relációk kompozı́cióját! \ Legyen $R eq {(a, 1), (a, 2), (b, 1), (b, 4)} "és" S eq {(1, alpha), (1, beta), (2, alpha)}.$ Mi lesz az $S circle.stroked.tiny R$ kompozı́ció? \ #text(style: "italic", fill: gray)[Picit lemaradt a feladat szövege az eredeti pdf-ben, így nem biztos, hogy értelmes a feladat]

+ Definiálja a szimmetrikus relációkat! \ Szimmetrikus-e az $R eq {(1, 2), (1, 3), (2, 3), (3, 1)} subset {1, 2, 3} times {1, 2, 3}$ reláció?

+ Definiálja a reflexı́v relációkat! \ Reflexı́v-e az $R eq {(1, 2), (1, 3), (2, 3), (3, 1)} subset {1, 2, 3} times {1, 2, 3}$ reláció?

+ Definiálja a tranzitı́v relációkat! \ Tranzitı́v-e az $R eq {(1, 2), (1, 3), (2, 3), (3, 1)} subset {1, 2, 3} times {1, 2, 3}$ reláció?

+ Definiálja az ekvivalencia reláció fogalmát! \ Adjon két különböző példát ekvivalencia relációra az $X eq {1, 2, 3}$ halmazon!

+ Definiálja az osztályozás fogalmát! \ Adjon két különböző példát osztályozásra az $X eq {1, 2, 3}$ halmazon!

== Komplex számok

+ Definiálja komplex számok trigonometrikus alakját! Mi lesz a $z eq 1 + i in CC$ szám trigonometrikus alakja?

+ Mondja ki a szorzásra vonatkozó Moivre azonosságot! Mi lesz a $z eq 3(cos(pi/3) + i dot sin(pi/3))$ és $w = 7(cos((5pi)/6)+i dot sin((5pi)/6))$ számok szorzatának trigonometrikus alakja?

+ Mondja ki az osztásra vonatkozó Moivre azonosságot! Mi lesz a $z eq 3(cos(π/3) + i dot sin(π/3))$ és $w eq 7(cos((5pi)/6) + i dot sin((5pi)/6))$ számok hányadosának trigonometrikus alakja?