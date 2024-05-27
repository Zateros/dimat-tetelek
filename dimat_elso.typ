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

 + _Mondja ki a hatványozásra vonatkozó Moivre azonosságot! Mi lesz a $z = 3(cos(π/3) + i dot.op sin(π/3))$ számok tizenkettedik hatványának trigonometrikus alakja?_ \ \ Legyen $z in CC \\ {0}$ nem-nulla komplex számok: $ z eq abs(z) (cos(phi) + i sin(phi)) $ Ekkor $z^n eq abs(z)^n (cos n phi + i sin n phi)$ \ \ $z eq 3(cos(pi/3) + i sin(pi/3))$ $ z^12 eq abs(3)^12 (cos 12 (pi/3) + i sin 12(pi/3)) eq 3^12 (cos 4 pi + i sin 4 pi) eq \ eq 3^12 (cos 0 + i sin 0) eq 3^12 ( 1+0i) eq 3^12  $

+	_Adott $w eq.not 0$ komplex szám és $n ≥ 1$ egész esetén mik lesznek a $z^n = w$ komplex megoldásai? Mondja ki a megfelelő tételt! Hány megoldása van a $z^3 = −1$ egyenletnek komplex számok körében?_ \ \ Legyen $w in CC \\ {0}$ komplex szám $w eq abs(w) (cos psi + i sin psi)$ trigonometrikus alakkal. $z^n eq w, space z in CC$ egyenlet megoldásai: $ z_k eq abs(w)^(1/n) (cos phi_k + i sin phi_k): phi_k = psi/n + (2k psi)/n, space k eq 0,1,...,n-1 $ $ z^3 eq -1 arrow.double.long z eq root(3,-1) arrow.double.long z eq root(3,1)(cos(c(pi+2k pi)/3)+i sin((pi + 2k pi)/3)) $ Egyenletbe $k = 0,1,2$-re különbőző eredményt kapunk, tehát a $z^3 eq -1$ egyenletnek 3 megoldása van.


== Kombinatorika

+ _Hányféleképpen lehet n különböző elemet sorba állítani? Mondja ki a megfelelő összefüggést! Hányféleképpen lehet 5 különböző könyvet a polcra felrakni?_ \ \ $n$ elemből az első helyre $n$-féleképpen választhatunk, a második helyre $n-1$ féleképpen és így tovább,... . Így a szorzás szabály szerint az összes lehetőségek száma: $n(n-1)...2 dot.op 1 eq n!$ \ 5 különböző könyvet $5! eq 120$ féleképpen lehet sorbaállítani.

+ _Hányféleképpen lehet n, nem feltételen különböző elemet sorba állítani? Mondja ki a megfelelő összefüggést! Hányféleképpen lehet 7 hosszú szót lehet képezni három darab ’a’, két darab ’b’ és három darab ’c’ segítségével?_ \ \ Ha minden elem között különbséget teszünk, akkor $n!$ lehetséges sorrend van.\ Azonban ekkor egy lehetőséget többször is számoltunk. Nevezetesen, ha az $i$-edik elemből $k_i$ darab van, akkor a ismétlés nélküli permutáció és a szorzat-szabály szerint egy sorrendet $(k_1)! dot.op ... dot.op (k_m)!$-szer számoltunk. \ Így az osztás-szabály szerint, ha az azonos típusú elemek között nem teszünk különbséget, akkor $(k_1 + k_2 + ... k_m )!/(k_1!k_2!...k_m!)$ lehetséges sorrend van. \ \ $7!/(3!2!3!)$ féleképpen. 

+	_Hányféleképpen lehet k elemet választani egy n elemű halmazból, ha a kiválasztás sorrendje számít és egy elemet többször is felhasználhatunk? Hány 7 hosszú szót képezhetünk az ’a’, ’b’ és ’c’ karakterek felhasználásával?_ \ \ Mindegyik helyre $n$-féleképpen válaszhatunk elemet, tehát a szorzat-szabály 2 szerint, a lehetséges választások száma $n^k$ lehetséges sorrend van \ \ Mivel 3 fajta karakterünk van és 7 helyre kell választanunk, ezért $3^7$ féleképpen.

+	_Hányféleképpen lehet k elemet kiválasztani egy n elemű halmazból, ha a kiválasztás sorrendje számít és egy elemet csak egyszer választhatunk? Hány 5 hossz szót képezhetünk az ’a’, ’b’, ’c’, ’d’, ’e’, ’f’ és ’g’ karakterek felhasználásával, ha egy karaktert csak egyszer használhatunk?_ \ \ 1. helyre $n$-féleképpen válaszhatunk, 2. helyre $n-1$-féleképpen,..., a $k$-adik helyre $n-k+1$-féleképpen választanunk. Így a szorzat-szabály 2 szerint a lehetséges választások száma $n(n-1)(n-2)...(n-k+1) eq n!/(n-k)!$ lehetséges sorrend van. \ \ $n$ itt a betünk száma azaz 7 és a $k$ szó hossz azaz 5, tehát $7!/(7-5)!$ lehetséges sorrend van.

