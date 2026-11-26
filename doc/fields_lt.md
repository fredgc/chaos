---
title: Chaoso Pavyzdiniai Laukai
---

## Pavyzdiniai laukai

Štai rodomų vektorinių laukų sąrašas. Rekomenduojame juos peržiūrėti iš eilės.

### Paprastas sukimasis

Tai paprastas sukimasis pagal laikrodžio rodyklę.

$$
\begin{aligned}
x' &= y + p \operatorname{saw}(x) \\
y' &= -x + p \operatorname{saw}(y)
\end{aligned}
$$

Arba vektoriniu pavidalu:

$$
\mathbf{v}' = \begin{bmatrix} 0 & 1 \\ -1 & 0 \end{bmatrix} \mathbf{v}
  + \text{trikdis}, \qquad
\mathbf{v} = \begin{bmatrix} x \\ y \end{bmatrix}
$$

Trikdis yra pjūklo formos funkcija, priklausanti nuo parametro. Pridėkite
kelias daleles ir spustelėkite „Groti“. Pamatysite, kaip jos sukasi ratu pagal
laikrodžio rodyklę.

Padidinus parametro reikšmę, dalelės šiek tiek nukryps nuo savo ankstesnių
trajektorijų.

Pažymėkite langelį „Fld“, kad pamatytumėte vektorinį lauką. Kadangi vektorinis
laukas yra aprėžtas, kiekvienos dalelės kelias yra tolygus ir visiškai
nulemtas jos pradinio taško. Tai reiškia, kad dalelių trajektorijos niekada
nesikerta.

Pažymėkite langelį „Iso“, kad pamatytumėte izoklinas. Tai kreivės, kuriose
vektorinio lauko $x$ arba $y$ koordinatė lygi 0. Jei $x' = 0$, laukas yra
vertikalus. Jei $y' = 0$, laukas yra horizontalus. Jei abi lygios 0, dalelė
nejuda. Tai vadinama dinaminės sistemos pusiausvyros (stacionariuoju) tašku.

### Spiralė – stabilus ir nestabilus taškas

Pakeičiame ankstesnį pavyzdį pridėdami tiesinę $x'$ priklausomybę nuo $x$ ir
$y'$ nuo $y$:

$$
\begin{aligned}
x' &= px + y \\
y' &= -x + py
\end{aligned}
$$

Pradžioje $p = 0$, todėl judėjimas identiškas sukimuisi aukščiau. Centre
$(0, 0)$ yra stacionarusis taškas.

Pajudinkite parametrą į kairę ($p < 0$). Dalelės ims spiralėmis artėti prie
stacionariojo taško. Tai stabilus stacionarusis taškas: dalelės,
prasidedančios šalia jo, lieka šalia.

Pajudinkite parametrą į dešinę ($p > 0$). Dalelės ims spiralėmis tolti nuo
stacionariojo taško. Tai nestabilus stacionarusis taškas.

Pažvelkite į sritis, kurias skiria izoklinos. Kiekvienoje srityje dalelės juda
į atitinkamą kvadranto pusę.

### Maišymas (Stir)

Tai pavyzdys su keliais stacionariaisiais taškais—vieni stabilūs, kiti
nestabilūs. Dalelė šalia nestabilaus taško tolsta nuo jo ir artėja prie
stabilių taškų.

$$
\begin{aligned}
x' &= -0.2 x^3 + \operatorname{saw}(y, y_{\text{cent}}) \\
y' &= -0.2 y^3 - \operatorname{saw}(x, x_{\text{cent}})
\end{aligned}
$$

```
                        /
                   /\  /
 saw(x, c) =      /  \/
                 /
```

Pakeiskite parametrą ir stacionarieji taškai ims judėti. Dalelės seks paskui
juos ir susidarys chaotiška netvarka.

Kadangi lygtys tolydžios, dalelės, prasidedančios viena šalia kitos, trumpuoju
laikotarpiu lieka arti. Tačiau ilgainiui jos išsiskiria.

Tai atrodo kaip matematinės analizės paradoksas: fiksuotai $t$ reikšmei
padėtis $(x(t), y(t))$ kinta tolydžiai pradinės padėties $(x(0), y(0))$
atžvilgiu. Tačiau leidus $t$ augti be ribų, šis tolydumas praktiškai
prarandamas.

Šiame pavyzdyje yra atraktorius, kuris juda laike: galiausiai visos dalelės
ima glaudžiai suktis apie vieną iš keturių atraktoriaus taškų.

### Chaotinė sistema su keistuoju atraktoriumi

Šis pavyzdys paimtas iš literatūros skyriuje nurodytos knygos.

$$
\begin{aligned}
x'(t) &= 0.7y + 10x(0.1 - y^2) \\
y'(t) &= -x + 0.25 \sin(1.57t)
\end{aligned}
$$

Nors ši sistema chaotiška, ji turi atraktorių. Atraktorius nėra paprasta
kreivė: bėgant laikui jis atsiskiria ir susilanksto pats į save. Dalelės
išsisklaido, o paskui vėl susirenka, bet jau kita tvarka.

Pridėkite dalelių tinklelį ir stebėkite, kaip panašios spalvos pradžioje lieka
greta, o vėliau susimaišo—panašiai kaip minkant duoną ar kalant plieną.

### Literatūra

Išsamesniam susipažinimui rekomenduojame:

* [Nonlinear Dynamics and Chaos](https://www.wiley.com/en-us/Nonlinear+Dynamics+and+Chaos%2C+2nd+Edition-p-9780471876847)
  (autoriai J. M. T. Thompson ir H. B. Stewart).

* [Strange attractors, chaotic behavior, and information flow](https://www.degruyter.com/document/doi/10.1515/zna-1981-0115/html)
  (autorius R. Shaw).
