---
title: Página de Ayuda de Caos
---

## Caos

Un sistema dinámico es una ecuación diferencial ordinaria con varias
dimensiones espaciales. Estos ejemplos son ecuaciones de primer orden en dos
dimensiones espaciales, lo que significa que la posición de un punto determina
completamente su velocidad.

$$
\begin{aligned}
x'(t) &= f_x(x(t), y(t), t) \\
y'(t) &= f_y(x(t), y(t), t)
\end{aligned}
$$

Puede pensar en el campo como una corriente de agua. Vamos a colocar algunas
motas de polvo en el agua y observar hacia dónde fluyen. Esta no es una
analogía perfecta porque el agua no es muy compresible y estos flujos sílo
son.

Los primeros ejemplos son bastante simples. El último muestra un comportamiento
interesante. Desplácese hasta el final para ver lecturas recomendadas.

### Isoclinas

Active la casilla "Iso" para mostrar las isoclinas (también llamadas
nulclinas). Son las curvas donde una componente de la velocidad es cero:

* En la isoclina en $x$ ($x' = 0$), el movimiento horizontal se detiene y el
  flujo es puramente vertical. Al cruzar esta curva el flujo cambia entre
  moverse hacia la izquierda y hacia la derecha.

* En la isoclina en $y$ ($y' = 0$), el movimiento vertical se detiene y el
  flujo es puramente horizontal. Al cruzar esta curva el flujo cambia entre
  moverse hacia arriba y hacia abajo.

Las isoclinas son útiles porque dividen el plano en regiones donde el flujo
mantiene una dirección constante (arriba-izquierda, arriba-derecha,
abajo-izquierda o abajo-derecha). Donde se cruzan una isoclina en $x$ y una
isoclina en $y$, tanto $x' = 0$ como $y' = 0$, lo que marca un **punto
estacionario** (de equilibrio) donde una mota permanece inmóvil.

Consulte [Campos](fields_es.html) para ver los campos de muestra dibujados por
este programa. Consulte [Controles](controls_es.html) para aprender a usar el
programa.

### Referencias

Para más lecturas, recomiendo:

* [Nonlinear Dynamics and Chaos](https://www.wiley.com/en-us/Nonlinear+Dynamics+and+Chaos%2C+2nd+Edition-p-9780471876847)
  por J. M. T. Thompson y H. B. Stewart.

* [Strange attractors, chaotic behavior, and information flow](https://www.degruyter.com/document/doi/10.1515/zna-1981-0115/html)
  por R. Shaw.