+	_Hányféleképpen lehet k elemet kiválasztani egy n elemű halmazból, ha a kiválasztás nem sorrendje számít és egy elemet csak egyszer választhatunk? Hányféleképpen tudunk kiválasztani 2 könyvet az 5-ből, amit nyaralásra viszünk magunkkal?_ \ \ Ha a sorrend számítana akkor $n!/(n-k)!$ lenne a lehetséges választások száma. Mivel azonban egy lehetőséget ekkor többször is számolunk ezért $k$ elem lehetséges sorrendjét figyelembe kell venni azaz $k!$. Így az osztás-szabály szerint, a lehetséges választások száma $(n!/(n-k)!)/k! eq vec(n,k)$ lehetséges sorend van. \ \ $n$ a könyvek száma és $k$ amennyit ki szeretnénk választani, azaz $vec(5,2)$ 

+	_Hányféleképpen lehet k elemet kiválasztani egy n elemű halmazból, ha a kiválasztás nem sorrendje számít és egy elemet többször is választhatunk? Hányféleképpen tudunk kiválasztani 3 gombócot választani az 5-féle fagylaltból, ha a választás sorrendje nem számít?_ \ \ Minden lehetséges választás megfelel egy 0-1 sorozatnak: $ 1,1,...1,0,1,1...1,0,1 $ Ekkor elég leszámlálin a lehetséges ilyen típusú sorozatokat. Itt pontosan $k$ darab 1-es van (választott elemek) és $n-1$ darab 0 (szeparátorok száma) azaz $vec(n+k-1,k)$ \ \ $n$ a fagylalt-félék száma és $k$ a gombócok száma, tehát $vec(5+3-1,3) eq vec(7,3)$

== Gráfok

+	_Mondja ki a gráf csúcsainak fokszáma és a gráf elszáma közötti osszefüggést! Van-e olyan egyszerű gráf, mely csúcsainak fokszámai 1,2,2,2,2,4? Válaszát indokolja!_ \ \ Minden $G eq (V,E) "gráfra " limits(sum)_(v in V) d(v) eq 2 abs(E)$ \ \ Nem létezik, mivel a páratlan fokszámú csúcsok száma nem páros (1).

+	_Definiálja gráfok izomorfiáját! Mutasson példát két gráfra melyek izomorfak, és adja meg a közöttük lévő izomorfiát is!_ \ \ Két $G eq (V,E) "és " H eq (U,F)$ gráf izomorfak, ha létezik olyan $f : V arrow U$ és $g : E arrow F$ bijekciók (egyértelmű hozzárendelések), hogy $ forall v in V and e in E : v in e arrow.l.r.double.long f(v) in g(e) $ #grid(
  columns: (auto, auto, auto),
  gutter: 5pt,
  image("izom1.png"),
  image("izom2.png"),
  image("table.png")
)

+	_Definiálja a részgráf és feszített részgráf fogalmát! Mutasson példát két G ill. H gráfra, melyekre H részgráfja, de nem feszített részgráfja G-nek!_ \ \ Egy $G eq (V,E)$ gráfnak a $H eq (U,F)$ gráf részgráfja, ha $U subset V and F subset E$ \ \ Egy $H eq (U,F)$ egy feszített részgráfja $G eq (V,E)$-nek, ha\ #box()[
- részgráfja: $U subset V and F subset E$
- feszített: $u_1,u_2 in U and {u_1,u_2} in E arrow.long.double {u_1,u_2} in F$
] #grid(
  columns: (auto, auto, auto),
  gutter: 5pt,
  image("resz1.png"),
  image("resz2.png"),
  $H eq G_3 "a feladat szövegében"$
)
+	_Definiálja a séta fogalmát gráfokra! Adjon példát két különböző sétára $v_1$ és $v_8$ között az alábbi gráfban:_ \ \ #grid(
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
+	_Definiálja az út fogalmát gráfokra! Adjon példát két különböző sétára $v_1$ és $v_8$ között az alábbi gráfban:_ #grid(
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

+	_Definiálja az összefüggő gráfok fogalmát! Mutasson egy-egy példát összefüggő és nem összefüggő gráfra!_ \ \ Egy $G eq (V,E)$ gráf összefüggő, ha $forall u,v in V, u eq.not v$ van $u$ és $v$ között séta. #align(center, grid(
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

+	_Definiálja a fa fogalmát gráfok körében! Mutasson egy-egy példát fa és nem fa gráfra!_ \ \ Egy $G eq (V,E)$ gráfot fának hívunk, ha\ #box[
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

+	_Definiálja az Euler-séta fogalmát! Mutasson példát Euler-sétára az alábbi gráfban:_ \ \ Egy $G$ gráfban a $v_0,e_1,v_1,...,v_(k-1),e_k,v_k$ séta egy Euler-séta, ha #box[
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

+ _Definiálja a Hamilton-út fogalmát! Mutasson példát Hamilton-útra az alábbi gráfban:_ \ \ Legyen $G$ egy véges egyszerű gráf. A $G$ gráfban egy út Hamilton út, ha minden csúcsot pontosan egyszer tartalmaz. \ #align(center, grid(
  columns: (auto, auto),
  gutter: 5pt,
  align: horizon,
  image("euler.png"),
  $v_1, e_1, v_2, e_2, v_4, e_3, v_5, e_8, v_6, e_6, v_3$
  )
)

