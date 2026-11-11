---
title: Campos de Demostración de Caos
---

## Campos de Demostración

Aquíestála lista de campos vectoriales mostrados. Recomiendo verlos en orden.

### Rotación simple

Esta es una rotación simple en sentido horario.

```
x' =     y + p*saw(x)
y' = -x    + p*saw(y)
```

O en notación vectorial:

```
v' = [ 0  1]v  + perturbación
     [-1  0]

v = [x]
    [y]
```

La perturbación es una onda de diente de sierra que depende del parámetro.
Añada unas cuantas motas al flujo y presione "reproducir". Debería verlas
fluir en un círculo en el sentido de las agujas del reloj.

Aumente el valor del parámetro y las motas se desviarán ligeramente de sus
trayectorias previas.

Active la casilla "Campo" para mostrar el campo vectorial. Debido a que el
campo vectorial estáacotado, la trayectoria de cada mota es suave y está
completamente determinada por su punto de partida. Eso significa que las motas
nunca pueden cruzarse.

Active la casilla "Iso" para mostrar las isoclinas. Estas son las curvas donde
el campo vectorial es 0 en el componente x o en el y. Si `x' = 0`, el campo
vectorial es vertical y la mota viaja verticalmente. Si `y' = 0`, el campo
vectorial es horizontal y la mota viaja horizontalmente. Si ambos son 0, la
mota permanece estacionaria. Esto también se llama punto estacionario del
sistema dinámico.

### Espiral: punto estable frente a inestable

Modificamos el ejemplo anterior agregando una dependencia lineal de `x'` sobre
`x` y de `y'` sobre `y`:

```
x' = p*x +   y
y' =  -x + p*y
```

Al comenzar, `p = 0`, por lo que es idéntico a la rotación anterior. Hay un
punto estacionario en el centro `(0,0)`.

Mueva el parámetro hacia la izquierda para que `p < 0`. Las motas comenzarán a
girar en espiral hacia el punto estacionario. Este es un punto estacionario
estable. Las motas que comienzan cerca del punto estacionario permanecerán
cerca deél.

Mueva el parámetro hacia la derecha para que `p > 0`. Las motas comenzarán a
girar en espiral alejándose del punto estacionario. Este es un punto
estacionario inestable. Las motas que comienzan cerca del punto estacionario
terminarán alejándose deél.

Observe las regiones separadas por las isoclinas. En cada región, las motas
tienden a moverse "arriba y a la izquierda", "arriba y a la derecha", "abajo y
a la izquierda" o "abajo y a la derecha".

### Remolino

Aquíhay un ejemplo con varios puntos estacionarios. Algunos son estables y
otros inestables. Observe que si añade una mota cerca de uno de los puntos
inestables, esta se aleja y luego comienza a acercarse a los puntos estables.

```
x' = -0.2 x^3 + saw(y, y_cent)
y' = -0.2 y^3 - saw(x, x_cent)
                        /
                   /\  /
 saw(x,c) =       /  \/
                 /
```

Cambie el parámetro y los puntos estacionarios comenzarán a moverse. Las motas
comenzarán a seguirlos. Terminarácon un caos dinámico.

Debido a que las ecuaciones son suaves, las motas que comienzan cerca unas de
otras se mantendrán cerca a corto plazo. Sin embargo, si espera el tiempo
suficiente, terminarán distanciándose.

Esto parece una paradoja del cálculo: si fija un valor de `t`, la posición
`(x(t), y(t))` varía continuamente con respecto a `(x(0), y(0))`. Pero si no
fija `t` y deja que crezca, se pierde esa continuidad.

Este ejemplo es interesante porque hay un atractor que se mueve con el tiempo:
eventualmente todas las motas terminan girando en espiral alrededor de uno de
los cuatro puntos atractores.

### Sistema caótico con atractor extraño

Este es un ejemplo del libro mencionado en la sección de referencias a
continuación.

```
x'(t) = 0.7y + 10x(0.1-y^2)
y'(t) = -x + 0.25 sin(1.57t)
```

Aunque este sistema es caótico, posee un atractor. Observe que el atractor no
es una curva simple. A medida que avanza el tiempo, el atractor se divide y se
pliega sobre símismo. Las motas se separarán y luego volverán a juntarse pero
en un orden diferente.

Añada una cuadrícula de motas y observe cómo los colores similares permanecen
cerca al principio y luego comienzan a mezclarse. Recuerda el amasado del pan
o el forjado del acero.

### Referencias

Para más lecturas, recomiendo:

* [Nonlinear Dynamics and Chaos](https://www.wiley.com/en-us/Nonlinear+Dynamics+and+Chaos%2C+2nd+Edition-p-9780471876847)
  por J. M. T. Thompson y H. B. Stewart.

* [Strange attractors, chaotic behavior, and information flow](https://www.degruyter.com/document/doi/10.1515/zna-1981-0115/html)
  por R. Shaw.
