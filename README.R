##======================================================================
## Script de instalação, configuração e uso inicial do slidify
##======================================================================

##======================================================================
## Instalação
##======================================================================

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
## Configuração inicial
##======================================================================

## Criar um repositorio no GitHub (ex: slidify-rautu) e configurar

## Criar um diretório local com o "esqueleto" do slidify
library(slidify)
author("slidify-rautu")

##----------------------------------------------------------------------
## NO TERMINAL (APENAS DA PRIMEIRA VEZ)
## Configura o repositório git
# git remote add origin git@github.com:fernandomayer/slidify-rautu.git
# git add .
# git commit -m 'primeira versao'
# git push origin gh-pages
##----------------------------------------------------------------------

##======================================================================
## Processando arquivos com slidify
##======================================================================

## Abra o arquivo index.Rmd e edite o conteúdo em Rmarkdown
## Para processar o arquivo
slidify("index.Rmd")

## Abra o arquivo resultante index.html no navegador e atualize conforme
## as modificações forem realizadas. Sempre que houver modificações,
## rode o comando acima

##======================================================================
## Publicando a apresentação com slidify
##======================================================================

## Para publicar no servidor do GitHub faça
publish_github(repo = "slidify-rautu", username = "fernandomayer")
