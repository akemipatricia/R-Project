#----------------------------------------------------------------------
#-----------------------------------TRANSFORMAÇÃO 2012
#----------------------------------------------------------------------

# Definir os pacotes

pacotes_necessarios <- c('dplyr','data.table')

# Carregar

for(i in 1:length(pacotes_necessarios)){
  if(pacotes_necessarios[i] %in% installed.packages()){
    eval(parse(text=paste0("library(",pacotes_necessarios[i],")")))
    cat('Pacote carregado: ',pacotes_necessarios[i],'\n')
  } else {
    eval(parse(text=paste0("install.packages('",pacotes_necessarios[i],"')")))
    cat('Pacote instalado: ',pacotes_necessarios[i],'\n')
    eval(parse(text=paste0("library(",pacotes_necessarios[i],")")))
    cat('Pacote carregado: ',pacotes_necessarios[i],'\n')
  }
}

#----------------------------------------------------------------------
#-----------------------------------SET DIR
#----------------------------------------------------------------------

dir <- choose.dir()
setwd(dir)
ano <- '2012'

#----------------------------------------------------------------------
#-----------------------------------ESCOLHER AS VARIAVEIS
#----------------------------------------------------------------------

variaveis <- c('PK_COD_MATRICULA',
               'NUM_IDADE',
               'ID_DEPENDENCIA_ADM_ESC',
               'ID_LOCALIZACAO_ESC',
               'TP_SEXO',
               'TP_COR_RACA',
               'TP_NACIONALIDADE',
               'FK_COD_PAIS_ORIGEM',
               'FK_COD_ESTADO_NASC',
               'FK_COD_MUNICIPIO_DNASC',
               'FK_COD_ESTADO_END',
               'FK_COD_MUNICIPIO_END',
               'ID_ZONA_RESIDENCIAL',
               'ID_POSSUI_NEC_ESPECIAL',
               'FK_COD_ETAPA_ENSINO')

filtro  <- c('FK_COD_ETAPA_ENSINO %in% c(25:38,71)')


#----------------------------------------------------------------------
#-----------------------------------IMPORTAR
#----------------------------------------------------------------------


#----------------------------------------------------------------------
#----------------------------------- NORTE
#----------------------------------------------------------------------

MATRICULA_NORTE <- readRDS('MATRICULA_NORTE.rds')
texto <-
  paste0('norte',
         " <- ",
         'MATRICULA_NORTE',
         "%>% select(",
         paste(variaveis, collapse = ','),
         ") %>% filter(",
         filtro,
         ")")
eval(parse(text=texto))
saveRDS(norte,'transformacao_norte.rds')
remove(MATRICULA_NORTE)
remove(norte)

#----------------------------------------------------------------------
#----------------------------------- SUL
#----------------------------------------------------------------------

MATRICULA_SUL <- readRDS('MATRICULA_SUL.rds')
texto <-
  paste0('sul',
         " <- ",
         'MATRICULA_SUL',
         "%>% select(",
         paste(variaveis, collapse = ','),
         ") %>% filter(",
         filtro,
         ")")
eval(parse(text=texto))
remove(MATRICULA_SUL)
saveRDS(sul,'transformacao_sul.rds')
remove(sul)

#----------------------------------------------------------------------
#----------------------------------- NORDESTE
#----------------------------------------------------------------------

MATRICULA_NORDESTE <- readRDS('MATRICULA_NORDESTE.rds') 
texto <-
  paste0(
    'nordeste',
    " <- ",
    'MATRICULA_NORDESTE',
    "%>% select(",
    paste(variaveis, collapse = ','),
    ") %>% filter(",
    filtro,
    ")")
eval(parse(text=texto))
remove(MATRICULA_NORDESTE)
saveRDS(nordeste,'transformacao_nordeste.rds')
remove(nordeste)

#----------------------------------------------------------------------
#----------------------------------- CENTRO OESTE
#----------------------------------------------------------------------

MATRICULA_CO <- readRDS('MATRICULA_CO.rds')
texto <-
  paste0('co',
         " <- ",
         'MATRICULA_CO',
         "%>% select(",
         paste(variaveis, collapse = ','),
         ") %>% filter(",
         filtro,
         ")")
eval(parse(text=texto))
remove(MATRICULA_CO)
saveRDS(co,'transformacao_co.rds')
remove(co)

#----------------------------------------------------------------------
#----------------------------------- SUDESTE
#----------------------------------------------------------------------

MATRICULA_SUDESTE <- readRDS('MATRICULA_SUDESTE.rds') 
texto <-
  paste0(
    'sudeste',
    " <- ",
    'MATRICULA_SUDESTE',
    "%>% select(",
    paste(variaveis, collapse = ','),
    ") %>% filter(",
    filtro,
    ")")
eval(parse(text=texto))
remove(MATRICULA_SUDESTE)
saveRDS(sudeste,'transformacao_sudeste.rds')
remove(sudeste)



#----------------------------------------------------------------------
#-----------------------------------CARREGAR AS TABELAS
#----------------------------------------------------------------------


norte <- readRDS('transformacao_norte.rds')
sul <- readRDS('transformacao_sul.rds')
co <- readRDS('transformacao_co.rds')
nordeste <- readRDS('transformacao_nordeste.rds')
sudeste <- readRDS('transformacao_sudeste.rds')

#----------------------------------------------------------------------
#-----------------------------------CRIAR AS VARIAVEIS DE UF
#----------------------------------------------------------------------

# UF CENSO

norte$uf_censo <- 'norte'
sul$uf_censo <- 'sul'
co$uf_censo <- 'co'
nordeste$uf_censo <- 'nordeste'
sudeste$uf_censo <- 'sudeste'


#----------------------------------------------------------------------
#-----------------------------------JUNTAR AS BASES
#----------------------------------------------------------------------

dados_br <- rbind(norte,sul,co,nordeste,sudeste)
dim(dados_br)

names(dados_br)


#----------------------------------------------------------------------
#-----------------------------------CRIAR AS VARIAVEIS - BANCO TODO
#----------------------------------------------------------------------

# TIPO ESCOLA
dados_br <- dados_br %>%
  mutate(escola_pubica=ifelse(ID_DEPENDENCIA_ADM_ESC %in% c(1,2,3),1,ifelse(ID_DEPENDENCIA_ADM_ESC %in% c(4),0,'-')))


#----------------------------------------------------------------------
#-----------------------------------EXPORTAR O BANCO
#----------------------------------------------------------------------

nome <- paste0('dados_',ano,'.txt')
fwrite(dados_br,nome)


nrow(dados_br)
names(dados_br)

b <- Sys.time()
b-a