---
title: Chaoso Pavyzdiniai Laukai
---

## Pavyzdiniai laukai

Štai rodomųvektoriniųlaukųsąrašas. Rekomenduojame juos peržiūrėti išeilės.

### Paprastas sukimasis

Tai paprastas sukimasis pagal laikrodžio rodyklę.

```
x' =     y + p*saw(x)
y' = -x    + p*saw(y)
```

Arba vektoriniu pavidalu:

```
v' = [ 0  1]v  + trikdis
     [-1  0]

v = [x]
    [y]
```

Trikdis yra pjūklo formos funkcija, priklausanti nuo parametro. Pridėkite
kelias daleles ir spustelėkite„Groti“. Pamatysite, kaip jos sukasi ratu pagal
laikrodžio rodyklę.

Padidinus parametro reikšmę, dalelėsšiek tiek nukryps nuo savo ankstesnių
trajektorijų.

Pažymėkite langelį„Fld“, kad pamatytumėte vektorinįlauką. Kadangi vektorinis
laukas yra aprėžtas, kiekvienos dalelės kelias yra tolygus ir visiškai
nulemtas jos pradinio taško. Tai reiškia, kad daleliųtrajektorijos niekada
nesikerta.

Pažymėkite langelį„Iso“, kad pamatytumėte izoklinas. Tai kreivės, kuriose
vektorinio lauko x arba y koordinatėlygi 0. Jei `x' = 0`, laukas yra
vertikalus. Jei `y' = 0`, laukas yra horizontalus. Jei abi lygios 0, dalelė
nejuda. Tai vadinama dinaminės sistemos pusiausvyros (stacionariuoju) tašku.

### Spiralė – stabilus ir nestabilus taškas

Pakeičiame ankstesnįpavyzdįpridėdami tiesinę`x'` priklausomybęnuo `x` ir `y'`
nuo `y`:

```
x' = p*x +   y
y' =  -x + p*y
```

Pradžioje `p = 0`, todėl judėjimas identiškas sukimuisi aukščiau. Centre
`(0,0)` yra stacionarusis taškas.

Pajudinkite parametrąįkairę(`p < 0`). Dalelės ims spiralėmis artėti prie
stacionariojo taško. Tai stabilus stacionarusis taškas: dalelės,
prasidedančiosšalia jo, liekašalia.

Pajudinkite parametrąįdešinę(`p > 0`). Dalelės ims spiralėmis tolti nuo
stacionariojo taško. Tai nestabilus stacionarusis taškas.

Pažvelkiteįsritis, kurias skiria izoklinos. Kiekvienoje srityje dalelės judaį
atitinkamąkvadranto pusę.

### Maišymas (Stir)

Tai pavyzdys su keliais stacionariaisiais taškais—vieni stabilūs, kiti
nestabilūs. Dalelėšalia nestabilaus taško tolsta nuo jo ir artėja prie
stabiliųtaškų.

```
x' = -0.2 x^3 + saw(y, y_cent)
y' = -0.2 y^3 - saw(x, x_cent)
                        /
                   /\  /
 saw(x,c) =       /  \/
                 /
```

Pakeiskite parametrąir stacionarieji taškai ims judėti. Dalelės seks paskui
juos ir susidarys chaotiška netvarka.

Kadangi lygtys tolydžios, dalelės, prasidedančios vienašalia kitos, trumpuoju
laikotarpiu lieka arti. Tačiau ilgainiui jos išsiskiria.

Tai atrodo kaip matematinės analizės paradoksas: fiksuotai `t` reikšmei
padėtis `(x(t), y(t))` kinta tolydžiai pradinės padėties `(x(0), y(0))`
atžvilgiu. Tačiau leidus `t` augti be ribų,šis tolydumas praktiškai
prarandamas.

Šiame pavyzdyje yra atraktorius, kuris juda laike: galiausiai visos dalelės
ima glaudžiai suktis apie vienąišketuriųatraktoriaus taškų.

### Chaotinė sistema su keistuoju atraktoriumi

Šis pavyzdys paimtas išliteratūros skyriuje nurodytos knygos.

```
x'(t) = 0.7y + 10x(0.1-y^2)
y'(t) = -x + 0.25 sin(1.57t)
```

Norsši sistema chaotiška, ji turi atraktorių. Atraktorius nėra paprasta
kreivė: bėgant laikui jis atsiskiria ir susilanksto patsįsave. Dalelės
išsisklaido, o paskui vėl susirenka, bet jau kita tvarka.

Pridėkite daleliųtinklelįir stebėkite, kaip panašios spalvos pradžioje lieka
gretos, o vėliau susimaišo—panašiai kaip minkant duonąar kalant plieną.

### Literatūra

Išsamesniam susipažinimui rekomenduojame:

* [Nonlinear Dynamics and Chaos](https://www.wiley.com/en-us/Nonlinear+Dynamics+and+Chaos%2C+2nd+Edition-p-9780471876847)
  (autoriai J. M. T. Thompson ir H. B. Stewart).

* [Strange attractors, chaotic behavior, and information flow](https://www.degruyter.com/document/doi/10.1515/zna-1981-0115/html)
  (autorius R. Shaw).
