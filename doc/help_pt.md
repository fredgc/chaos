---
title: Ajuda de Caos
---

## Caos

Um sistema dinâmicoéuma equação diferencial ordinária com múltiplas dimensões
espaciais. Todos estes exemplos são equações de primeira ordem em duas
dimensões espaciais, o que significa que a posição de um ponto determina
completamente a sua velocidade.

$$
\begin{aligned}
x'(t) &= f_x(x(t), y(t), t) \\
y'(t) &= f_y(x(t), y(t), t)
\end{aligned}
$$

Podemos imaginar o campo como uma corrente deágua. Lançamos algumas partículas
de poeira naágua e observamos para onde fluem. A analogia nãoéperfeita porque
aáguaéquase incompressível, enquanto estes fluxos são compressíveis.

Os primeiros exemplos são bastante simples. O último apresenta comportamentos
caóticos notáveis. Ao final da página recomendamos algumas leituras.

### Isóclinas

Ative a caixa "Iso" para exibir as isóclinas (também chamadas de nulclinas).
São as curvas onde uma componente da velocidade é zero:

* Na isóclina em $x$ ($x' = 0$), o movimento horizontal cessa e o fluxo é
  puramente vertical. Ao cruzar essa curva, o fluxo muda entre mover-se para a
  esquerda e para a direita.

* Na isóclina em $y$ ($y' = 0$), o movimento vertical cessa e o fluxo é
  puramente horizontal. Ao cruzar essa curva, o fluxo muda entre mover-se para
  cima e para baixo.

As isóclinas ajudam a compreender o fluxo porque dividem o plano em regiões
onde o movimento segue uma direção consistente (cima-esquerda, cima-direita,
baixo-esquerda ou baixo-direita). Onde uma isóclina em $x$ e uma isóclina em
$y$ se cruzam, ambas $x' = 0$ e $y' = 0$, indicando um **ponto estacionário**
(de equilíbrio) no qual uma partícula permanece parada.

Consulte [Campos](fields.html) para os campos de exemplo desenhados pelo
programa. Consulte [Controles](controls.html) para aprender a usar o programa.

### Referências

Para aprofundamento, recomendamos:

* [Nonlinear Dynamics and Chaos](https://www.wiley.com/en-us/Nonlinear+Dynamics+and+Chaos%2C+2nd+Edition-p-9780471876847)
  de J. M. T. Thompson e H. B. Stewart.

* [Strange attractors, chaotic behavior, and information flow](https://www.degruyter.com/document/doi/10.1515/zna-1981-0115/html)
  de R. Shaw.
