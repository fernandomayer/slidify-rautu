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
2. Processar o conteúdo com o Slidify
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

## Utilização

### Iniciando a editoração com Slidify

Abra uma sessão do R e use a função
`author("<diretorio>")` do Slidify para que ele gere todos os arquivos
necessários (o esqueleto da apresentação). Por exemplo,

```r
library(slidify)
author("slidify-rautu", use_git = FALSE, open_rmd = FALSE)
```
vai criar um novo diretório `slidify-rautu` com os arquivos
utilizados pelo Slidify. O argumento `use_git = FALSE` é utilizado para
que ele não crie um repositório do git (que é o padrão), e o argumento
`open_rmd = FALSE` é para que o arquivo `index.Rmd` criado não seja
aberto automaticamente pelo seu editor padrão.

O comando acima também irá mudar automaticamente seu diretório de
trabalho para o diretório recém criado `slidify-rautu`. Dentro desse
diretório está o principal (e possivelmente único) arquivo que você
precisará editar o `index.Rmd`.

Abra o arquivo `index.Rmd` e edite seu conteúdo. Veja como exemplo o
arquivo [index.Rmd](index.Rmd) deste repositório.

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
`slidify("index.Rmd")`, você pode ir atualizando a página do arquivo
`index.html` para acompanhar o resultado final do seu trabalho.

Isso é basicamente o que se precisa saber para instalar, iniciar e gerar
uma apresentação com Slidify. Os detalhes de *como* modificar opções e
adicionar diversos recursos podem ser conferidos, por exemplo no arquivo
[index.Rmd](index.Rmd) deste repositório, e o resultado final está
disponível em <http://fernandomayer.github.io/slidify-rautu>.

## Publicando a apresentação online

Uma parte fundamental do conceito de produzir slides em HTML é o fato de
poder compartilhar apenas um link para a apresentação e ela aparecer
diretamente no navegador sem a necessidade de baixar arquivos e abri-los
em programas externos.

As apresentações geradas pelo Slidify podem ser compartilhadas por três
mecanismos difsrentes:

1. Através do [Dropbox](www.dropbox.com)
2. Através do [RPubs](www.rpubs.com)
3. Através do [GitHub](github.com)

Em todos os casos, usaremos a função `publish()` com algumas
modificações. Veja `?publish` para mais informações.

### Publicando pelo Dropbox

A apresentação gerada pelo Slidify pode ser publicada através do
diretório `Public` do seu Dropbox. Para isso basta espscificar um nome
de diretório que será criado dentro de `~/Dropbox/Public`. Esse nome
pode ser o mesmo que você já está utilizando para esse projeto, ou outro
qualquer. Aqui, por exemplo, manti o mesmo nome `slidify-rautu`.

Portanto, passamos para a função `publish()` o nome do diretório e o
argumento `host = "dropbox"`

```r
publish("slidify-rautu", host = "dropbox")
```
que irá criar dentro do seu Dropbox o diretório
`~/Dropbox/Public/slidify-rautu` com os arquivos necessários para gerar
a apresentação.

Depois disso, basta entrar na sua conta no [Dropbox](www.dropbox.com) e
copiar o link público **apenas** do arquivo `index.html`. Esse link pode
ser compartilhado com qualquer pessoa para que a sua apresentação seja
aberta no navegador.

### Publicando pelo RPubs

O [RPubs](www.rpubs.org) é um serviço gratuito mantido pelo
[RStudio](www.rstudio.org), e serve basicamente para hospedar
apresentações e outros documentos gerados com R markdown para
HTML. Embora seja uma ferramenta embutida e construída especificamente
para o RStudio é possível publicar documentos do Slidify neste serviço.

```r
publish("slidify-rautu", html_file = "index.html", host = "rpubs")
```

Com esse comando, uma página irá abrir automaticamente no seu
navegador. Você precisa ter uma conta já cadastrada no RPubs ou preisará
se registrar antes de conseguir publicar a apresentação.


### Publicando pelo GitHub

O mecanismo *padrão* do Slidify para hospedar as apresentações é através
do GitHub. Para isso é necessário ter uma conta nesse serviço, e antes
de começar a usar o Slidify é interessante criar um repositório para a
apresentação no GitHub.

#### Criando um repositório no GitHub

A primeira coisa a fazer é criar um repositório no GitHub. Para isso
siga as instruções da
[página de ajuda do GitHub](https://help.github.com/articles/create-a-repo)
ou veja o [git-rautu](https://github.com/fernandomayer/git-rautu).

Por exemplo, aqui criei um diretório chamado `slidify-rautu-git`.

#### Usando o GitHub com Slidify

Para usar o GitHub com o Slidify, é necessário voltar no início, e usar
a funcão `author()` com o argumento padrão `use_git = TRUE`

```r
author("slidify-rautu-git", use_git = TRUE, open_rmd = FALSE)
```

Este comando criará automaticamente dentro deste
diretório um *branch* chamado `gh-pages`, que é o 
nome padrão para que o GitHub entenda que o conteúdo de um *branch* com
esse nome deve ser interpretado como uma página da web. Além disso, este
comando irá adicionar e *comitar* automaticamente todos estes arquivos
iniciais.

Até esse momento, o **repositório** `slidify-rautu` criado no GitHub e o
**diretório** `slidify-rautu` criado localmente no seu computador ainda
não possuem ligação. Para usar o repositório do GitHub como servidor
para publicação, é necessário adicionar o repositório como um servidor
remoto (*remote*) vinculado ao seu diretório (normalmente denominado
*origin*). Para fazer isso no git:

```shell
git remote add origin git@github.com:fernandomayer/slidify-rautu-git.git
```

Para finalmente enviar seus arquivos locais para o servidor do GitHub, é
necessário dar um *push* no *branch* `gh-pages` (depois de adicionar e
comitar os arquivos criados)

```shell
git add .
git commit -m 'primeira versao'
git push origin gh-pages
```

Edite o conteúdo do arquivo `index.Rmd`, conforme mencionado
anteriormente, e processe o arquivo com o Slidify

```r
slidify("index.Rmd")
```

Note que até agora as modificações que foram feitas são apenas locais,
ou seja, nada foi publicado para o mundo.

Para publicar no GitHub utilizamos a função `publish()` com os
seguintes argumentos:
* `repo`: o nome do repositório aonde será publicado. Por exemplo, aqui
  o repositório é o `slidify-rautu-git`
* `username`: seu nome de usuário no GitHub

Resumindo, a chamada dessa função será, neste caso,

```r
publish(repo = "slidify-rautu-git", username = "fernandomayer", host = "github")
```

Toda vez que essa função for chamada, os arquivos serão automaticamente
adicionados e *comitados* para o *branch* `gh-pages` do repositório do
GitHub, não sendo necessária mais nenhuma ação por parte do usuário.

O resultado estará então disponível no endereço
`http://<username>.github.io/<repo>`. Por exemplo, neste caso, os slides
deste repositório estão em
[http://fernandomayer.github.io/slidify-rautu-git](http://fernandomayer.github.io/slidify-rautu-git).

Note que não é necessário usar a função `publish()` a cada modificação
do arquivo `index.Rmd`. Você pode verificar as modificações localmente
no seu navegador enquanto edita este arquivo, e fazer a publicação uma
única vez apenas no final quando estiver tudo pronto.

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
