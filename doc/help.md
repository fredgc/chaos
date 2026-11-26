---
title: Chaos Help Page
---

## Chaos

A dynamic system is an ordinary differential equation with several spatial
dimensions. These examples are all first order equations in two spatial
dimensions, which means the position of a point completely determines its
velocity.

$$
\begin{aligned}
x'(t) &= f_x(x(t), y(t), t) \\
y'(t) &= f_y(x(t), y(t), t)
\end{aligned}
$$

You can think of the field being a flow of water. We are going to drop some
motes of dust into the water and watch where they flow. This is not a great
analogy because water is not very compressible, and these flows are.

The first few examples are quite simple. The last one shows some interesting
behavior. Scroll to the bottom for some recommended reading.

### Isoclines

Turn on the "Iso" checkbox to display the isoclines (also called nullclines).
These are the curves where one component of the velocity is zero:

* On the $x$-isocline ($x' = 0$), horizontal motion stops and the flow is
  purely vertical. Crossing this curve is where the flow changes between moving
  left and moving right.

* On the $y$-isocline ($y' = 0$), vertical motion stops and the flow is purely
  horizontal. Crossing this curve is where the flow changes between moving up
  and moving down.

Isoclines are useful because they divide the plane into regions where the flow
moves in a consistent direction (up-left, up-right, down-left, or down-right).
Wherever an $x$-isocline and a $y$-isocline cross, both $x' = 0$ and $y' = 0$,
marking a **stationary point** (equilibrium) where a mote stays still.

See [Fields](fields.html) for the sample fields drawn by this program. See
[Controls](controls.html) for how to use the program.

### References

For more reading, I recommend:

* [Nonlinear Dynamics and Chaos](https://www.wiley.com/en-us/Nonlinear+Dynamics+and+Chaos%2C+2nd+Edition-p-9780471876847)
  by J. M. T. Thompson and H. B. Stewart.

* [Strange attractors, chaotic behavior, and information flow](https://www.degruyter.com/document/doi/10.1515/zna-1981-0115/html)
  by R. Shaw.
