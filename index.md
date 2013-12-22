---
title       : Slidify rautu
subtitle    : Utilização básica do Slidify
author      : Fernando Mayer
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---

## Instruções

### Slides disponíveis em [http://fernandomayer.github.io/slidify-rautu]()

### Feito com [Slidify](http://slidify.org)

### Melhor visualizado com [Chromium](http://www.chromium.org) (ou [Google Chrome](https://www.google.com/chrome))

### Código-fonte disponível no [GitHub](https://github.com/fernandomayer/slidify-rautu)

### Pressione "o" para visualizar miniaturas

### Use as setas direita/esquerda para navegar

---

## Básico

Dois `#` definem um título, e três um subtítulo (veja este arquivo fonte)

Os slides são separados por `---`

Pular uma linha define um novo parágrafo

Todas as marcações do
[Markdown](http://daringfireball.net/projects/markdown/syntax) são
válidas

---

## Equações matemáticas

O Slidify usa o [MathJax](http://www.mathjax.org) para renderizar
equações escritas em LaTeX

A distribuição normal é definida por

$$
f(x;\mu,\sigma^2) = \frac{1}{\sigma\sqrt{2\pi}} 
e^{ -\frac{1}{2}\left(\frac{x-\mu}{\sigma}\right)^2 }
$$

---

## Códigos do R

Códigos podem ser inseridos de maneira similar ao Knitr, mudando apenas
a forma como os códigos são declarados. Aqui são utilizados os *fenced
blocks* ao invés dos *chunks* para gerar os resultados no R.

Por exemplo, o bloco

    ```{r}
    (x <- rnorm(10, 100, 15))
    ```

vai gerar o seguinte resultado


```r
(x <- rnorm(10, 100, 15))
```

```
##  [1] 103.10  83.50 119.82 119.18  70.79  94.94  83.49  91.98  97.08 102.07
```


---

## Gráficos

Os gráficos gerados pelo R são automaticamente incluidos, por exemplo


```r
hist(x, main = "", ylab = "Frequência")
```

![plot of chunk grafico](assets/fig/grafico.png) 


---

## Slidify e Knitr

Todas as opções de chunks do Knitr também são válidas para o
Slidify. Por exemplo, no gráfico anterior foi utilizado

    ```{r grafico, fig.width=8, fig.height=6}
    hist(x, main = "", ylab = "Frequência")
    ```

Veja as opções em [http://yihui.name/knitr/options](http://yihui.name/knitr/options)

---

## Figuras

Figuras podem ser inseridas a partir de links ou diretórios locais

Carl Friedrich Gauß

!['Gauss'](http://goo.gl/ZwTTXv)

---

## Tabelas

Tabelas podem ser escritas dessa forma
```
    Caracter | Permissão
    ---------|----------
    `r`      | Permissão de leitura (*read*)
    `w`      | Permissão de escrita (*write*)
    `x`      | Permissão de execução (*execute*)
    `-`      | Permissão desabilitada
```

Para gerar o seguinte resultado

Caracter | Permissão
---------|----------
`r`      | Permissão de leitura (*read*)
`w`      | Permissão de escrita (*write*)
`x`      | Permissão de execução (*execute*)
`-`      | Permissão desabilitada

