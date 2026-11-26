---
title: Aide de Chaos
---

## Chaos

Un système dynamique est uneéquation différentielle ordinaire comportant
plusieurs dimensions spatiales. Ces exemples sont tous deséquations du premier
ordre en deux dimensions spatiales, ce qui signifie que la position d'un point
détermine entièrement sa vitesse.

$$
\begin{aligned}
x'(t) &= f_x(x(t), y(t), t) \\
y'(t) &= f_y(x(t), y(t), t)
\end{aligned}
$$

On peut comparer ce champàunécoulement d'eau. Nous allons déposer quelques
particules de poussière dans l'eau et observer leur dérive. La comparaison a
ses limites, car l'eau est presque incompressible alors que ces champs ne le
sont pas.

Les premiers exemples sont très simples. Le dernier montre un comportement
chaotique particulièrement riche. Des références d'ouvrages sont recommandées
au bas de la page.

### Isoclines

Cochez la case « Iso » pour afficher les isoclines (aussi appelées
nullclines). Ce sont les courbes où une composante de la vitesse est nulle :

* Sur l'isocline en $x$ ($x' = 0$), le mouvement horizontal s'annule et le flux
  est purement vertical. C'est en traversant cette courbe que le flux passe
  d'un déplacement vers la gauche à un déplacement vers la droite.

* Sur l'isocline en $y$ ($y' = 0$), le mouvement vertical s'annule et le flux
  est purement horizontal. C'est en traversant cette courbe que le flux passe
  d'un déplacement vers le haut à un déplacement vers le bas.

Les isoclines aident à comprendre le flux car elles découpent le plan en zones
de direction cohérente (haut-gauche, haut-droite, bas-gauche, bas-droite). Là
où une isocline en $x$ et une isocline en $y$ se croisent, on a à la fois
$x' = 0$ et $y' = 0$ : c'est un **point stationnaire** (d'équilibre) où une
particule reste immobile.

Consultez [Champs](fields.html) pour découvrir les champs vectoriels
présentés. Consultez [Commandes](controls.html) pour apprendre à utiliser le
programme.

### Références

Pour aller plus loin, nous recommandons :

* [Nonlinear Dynamics and Chaos](https://www.wiley.com/en-us/Nonlinear+Dynamics+and+Chaos%2C+2nd+Edition-p-9780471876847)
  de J. M. T. Thompson et H. B. Stewart.

* [Strange attractors, chaotic behavior, and information flow](https://www.degruyter.com/document/doi/10.1515/zna-1981-0115/html)
  de R. Shaw.
