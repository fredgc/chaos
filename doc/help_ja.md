---
title: Chaos ヘルプ
---

## カオス（Chaos）

力学系とは、複数の空間次元を持つ常微分方程式のことです。ここに示す例はすべて2次元空間における1階微分方程式であり、点の位置がその速度を一意に決定します。

```
x'(t) = fx(x(t), y(t), t)
y'(t) = fy(x(t), y(t), t)
```

この場は水の流れに例えることができます。水面に微粒子（埃）を落とし、それがどこへ流れていくかを観察します。ただし、水は非圧縮性ですがこれらの流れ場は圧縮性を
持つため、完全な類似ではありません。

最初のいくつかの例は非常にシンプルです。最後の例は興味深いカオス的挙動を示します。ページ下部におすすめの参考文献を掲載しています。

本プログラムで描画される各サンプル場については[ベクトル場](fields.html)をご覧ください。プログラムの使い方については[操作方法
](controls.html)をご覧ください。

### 参考文献

より詳しい学習には以下をおすすめします：

* [Nonlinear Dynamics and Chaos](https://www.wiley.com/en-us/Nonlinear+Dynamics+and+Chaos%2C+2nd+Edition-p-9780471876847)
  J. M. T. Thompson, H. B. Stewart著

* [Strange attractors, chaotic behavior, and information flow](https://www.degruyter.com/document/doi/10.1515/zna-1981-0115/html)
  R. Shaw著
