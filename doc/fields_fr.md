---
title: Champs de Démonstration de Chaos
---

## Champs présentés

Voici la liste des champs vectoriels présentés. Nous vous recommandons de les
étudier dans l'ordre.

### Rotation simple

Il s'agit d'une simple rotation dans le sens des aiguilles d'une montre.

```
x' =     y + p*saw(x)
y' = -x    + p*saw(y)
```

En notation vectorielle :

```
v' = [ 0  1]v  + perturbation
     [-1  0]

v = [x]
    [y]
```

La perturbation est une fonction en dents de scie dépendant du paramètre.
Ajoutez quelques particules et cliquez sur«lecture». Elles tournent en cercle
dans le sens horaire.

En augmentant la valeur du paramètre, les particules s'écartent légèrement de
leur trajectoire initiale.

Cochez la case«Champ»pour afficher le champ vectoriel. Le champétant borné, la
trajectoire de chaque particule est lisse et totalement déterminée par son
point de départ. Les trajectoires ne peuvent donc jamais se croiser.

Cochez«Iso»pour afficher les isoclines. Ce sont les courbes oùla composante x
ou y du champ est nulle. Si `x' = 0`, le champ est vertical. Si `y' = 0`, le
champ est horizontal. Si les deux sont nuls, la particule est immobile : c'est
un point stationnaire du système dynamique.

### Spirale – point stable contre point instable

Nous modifions l'exemple précédent en introduisant une dépendance linéaire de
`x'` par rapportà`x` et de `y'` par rapportà`y` :

```
x' = p*x +   y
y' =  -x + p*y
```

Au départ, `p = 0`, ce qui correspondàla rotation ci-dessus. Il y a un point
stationnaireàl'origine `(0,0)`.

Déplacez le curseur vers la gauche (`p < 0`) : les particules spiralent vers
le point stationnaire. C'est un point stationnaire stable. Les particules
proches restentàproximitédu point.

Déplacez le curseur vers la droite (`p > 0`) : les particules spiralent en
s'éloignant du point stationnaire. C'est un point stationnaire instable.

Observez les zones séparées par les isoclines. Dans chaque zone, les
particules s'orientent vers un quadrant donné.

### Brassage (Stir)

Voici un exemple comportant plusieurs points stationnaires, certains stables
et d'autres instables. Les particules proches d'un point instable s'en
éloignent puis s'approchent des points stables.

```
x' = -0.2 x^3 + saw(y, y_cent)
y' = -0.2 y^3 - saw(x, x_cent)
                        /
                   /\  /
 saw(x,c) =       /  \/
                 /
```

Modifiez le paramètre : les points stationnaires se déplacent, entraînant les
particules dans un motif chaotique.

Leséquationsétant lisses, des particules partant proches l'une de l'autre
restent prochesàcourt terme.Àlong terme, elles finissent par diverger.

Cela illustre un paradoxe apparent du calcul différentiel : pour `t` fixé, la
position `(x(t), y(t))` varie continûment par rapportà`(x(0), y(0))`. Mais si
l'on laisse `t` croître sans borne, cette continuités'estompe en pratique.

Cet exemple possède un attracteur mobile : avec le temps, toutes les
particules finissent par graviter autour de l'un des quatre points
d'attraction.

### Système chaotique avec attracteur étrange

Cet exemple est issu de l'ouvrage citédans la bibliographie.

```
x'(t) = 0.7y + 10x(0.1-y^2)
y'(t) = -x + 0.25 sin(1.57t)
```

Bien que chaotique, ce système possède un attracteur qui n'est pas une simple
courbe. Au fil du temps, l'attracteur se scinde et se replie sur lui-même. Les
particules s'éloignent puis se regroupent dans un ordre différent.

Ajoutez une grille de particules et observez comment les couleurs semblables
restent regroupées au début avant de se mélanger intimement, comme dans le
pétrissage du pain ou le forgeage de l'acier.

### Références

Pour aller plus loin, nous recommandons :

* [Nonlinear Dynamics and Chaos](https://www.wiley.com/en-us/Nonlinear+Dynamics+and+Chaos%2C+2nd+Edition-p-9780471876847)
  de J. M. T. Thompson et H. B. Stewart.

* [Strange attractors, chaotic behavior, and information flow](https://www.degruyter.com/document/doi/10.1515/zna-1981-0115/html)
  de R. Shaw.
