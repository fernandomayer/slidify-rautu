---
title       : Slidify rautu
subtitle    : Utilização básica do Slidify
author      : Fernando Mayer
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : solarized_light  # {tomorrow, solarized_light, ...}
license     : by-sa
widgets     : [mathjax, bootstrap, quiz]     # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft, selfcontained}
---

## Instruções

### Slides disponíveis em [http://fernandomayer.github.io/slidify-rautu]()

### Melhor visualizado com [Chromium](http://www.chromium.org) (ou [Google Chrome](https://www.google.com/chrome))

### Para ver o código-fonte destes slides e instruções de como utilizá-lo, acesse o [repositório slidify-rautu no GitHub](https://github.com/fernandomayer/slidify-rautu)

### Material baseado no [tutorial do Slidify](http://slidify.github.io/workshops/tutorials/01)

### Pressione "o" para visualizar miniaturas

### Use as setas direita/esquerda para navegar

--- .nobackground .quote

<q> O Slidify ajuda a criar, customizar e compartilhar documentos
HTML5 dinâmicos, interativos e elegantes usando R Markdown.</q>

---

## Instalando o Slidify

O Slidify não é um pacote do CRAN, por isso precisa ser instalado
diretamente da sua página de desenvolvimento no
[GitHub](https://github.com/ramnathv/slidify). A maneira mais fácil é
utilizar a função `install_github()` do pacote `devtools`. (O `devtools`
está no CRAN, e pode ser instaldo normalmente com
`install.packages()`), por exemplo


```r
install.packages("devtools", dependencies = TRUE)
```

Além do pacote `slidify`, também é necessário instalar o
`slidifyLibraries` que contém diversos arquivos de configuração
utilizados pelo Slidify.


```r
library(devtools)
install_github("ramnathv/slidify")
install_github("ramnathv/slidifyLibraries")
```

--- .nobackground .quote

<q> O Slidify ajuda a <font color="red"><b>criar</b></font>, customizar e compartilhar documentos
HTML5 dinâmicos, interativos e elegantes usando R Markdown.</q>

---

## Criando um documento com Slidify

A maneira mais fácil de começar é usando a função `author("<dir>")` para criar
um "esqueleto" da apresentação de slides. Essa função irá fazer por padrão

> - criar um diretório `"<dir>"` para a apresentação
> - gerar e copiar os arquivos necessários para o "esqueleto"
> - se você tiver o git instalado:
    - inicializar um repositório do git
    - mudar para o *branch* `gh-pages`
    - *comitar* as alterações para o repositório
> - abrir o arquivo `index.Rmd` para edição

---

## Criando um documento com Slidify

Por exemplo,


```r
library(slidify)
author("slidify-rautu", use_git = FALSE, open_rmd = FALSE)
```

vai criar um novo diretório `slidify-rautu` com os arquivos
utilizados pelo Slidify.

- O argumento `use_git = FALSE` é utilizado para
  que ele não crie um repositório do git (que é o padrão).

- O argumento `open_rmd = FALSE` é para que o arquivo `index.Rmd` criado
  não seja aberto automaticamente pelo seu editor padrão.

O comando acima também irá mudar automaticamente seu diretório de
trabalho para o diretório recém criado `slidify-rautu`. Dentro desse
diretório está o principal (e possivelmente único) arquivo que você
precisará editar o `index.Rmd`.

---

O arquivo `index.Rmd` básico

    ---
    title       : 
    subtitle    : 
    author      : 
    job         : 
    framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
    highlighter : highlight.js  # {highlight.js, prettify, highlight}
    hitheme     : tomorrow      # 
    widgets     : []            # {mathjax, quiz, bootstrap}
    mode        : selfcontained # {standalone, draft}
    ---
    
    ## Read-And-Delete
    
    1. Edit YAML front matter
    2. Write using R Markdown
    3. Use an empty line followed by three dashes to separate slides!

    --- .class #id 
    
    ## Slide 2

---

## Básico

Dois `#` definem um título, e três um subtítulo (veja este arquivo fonte)

Os slides são separados por `---`

Pular uma linha define um novo parágrafo

Todas as marcações do
[Markdown](http://daringfireball.net/projects/markdown/syntax) são
válidas

Marcações em HTML também são válidas

---

## Processando o arquivo com Slidify

Após adicionar o conteúdo desejado, é hora de processar o arquivo
`index.Rmd` pelo Slidify no R:


```r
slidify("index.Rmd")
```

Esta função vai gerar os arquivos `index.md` (a conversão de R Markdown
para Markdown puro) e `index.html`.

- Como é um arquivo estático, você pode abri-lo diretamente no navegador
  para ver o resultado.

À medida que for editando o arquivo `index.Rmd` e usando a função
`slidify("index.Rmd")`, você pode ir atualizando a página do arquivo
`index.html`

--- .segue bg:indigo

## Como o Slidify funciona?

---

<iframe src='assets/img/knit.svg' width=800px height=250px></iframe> 

---

<iframe src='assets/img/split_apply_combine.svg' width=800px height=250px></iframe> 

--- .nobackground .quote

<q> O Slidify ajuda a criar, <font color="red"><b>customizar</b></font>
e compartilhar documentos HTML5 dinâmicos, interativos e elegantes
usando R Markdown.</q>

---

## Customização

O Slidify é altamente modular e customizável.

Existem várias formas de customização:

1. Frameworks (tipos de slides)
2. Layouts (CSS, ...)
3. Widgets (MathJax, quiz, ...)

Mais detalhes sobre customização podem ser encontrados em
[http://slidify.org/customize.html]()

---

### Um detalhe: equações matemáticas com MathJax

O Slidify usa o [MathJax](http://www.mathjax.org) para renderizar
equações escritas em LaTeX

A distribuição normal é definida por

$$
f(x;\mu,\sigma^2) = \frac{1}{\sigma\sqrt{2\pi}} 
e^{ -\frac{1}{2}\left(\frac{x-\mu}{\sigma}\right)^2 }
$$

foi escrito como

	$$
	f(x;\mu,\sigma^2) = \frac{1}{\sigma\sqrt{2\pi}} 
	e^{ -\frac{1}{2}\left(\frac{x-\mu}{\sigma}\right)^2 }
	$$

---

## Figuras

Figuras podem ser inseridas a partir de links ou diretórios locais

O logo do R

!['R logo'](http://developer.r-project.org/Logo/Rlogo-3.png)

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


--- .nobackground .quote

<q> O Slidify ajuda a criar, customizar
e <font color="red"><b>compartilhar</b></font> documentos HTML5
dinâmicos, interativos e elegantes usando R Markdown.</q>

---

## Publicando a apresentação online

Uma parte fundamental do conceito de produzir slides em HTML é o fato de
poder compartilhar apenas um link para a apresentação e ela aparecer
diretamente no navegador sem a necessidade de baixar arquivos e abri-los
em programas externos.

As apresentações geradas pelo Slidify podem ser compartilhadas por três
mecanismos diferentes:

1. [Dropbox](www.dropbox.com)
2. [RPubs](www.rpubs.com)
3. [GitHub](github.com)

Em todos os casos, usaremos a função `publish()` com algumas
modificações. Veja `?publish` para mais informações.

---

### Publicando pelo Dropbox

A apresentação gerada pelo Slidify pode ser publicada através do
diretório `Public` do seu Dropbox.

Para isso basta especificar um nome de diretório que será criado dentro
de `~/Dropbox/Public`. Aqui, por exemplo, manti o mesmo nome
`slidify-rautu`.

Passamos para a função `publish()` o nome do diretório e o
argumento `host = "dropbox"`


```r
publish("slidify-rautu", host = "dropbox")
```
que irá criar dentro do seu Dropbox o diretório
`~/Dropbox/Public/slidify-rautu` com os arquivos necessários para gerar
a apresentação.

Depois disso, basta entrar na sua conta no [Dropbox](www.dropbox.com) e
copiar o link público **apenas** do arquivo `index.html`.

---

### Publicando pelo RPubs

O [RPubs](www.rpubs.org) é um serviço gratuito mantido pelo
[RStudio](www.rstudio.org), e serve basicamente para hospedar
apresentações e outros documentos gerados com R markdown para
HTML.

Embora seja uma ferramenta embutida e construída especificamente
para o RStudio é possível publicar documentos do Slidify neste serviço.


```r
publish("slidify-rautu", html_file = "index.html", host = "rpubs")
```

Com esse comando, uma página irá abrir automaticamente no seu
navegador. Você precisa ter uma conta já cadastrada no RPubs ou preisará
se registrar antes de conseguir publicar a apresentação.

> NOTA: no RStudio esse processo é mais automático

---

### Publicando pelo GitHub

O mecanismo **padrão** do Slidify para hospedar as apresentações é através
do GitHub. Para isso é necessário ter uma conta nesse serviço, e antes
de começar a usar o Slidify é interessante criar um repositório para a
apresentação no GitHub.

Siga as instruções da
[página de ajuda do GitHub](https://help.github.com/articles/create-a-repo)
ou veja o [git-rautu](https://github.com/fernandomayer/git-rautu).

Para usar o GitHub com o Slidify, é necessário voltar no início, e usar
a funcão `author()` com o argumento padrão `use_git = TRUE`


```r
author("slidify-rautu-git", use_git = TRUE, open_rmd = FALSE)
```

Para mais detalhes de como configurar o GitHub para hospedar
apresentações do Slidify veja a
[seção específica do README](https://github.com/fernandomayer/slidify-rautu#publicando-pelo-github)
do [slidify-rautu](https://github.com/fernandomayer/slidify-rautu).

--- .nobackground .quote

<q> O Slidify ajuda a criar, customizar
e compartilhar documentos HTML5 <font color="red"><b>dinâmicos</b></font>, interativos e elegantes usando R
Markdown.</q>

---

## Códigos do R

Conteúdo dinâmico implica que gráficos, tabelas e outros resultados
podem ser gerados dinamicamente usando códigos do R, usando o pacote
`knitr`.

<img class='center' src='http://ecx.images-amazon.com/images/I/41kI1dxXGfL.jpg' height=450px width=300px/>

---

## Códigos do R

Códigos podem ser inseridos de maneira similar ao knitr para $\LaTeX$,
mudando apenas a forma como os códigos são declarados. Aqui são
utilizados os *fenced blocks* ao invés dos *chunks* para gerar os
resultados no R.

Por exemplo, o bloco

    ```{r}
    (x <- rnorm(10, 100, 15))
    ```

vai gerar o seguinte resultado


```r
(x <- rnorm(10, 100, 15))
```

```
##  [1] 104.83477 106.95095  99.55128 109.66645 109.75745 111.36069 104.23999
##  [8] 121.64682 120.47687  97.17345
```

---

## Gráficos

Os gráficos gerados pelo R são automaticamente incluidos, por exemplo


```r
hist(x, main = "", ylab = "Frequência")
```

![plot of chunk grafico](assets/fig/grafico-1.png) 

---

## Slidify e Knitr

Todas as opções de chunks do Knitr também são válidas para o
Slidify. Por exemplo, no gráfico anterior foi utilizado

    ```{r grafico, fig.width=8, fig.height=6}
    hist(x, main = "", ylab = "Frequência")
    ```

Veja as opções em [http://yihui.name/knitr/options](http://yihui.name/knitr/options)

---

## MotionPlot com googleVis


```r
library(googleVis)
M1 <- gvisMotionChart(Fruits, idvar = "Fruit", timevar = "Year")
print(M1, tag = 'chart')
```

---

## MotionPlot com googleVis

<!-- MotionChart generated in R 3.1.3 by googleVis 0.5.8 package -->
<!-- Wed Apr 15 16:33:57 2015 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataMotionChartID9555cec5fee () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "Apples",
2008,
"West",
98,
78,
20,
"2008-12-31" 
],
[
 "Apples",
2009,
"West",
111,
79,
32,
"2009-12-31" 
],
[
 "Apples",
2010,
"West",
89,
76,
13,
"2010-12-31" 
],
[
 "Oranges",
2008,
"East",
96,
81,
15,
"2008-12-31" 
],
[
 "Bananas",
2008,
"East",
85,
76,
9,
"2008-12-31" 
],
[
 "Oranges",
2009,
"East",
93,
80,
13,
"2009-12-31" 
],
[
 "Bananas",
2009,
"East",
94,
78,
16,
"2009-12-31" 
],
[
 "Oranges",
2010,
"East",
98,
91,
7,
"2010-12-31" 
],
[
 "Bananas",
2010,
"East",
81,
71,
10,
"2010-12-31" 
] 
];
data.addColumn('string','Fruit');
data.addColumn('number','Year');
data.addColumn('string','Location');
data.addColumn('number','Sales');
data.addColumn('number','Expenses');
data.addColumn('number','Profit');
data.addColumn('string','Date');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartMotionChartID9555cec5fee() {
var data = gvisDataMotionChartID9555cec5fee();
var options = {};
options["width"] =    600;
options["height"] =    500;
options["state"] = "";

    var chart = new google.visualization.MotionChart(
    document.getElementById('MotionChartID9555cec5fee')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "motionchart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartMotionChartID9555cec5fee);
})();
function displayChartMotionChartID9555cec5fee() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartMotionChartID9555cec5fee"></script>
 
<!-- divChart -->
  
<div id="MotionChartID9555cec5fee" 
  style="width: 600; height: 500;">
</div>

--- .nobackground .quote

<q> O Slidify ajuda a criar, customizar
e compartilhar documentos HTML5 dinâmicos, <font
color="red"><b>interativos</b></font> e elegantes usando R 
Markdown.</q>

---

## Interativo

O Slidify usa um "widget" para adicionar interatividade aos slides

No YAML:

    ---
    widgets: [bootstrap, quiz]
	---

--- 

    --- &radio
    
    ## Question 1
    
    What is 1 + 1?
    
    1. 1 
    2. _2_
    3. 3
    
    *** .hint
    
    This is a hint
    
    *** .explanation
    
    This is an explanation

	---


--- &radio

## Question 1

What is 1 + 1?

1. 1 
2. _2_
3. 3


*** .hint

This is a hint

*** .explanation

This is an explanation


---

## Gráficos interativos com rCharts


```r
library(rCharts)
haireye = as.data.frame(HairEyeColor)
n1 <- nPlot(Freq ~ Hair, 
  group = 'Eye',
  data = subset(haireye, Sex == 'Male'),
  type = 'multiBarChart'
)
n1$print('chart1')
```

---

## Gráficos interativos com rCharts


<div id = 'chart1' class = 'rChart nvd3'></div>
<script type='text/javascript'>
 $(document).ready(function(){
      drawchart1()
    });
    function drawchart1(){  
      var opts = {
 "dom": "chart1",
"width":    800,
"height":    400,
"x": "Hair",
"y": "Freq",
"group": "Eye",
"type": "multiBarChart",
"id": "chart1" 
},
        data = [
 {
 "Hair": "Black",
"Eye": "Brown",
"Sex": "Male",
"Freq":             32 
},
{
 "Hair": "Brown",
"Eye": "Brown",
"Sex": "Male",
"Freq":             53 
},
{
 "Hair": "Red",
"Eye": "Brown",
"Sex": "Male",
"Freq":             10 
},
{
 "Hair": "Blond",
"Eye": "Brown",
"Sex": "Male",
"Freq":              3 
},
{
 "Hair": "Black",
"Eye": "Blue",
"Sex": "Male",
"Freq":             11 
},
{
 "Hair": "Brown",
"Eye": "Blue",
"Sex": "Male",
"Freq":             50 
},
{
 "Hair": "Red",
"Eye": "Blue",
"Sex": "Male",
"Freq":             10 
},
{
 "Hair": "Blond",
"Eye": "Blue",
"Sex": "Male",
"Freq":             30 
},
{
 "Hair": "Black",
"Eye": "Hazel",
"Sex": "Male",
"Freq":             10 
},
{
 "Hair": "Brown",
"Eye": "Hazel",
"Sex": "Male",
"Freq":             25 
},
{
 "Hair": "Red",
"Eye": "Hazel",
"Sex": "Male",
"Freq":              7 
},
{
 "Hair": "Blond",
"Eye": "Hazel",
"Sex": "Male",
"Freq":              5 
},
{
 "Hair": "Black",
"Eye": "Green",
"Sex": "Male",
"Freq":              3 
},
{
 "Hair": "Brown",
"Eye": "Green",
"Sex": "Male",
"Freq":             15 
},
{
 "Hair": "Red",
"Eye": "Green",
"Sex": "Male",
"Freq":              7 
},
{
 "Hair": "Blond",
"Eye": "Green",
"Sex": "Male",
"Freq":              8 
} 
]
  
      if(!(opts.type==="pieChart" || opts.type==="sparklinePlus" || opts.type==="bulletChart")) {
        var data = d3.nest()
          .key(function(d){
            //return opts.group === undefined ? 'main' : d[opts.group]
            //instead of main would think a better default is opts.x
            return opts.group === undefined ? opts.y : d[opts.group];
          })
          .entries(data);
      }
      
      if (opts.disabled != undefined){
        data.map(function(d, i){
          d.disabled = opts.disabled[i]
        })
      }
      
      nv.addGraph(function() {
        var chart = nv.models[opts.type]()
          .width(opts.width)
          .height(opts.height)
          
        if (opts.type != "bulletChart"){
          chart
            .x(function(d) { return d[opts.x] })
            .y(function(d) { return d[opts.y] })
        }
          
         
        
          
        

        
        
        
      
       d3.select("#" + opts.id)
        .append('svg')
        .datum(data)
        .transition().duration(500)
        .call(chart);

       nv.utils.windowResize(chart.update);
       return chart;
      });
    };
</script>

---




