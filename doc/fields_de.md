---
title: Chaos-Demo-Felder
---

## Beispielfelder

Hier ist die Liste der dargestellten Vektorfelder. Wir empfehlen, sie der
Reihe nach zu betrachten.

### Einfache Rotation

Dies ist eine einfache Rotation im Uhrzeigersinn.

```
x' =     y + p*saw(x)
y' = -x    + p*saw(y)
```

In Vektorschreibweise:

```
v' = [ 0  1]v  + Störung
     [-1  0]

v = [x]
    [y]
```

Die Störung ist eine Sägezahnfunktion, die vom Parameter abhängt. Fügen Sie
einige Partikel hinzu und klicken Sie auf„Start“. Sie bewegen sich auf einer
Kreisbahn im Uhrzeigersinn.

Erhöhen Sie den Parameterwert, weichen die Partikel leicht von ihren
bisherigen Bahnen ab.

Aktivieren Sie das Kontrollkästchen„Feld“, um das Vektorfeld einzublenden. Da
das Vektorfeld beschränkt ist, ist die Bahn jedes Partikels glatt und wird
vollständig durch seinen Startpunkt bestimmt. Partikelbahnen können sich daher
nie kreuzen.

Aktivieren Sie das Kontrollkästchen„Iso“, um die Isoklinen anzuzeigen. Auf
diesen Kurven verschwindet die x- oder y-Komponente des Vektorfelds. Wenn `x'
= 0`, verläuft das Vektorfeld rein vertikal. Wenn `y' = 0`, verläuft es rein
horizontal. Sind beide 0, bleibt das Partikel in Ruhe. Dies wird als
stationärer Punkt des dynamischen Systems bezeichnet.

### Spirale – stabiler versus instabiler Punkt

Wir erweitern das vorherige Beispiel um eine lineare Abhängigkeit von `x'` von
`x` und `y'` von `y`:

```
x' = p*x +   y
y' =  -x + p*y
```

Zu Beginn ist `p = 0`, was der obigen reinen Rotation entspricht. Im Ursprung
`(0,0)` liegt ein stationärer Punkt.

Wird der Parameter nach links verschoben (`p < 0`), spiralen die Partikel auf
den stationären Punkt zu. Dies ist ein stabiler Gleichgewichtspunkt: Partikel,
die nahe am Punkt starten, bleiben in seiner Nähe.

Wird der Parameter nach rechts verschoben (`p > 0`), spiralen die Partikel vom
Punkt weg. Dies ist ein instabiler Gleichgewichtspunkt: Partikel entfernen
sich mit der Zeit.

Beachten Sie die durch die Isoklinen getrennten Bereiche. In jedem Bereich
streben die Partikel in eine bestimmte Quadrantenrichtung.

### Rühren (Stir)

Hier ist ein Beispiel mit mehreren stationären Punkten—manche stabil, manche
instabil. Partikel nahe instabilen Punkten driften ab und nähern sich den
stabilen Punkten.

```
x' = -0.2 x^3 + saw(y, y_cent)
y' = -0.2 y^3 - saw(x, x_cent)
                        /
                   /\  /
 saw(x,c) =       /  \/
                 /
```

Wird der Parameter verändert, beginnen die stationären Punkte zu wandern. Die
Partikel folgen ihnen und es entsteht ein chaotisches Muster.

Da die Gleichungen glatt sind, bleiben Partikel, die nahe beieinander starten,
zunächst nahe beieinander. Nach längerer Zeit driften sie jedoch unweigerlich
auseinander.

Dies veranschaulicht ein scheinbares Paradoxon der Analysis: Bei festem `t`
hängt die Position `(x(t), y(t))` stetig von den Anfangswerten `(x(0), y(0))`
ab. Lässt man `t` jedoch beliebig großwerden, geht diese Stetigkeit in der
Praxis verloren.

Dieses Beispiel besitzt einen sich mit der Zeit bewegenden Attraktor:
Schließlich kreisen alle Partikel eng um einen der vier Attraktor-Punkte.

### Chaotisches System mit seltsamem Attraktor

Dieses Beispiel stammt aus dem in den Literaturhinweisen genannten Fachbuch.

```
x'(t) = 0.7y + 10x(0.1-y^2)
y'(t) = -x + 0.25 sin(1.57t)
```

Obwohl dieses System chaotisch ist, besitzt es einen Attraktor. Der Attraktor
ist keine einfache Kurve: Mit fortschreitender Zeit teilt und faltet er sich.
Partikel entfernen sich voneinander und finden in veränderter Reihenfolge
wieder zusammen.

Fügen Sie ein Partikelgitter hinzu und beobachten Sie, wieähnliche Farben
anfangs zusammenbleiben und sich dann durchmischen—vergleichbar mit dem Kneten
von Teig oder dem Schmieden von Damaszener Stahl.

### Literaturhinweise

Für weiterführende Lektüre empfehlen wir:

* [Nonlinear Dynamics and Chaos](https://www.wiley.com/en-us/Nonlinear+Dynamics+and+Chaos%2C+2nd+Edition-p-9780471876847)
  von J. M. T. Thompson und H. B. Stewart.

* [Strange attractors, chaotic behavior, and information flow](https://www.degruyter.com/document/doi/10.1515/zna-1981-0115/html)
  von R. Shaw.
