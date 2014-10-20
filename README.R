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

## Depois de criar um repositório no GitHub e iniciar localmente
library(slidify)


