##======================================================================
## Script de instalação, configuração e uso inicial do Slidify
##======================================================================

##======================================================================
## Instalação
##----------------------------------------------------------------------
## Pacotes necessários
packs <- c("knitr", "devtools", "httr") # httr apenas para proxies
# instalação
install.packages(packs, dep = TRUE)
# carrega
library(devtools)
library(httr) # apenas para conexões com proxy

## O Slidify deve ser instalado direto do GitHub, usando o pacote
## devtools
## NOTA: se usar proxy é necessário configurar com o pacote httr
# set_config(use_proxy(url = "proxy.furg.br", port = 3128))
install_github("ramnathv/slidify")
install_github("ramnathv/slidifyLibraries")
##======================================================================

##======================================================================
## Configuração
##----------------------------------------------------------------------
library(slidify) # para carregar o pacote
## Apenas da PRIMEIRA VEZ
# se NÃO for usar o GitHub
author("diretorio", use_git = FALSE, open_rmd = FALSE)
# se FOR usar o GitHub
author("diretorio", use_git = TRUE, open_rmd = FALSE)
##======================================================================

##======================================================================
## Edição
##----------------------------------------------------------------------
## Abrir e editar o arquivo index.Rmd
slidify("index.Rmd")
## Abra o arquivo resultante, index.html no navegador para ver o
## resultado
## Edite novamente o arquivo index.Rmd
slidify("index.Rmd")
## E assim sucessivamente...
##======================================================================

##======================================================================
## Publicação
##----------------------------------------------------------------------
## Dropbox
publish("diretorio", host = "dropbox")
## Compartilhe o link público do arquivo:
## ~/Dropbox/Public/diretorio/index.html
##----------------------------------------------------------------------
## RPubs
publish("slidify-rautu", html_file = "index.html", host = "rpubs")
## Na página que irá abrir, entre com seu login ou cadastre uma conta
## para hospedar a apresentação
##----------------------------------------------------------------------
## GitHub
##......................................................................
## NO TERMINAL (APENAS DA PRIMEIRA VEZ)
## Configura o repositório git
# git remote add origin git@github.com:<username>/<repo>.git
# git add .
# git commit -m 'primeira versao'
# git push origin gh-pages
##......................................................................
publish(repo = "<repo>", username = "<username>", host = "github")
##======================================================================
