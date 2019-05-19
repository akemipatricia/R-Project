#----------------------------------------------------------------------
#-----------------------------------EXTRAÇÃO 2014
#----------------------------------------------------------------------


#----------------------------------------------------------------------
#----------------------------------- CARREGAR PACOTE
#----------------------------------------------------------------------

#Carrega o pacote 
require(data.table)
require(dplyr)

#----------------------------------------------------------------------
#-----------------------------------SET DIR
#----------------------------------------------------------------------

dir <- choose.dir()
setwd(dir)
ano <- '2013'

#----------------------------------------------------------------------
#----------------------------------- IMPORTAR
#----------------------------------------------------------------------

#----------------------------------------------------------------------
#----------------------------------- NORTE
#----------------------------------------------------------------------

# Importing
MATRICULA_NORTE<-fread(file="MATRICULA_NORTE.csv",sep="|") 
saveRDS(MATRICULA_NORTE,'MATRICULA_NORTE.rds')
#norte <- MATRICULA_NORTE %>% select('NU_ANO_CENSO','TP_DEPENDENCIA','CO_UF','ID_MATRICULA','NU_IDADE','IN_MANT_ESCOLA_PRIVADA_SIST_S','TP_INGRESSO_FEDERAIS')
remove(MATRICULA_NORTE)

#----------------------------------------------------------------------
#----------------------------------- SUL
#----------------------------------------------------------------------

# Importing
MATRICULA_SUL<-fread(file="MATRICULA_SUL.csv",sep="|") 
saveRDS(MATRICULA_SUL,'MATRICULA_SUL.rds')
#sul <- MATRICULA_SUL %>% select('NU_ANO_CENSO','TP_DEPENDENCIA','CO_UF','ID_MATRICULA','NU_IDADE','IN_MANT_ESCOLA_PRIVADA_SIST_S','TP_INGRESSO_FEDERAIS')
remove(MATRICULA_SUL)


#----------------------------------------------------------------------
#----------------------------------- NORDESTE
#----------------------------------------------------------------------

# Importing
MATRICULA_NORDESTE<-fread(file="MATRICULA_NORDESTE.csv",sep="|") 
saveRDS(MATRICULA_NORDESTE,'MATRICULA_NORDESTE.rds') 
#nordeste <- MATRICULA_NORDESTE %>% select('NU_ANO_CENSO','TP_DEPENDENCIA','CO_UF','ID_MATRICULA','NU_IDADE','IN_MANT_ESCOLA_PRIVADA_SIST_S','TP_INGRESSO_FEDERAIS')
remove(MATRICULA_NORDESTE)

 
#----------------------------------------------------------------------
#----------------------------------- SUDESTE
#----------------------------------------------------------------------

# Importing
MATRICULA_SUDESTE<-fread(file="MATRICULA_SUDESTE.csv",sep="|") 
saveRDS(MATRICULA_SUDESTE,'MATRICULA_SUDESTE.rds') 
#sudeste <- MATRICULA_SUDESTE %>% select('NU_ANO_CENSO','TP_DEPENDENCIA','CO_UF','ID_MATRICULA','NU_IDADE','IN_MANT_ESCOLA_PRIVADA_SIST_S','TP_INGRESSO_FEDERAIS')
remove(MATRICULA_SUDESTE)


#----------------------------------------------------------------------
#----------------------------------- CENTRO OESTE
#----------------------------------------------------------------------

# Importing
MATRICULA_CO<-fread(file="MATRICULA_CO.csv",sep="|") 
saveRDS(MATRICULA_CO,'MATRICULA_CO.rds') 
#co <- MATRICULA_CO %>% select('NU_ANO_CENSO','TP_DEPENDENCIA','CO_UF','ID_MATRICULA','NU_IDADE','IN_MANT_ESCOLA_PRIVADA_SIST_S','TP_INGRESSO_FEDERAIS')
remove(MATRICULA_CO)

