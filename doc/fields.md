---
title: Chaos Demo Fields
---

## Demo Fields

Here is the list of vector fields shown. I recommend you look at them in
order.

### Simple rotation

This is a simple clockwise rotation.

```
x' =     y + p*saw(x)
y' = -x    + p*saw(y)
```

Or in vector notation:

```
v' = [ 0  1]v  + perturbation
     [-1  0]

v = [x]
    [y]
```

The perturbation is a sawtooth that depends on the parameter. Add a few motes
to the flow and click "play". You should see them flowing in a clockwise
circle.

Increase the size of the parameter and the motes will slightly deviate from
their previous paths.

Turn on the checkbox "Fld" to show the vector field. Because the vector field
is bounded, the path of each mote is smooth and it is completely determined by
the mote's starting point. That means the motes can never intersect.

Turn on the checkbox "Iso" to display the isoclines. These are the curves
where the vector field is 0 in either the x or y component. If `x' = 0` then
the vector field is vertical and the mote is traveling vertically. If `y' = 0`
then the vector field is horizontal and the mote is traveling horizontally. If
both are 0 then the mote is stationary. This is also called a stationary point
of the dynamic system.

### Spiral - stable versus unstable point

We change the previous example by adding a linear dependency of `x'` on `x`
and `y'` on `y`:

```
x' = p*x +   y
y' =  -x + p*y
```

When you start out, `p = 0`, so it is identical to the rotation above. There
is a stationary point at the center `(0,0)`.

Move the parameter to the left so that `p < 0`. The motes will start to spiral
toward the stationary point. This is a stable stationary point. Motes that
start near the stationary point will stay near the stationary point.

Move the parameter to the right so that `p > 0`. The motes will start to
spiral away from the stationary point. This is an unstable stationary point.
Motes that start near the stationary point will eventually move away from the
stationary point.

Look at the regions separated by the isoclines. In each region, the motes tend
to move "up and left", "up and right", "down and left" or "down and right".

### Stir

Here is an example with several stationary points. Some are stable and some
are unstable. Notice that if you add a mote near one of the unstable points it
drifts away and then starts to approach the stable points.

```
x' = -0.2 x^3 + saw(y, y_cent)
y' = -0.2 y^3 - saw(x, x_cent)
                        /
                   /\  /
 saw(x,c) =       /  \/
                 /
```

Change the parameter and the stationary points will start to move. The motes
will start to follow. You end up with a chaotic mess.

Because the equations are smooth, motes that start near each other, will in
the short term, stay near each other. However, if you wait long enough they
will eventually drift apart.

This seems like a paradox of calculus: if you fix a value of `t`, then the
position `(x(t), y(t))` varies continuously with respect to `(x(0), y(0))`.
But if you do not fix `t`, and let it grow large, then you lose that
continuity.

This example is interesting because there is an attractor that moves with
time: eventually all the motes end up spiraling closely around one of the four
attractor points.

### Chaotic System w/Strange Attractor

This is an example from the book mentioned in the reference section below.

```
x'(t) = 0.7y + 10x(0.1-y^2)
y'(t) = -x + 0.25 sin(1.57t)
```

Although this system is chaotic, it has an attractor. Notice that the
attractor is not really a simple curve. As time advances, the attractor
separates and folds on itself. The motes will drift apart and then drift back
together but in a different order.

Add a grid of motes and watch how the similar colors stay near each other at
first, and then start to mix together. It is reminiscent of kneading bread or
forging steel.

### References

For more reading, I recommend:

* [Nonlinear Dynamics and Chaos](https://www.wiley.com/en-us/Nonlinear+Dynamics+and+Chaos%2C+2nd+Edition-p-9780471876847)
  by J. M. T. Thompson and H. B. Stewart.

* [Strange attractors, chaotic behavior, and information flow](https://www.degruyter.com/document/doi/10.1515/zna-1981-0115/html)
  by R. Shaw.
