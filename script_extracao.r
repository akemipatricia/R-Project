#----------------------------------------------------------------------
#-----------------------------------EXTRAÇÃO 2012
#----------------------------------------------------------------------


#----------------------------------------------------------------------
#----------------------------------- CARREGAR PACOTE
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
#----------------------------------- IMPORTAR
#----------------------------------------------------------------------

#----------------------------------------------------------------------
#----------------------------------- NORTE
#----------------------------------------------------------------------

# Importing
MATRICULA_NORTE<-fread(file="MATRICULA_NORTE.csv",sep="|") 
saveRDS(MATRICULA_NORTE,'MATRICULA_NORTE.rds')
remove(MATRICULA_NORTE)

#----------------------------------------------------------------------
#----------------------------------- SUL
#----------------------------------------------------------------------

# Importing
MATRICULA_SUL<-fread(file="MATRICULA_SUL.csv",sep="|") 
saveRDS(MATRICULA_SUL,'MATRICULA_SUL.rds')
remove(MATRICULA_SUL)


#----------------------------------------------------------------------
#----------------------------------- NORDESTE
#----------------------------------------------------------------------

# Importing
MATRICULA_NORDESTE<-fread(file="MATRICULA_NORDESTE.csv",sep="|") 
saveRDS(MATRICULA_NORDESTE,'MATRICULA_NORDESTE.rds') 
remove(MATRICULA_NORDESTE)

 
#----------------------------------------------------------------------
#----------------------------------- SUDESTE
#----------------------------------------------------------------------

# Importing
MATRICULA_SUDESTE<-fread(file="MATRICULA_SUDESTE.csv",sep="|") 
saveRDS(MATRICULA_SUDESTE,'MATRICULA_SUDESTE.rds') 
remove(MATRICULA_SUDESTE)


#----------------------------------------------------------------------
#----------------------------------- CENTRO OESTE
#----------------------------------------------------------------------

# Importing
MATRICULA_CO<-fread(file="MATRICULA_CO.csv",sep="|") 
saveRDS(MATRICULA_CO,'MATRICULA_CO.rds') 
remove(MATRICULA_CO)

