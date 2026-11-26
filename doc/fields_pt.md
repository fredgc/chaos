---
title: Campos de Demonstração de Caos
---

## Campos demonstrados

Aqui está a lista dos campos vetoriais demonstrados. Recomendamos analisá-los
na ordem apresentada.

### Rotação simples

Trata-se de uma rotação simples no sentido horário.

$$
\begin{aligned}
x' &= y + p \operatorname{saw}(x) \\
y' &= -x + p \operatorname{saw}(y)
\end{aligned}
$$

Em notação vetorial:

$$
\mathbf{v}' = \begin{bmatrix} 0 & 1 \\ -1 & 0 \end{bmatrix} \mathbf{v}
  + \text{perturbação}, \qquad
\mathbf{v} = \begin{bmatrix} x \\ y \end{bmatrix}
$$

A perturbação é uma onda dente de serra dependente do parâmetro. Adicione
algumas partículas e clique em „reproduzir“. Você as verá fluindo em círculos
no sentido horário.

Aumente o valor do parâmetro e as partículas se desviarão ligeiramente das
suas trajetórias originais.

Ative a opção „Campo“ para exibir o campo vetorial. Como o campo vetorial é
limitado, a trajetória de cada partícula é suave e inteiramente determinada
por seu ponto inicial. Portanto, as partículas nunca se cruzam.

Ative „Iso“ para exibir as isóclinas. Estas são as curvas onde a componente
$x$ ou $y$ do campo vetorial é nula. Se $x' = 0$, o campo é vertical. Se
$y' = 0$, o campo é horizontal. Se ambas forem 0, a partícula permanece imóvel:
trata-se de um ponto de equilíbrio (estacionário) do sistema dinâmico.

### Espiral – ponto estável versus instável

Modificamos o exemplo anterior introduzindo uma dependência linear de $x'$ em
relação a $x$ e de $y'$ em relação a $y$:

$$
\begin{aligned}
x' &= px + y \\
y' &= -x + py
\end{aligned}
$$

Inicialmente, $p = 0$, o que coincide com a rotação acima. Há um ponto
estacionário na origem $(0, 0)$.

Mova o parâmetro para a esquerda ($p < 0$): as partículas espiralam em direção
ao ponto estacionário. Trata-se de um ponto estacionário estável.

Mova o parâmetro para a direita ($p > 0$): as partículas espiralam para longe
do ponto estacionário. Trata-se de um ponto estacionário instável.

Observe as regiões separadas pelas isóclinas. Em cada região, as partículas
tendem a se mover para um quadrante específico.

### Mistura (Stir)

Este exemplo possui múltiplos pontos estacionários—alguns estáveis e outros
instáveis. Partículas próximas a um ponto instável se afastam dele e convergem
para os pontos estáveis.

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

Ao alterar o parâmetro, os pontos estacionários se deslocam, conduzindo as
partículas a um padrão caótico.

Como as equações são suaves, partículas que começam próximas permanecem
próximas no curto prazo. Com o tempo, contudo, elas acabam divergindo.

Isso exemplifica um aparente paradoxo do cálculo: para um $t$ fixo, a posição
$(x(t), y(t))$ varia continuamente em relação a $(x(0), y(0))$. Se deixarmos
$t$ crescer indefinidamente, essa continuidade perde relevância prática.

Este exemplo possui um atrator móvel no tempo: eventualmente todas as
partículas terminam orbitando estreitamente em torno de um dos quatro pontos
do atrator.

### Sistema caótico com atrator estranho

Este exemplo foi extraído da obra citada nas referências.

$$
\begin{aligned}
x'(t) &= 0.7y + 10x(0.1 - y^2) \\
y'(t) &= -x + 0.25 \sin(1.57t)
\end{aligned}
$$

Embora caótico, este sistema possui um atrator. O atrator não é uma curva
simples: com o avanço do tempo, ele se divide e se dobra sobre si mesmo. As
partículas se dispersam e tornam a se reunir em uma ordem diferente.

Adicione uma grade de partículas e observe como as cores semelhantes
permanecem próximas inicialmente e depois se misturam intimamente—lembrando o
sovar de um pão ou o forjar de aço.

### Referências

Para aprofundamento, recomendamos:

* [Nonlinear Dynamics and Chaos](https://www.wiley.com/en-us/Nonlinear+Dynamics+and+Chaos%2C+2nd+Edition-p-9780471876847)
  de J. M. T. Thompson e H. B. Stewart.

* [Strange attractors, chaotic behavior, and information flow](https://www.degruyter.com/document/doi/10.1515/zna-1981-0115/html)
  de R. Shaw.
