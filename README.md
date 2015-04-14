# Slidify-rautu

Utilização básica do [Slidify](http://www.slidify.org).

O Slidify é um pacote do [R](http://r-project.org), desenvolvido por
[Ramnath Vaidyanathan](https://github.com/ramnathv). Ele possibilita
escrever em [R Markdown](http://rmarkdown.rstudio.com),
misturando a facilidade de escrita da linguagem
[Markdown](http://daringfireball.net/projects/markdown) com códigos do R
através do [Knitr](http://yihui.name/knitr).

A vantagem é que o Slidify faz todo o trabalho destes dois pacotes e
renderiza o resultado em um documento HTML5, possibilitando fazer slides
dinâmicos rapidamente.

O processo básico consiste em:

1. Editar o conteúdo em um arquivo `Rmd` (R Markdown)
2. Processar o contaúdo com o Slidify
3. Visualizar o resultado no navegador
4. Publicar o resultado em HTML em algum servidor (opcional, apenas se
   quiser compartilhar a apresentação)

O padrão do Slidify é hospedar a apresentação no
[GitHub](http://github.com), mas isso também pode ser feito através do
[Dropbox](http://www.dropbox.com) ou do
[RPubs](http://www.rpubs.com). Abaixo estão as instruções detalhadas.

## Instalação

O Slidify não é um pacote do CRAN, por isso precisa ser instalado
diretamente da sua página de desenvolvimento no
[GitHub](https://github.com/ramnathv/slidify). A maneira mais fácil é
utilizar a função `install_github()` do pacote `devtools`. (O `devtools`
está no CRAN, e pode ser instaldo normalmente com
`install.packages()`). 

Além do pacote `slidify`, também é necessário instalar o
`slidifyLibraries` que contém diversos arquivos de configuração
utilizados pelo Slidify.

```r
library(devtools)
install_github("ramnathv/slidify")
install_github("ramnathv/slidifyLibraries")
```

## Utilização

### Criando um repositório no GitHub

A primeira coisa a fazer é criar um repositório no GitHub. Para isso
siga as instruções da
[página de ajuda do GitHub](https://help.github.com/articles/create-a-repo)
ou veja o [git-rautu](https://github.com/fernandomayer/git-rautu).

Por exemplo, aqui criei um diretório chamado `slidify-rautu`.

### Iniciando a editoração com Slidify

Abra uma sessão do R e use a função
`author("<diretorio>")` do Slidify para que ele gere todos os arquivos
necessários. Por exemplo,

```r
library(slidify)
author("slidify-rautu")
```
vai criar um novo diretório `slidify-rautu` com os arquivos
utilizados pelo Slidify. Ele criará automaticamente dentro deste
diretório um *branch* chamado `gh-pages`, que é o 
nome padrão para que o GitHub entenda que o conteúdo de um *branch* com
esse nome deve ser interpretado como uma página da web. Além disso, este
comando irá adicionar e *comitar* automaticamente todos estes arquivos
iniciais. Ainda, o arquivo `index.Rmd` deverá abrir em seu editor de
texto para que você possa iniciar a edição. (Caso não abra sozinho, ou
abra em um editor que você não queira utilizar, abra este arquivo da
forma que preferir).

Até esse momento, o **repositório** `slidify-rautu` criado no GitHub e o
**diretório** `slidify-rautu` criado localmente no seu computador ainda
não possuem ligação. Para usar o repositório do GitHub como servidor
para publicação, é necessário adicionar o repositório como um servidor
remoto (*remote*) vinculado ao seu diretório (normalmente denominado
*origin*). Para fazer isso no git:

```shell
git remote add origin git@github.com:fernandomayer/slidify-rautu.git
```

Para finalmente enviar seus arquivos locais para o servidor do GitHub, é
necessário dar um *push* no *branch* `gh-pages` (depois de adicionar e
comitar os arquivos criados)

```shell
git add .
git commit -m 'primeira versao'
git push origin gh-pages
```

Edite o conteúdo no arquivo `index.Rmd`. Veja como exemplo o arquivo
[index.Rmd](index.Rmd) deste repositório. 

### Processando o arquivo com Slidify

Após adicionar o conteúdo desejado, é hora de processar o arquivo
`index.Rmd` pelo Slidify no R:

```r
slidify("index.Rmd")
```

Esta função vai gerar os arquivos `index.md` (a conversão de R Markdown
para Markdown puro) e `index.html`. Este último arquivo está pronto para
a visualização em um navegador. Como é um arquivo estático, você pode
abri-lo diretamente no navegador para ver o resultado.

À medida que for editando o arquivo `index.Rmd` e usando a função
`slidify()`, você pode ir atualizando a página do arquivo `index.html`
para acompanhar o resultado final do seu trabalho.

### Publicando pelo GitHub

Note que até agora as modificações que foram feitas são apenas locais,
ou seja, nada foi publicado para o mundo.

Para publicar no GitHub utilizamos a função `publish_github()` com os
seguintes argumentos:
* `repo`: o nome do repositório aonde será publicado. Por exemplo, aqui
  o repositório é o `slidify-rautu`
* `username`: seu nome de usuário no GitHub

Resumindo, a chamada dessa função será, neste caso,

```r
publish_github(repo = "slidify-rautu", username = "fernandomayer")
```

Toda vez que essa função for chamada, os arquivos serão automaticamente
adicionados e *comitados* para o *branch* `gh-pages` do repositório do
GitHub, não sendo necessária mais nenhuma ação por parte do usuário.

O resultado estará então disponível no endereço
`http://<username>.github.io/<repo>`. Por exemplo, neste caso, os slides
deste repositório estão em
[http://fernandomayer.github.io/slidify-rautu](http://fernandomayer.github.io/slidify-rautu).

Note que não é necessário usar a função `publish()` a cada modificação
do arquivo `index.Rmd`. Você pode verificar as modificações localmente
no seu navegador enquanto edita este arquivo, e fazer a publicação uma
única vez apenas no final quando estiver tudo pronto.

Com o Slidify também é possível publicar no [Dropbox](http://www.dropbox.com) e
no [RPubs](http://rpubs.com) - veja `?publish` para isso.

## Resumo

Um *workflow* típico da utilização do Slidify consiste nos seguintes
passos (após já ter configurado um repositório `repo` no GitHub):

```r
library(slidify) # para carregar o pacote
author("diretorio") # apenas da PRIMEIRA VEZ
##----------------------------------------------------------------------
## NO TERMINAL (APENAS DA PRIMEIRA VEZ)
## Configura o repositório git
# git remote add origin git@github.com:<username>/<repo>.git
# git add .
# git commit -m 'primeira versao'
# git push origin gh-pages
##----------------------------------------------------------------------
## Editar o arquivo index.Rmd
slidify("index.Rmd")
## Abra o arquivo resultante, index.html no navegador para ver o
## resultado
## Edite novamente o arquivo index.Rmd
slidify("index.Rmd")
## E assim sucessivamente...
## Quando estiver pronto pra publicação, faça
publish_github(repo = "repo", username = "username")
```

## Mais informações

Você pode testar o Slidify direto no seu navegador, através deste
[playground](http://slidify.github.io/playground/index.html). Edite o
código à esquerda e veja o resultado na hora, à direita.

Com o Slidify você pode adicionar um
[quiz](http://slidify.github.io/iquiz) nos seus slides, ou até mesmo
gráficos dinâmicos com o [rCharts](http://rcharts.io)! Veja mais sobre
adicionar interatividade no link
[http://slidify.github.io/dcmeetup/demos/interactive](http://slidify.github.io/dcmeetup/demos/interactive) 


## Licença

<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.pt_BR"><img alt="Licença Creative Commons" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a><br />Esta obra foi licenciada sob uma Licença <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.pt_BR">Creative Commons Atribuição-CompartilhaIgual 3.0 Não Adaptada</a>.
