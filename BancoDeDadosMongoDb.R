# Manipulando informa��es no banco de dados com R.

# Importar o arquivo para dentro do mongodb

# instalando plugin do mongodb
install.packages("rmongodb")
library(rmongodb)

# Criando uma conex�o
help("mongo.create")

if(mongo.is.connected(mongo) == TRUE){
  mongo.get.databases(mongo)
}

# Armazenando o nome de uma das cole��es
coll <- "users.contatos"

# Contando os registros em uma cole��o
help("mongo.count")
total <- mongo.count(mongo, coll)

# buscando um registro numa cole��o
mongo.find.one(mongo, coll)

# Obtendo um vetor de valores distintos das chaves de uma cole��o
res <- mongo.distinct(mongo, coll, "city")
head(res)

#Obtendo um vetor de valores distintos das chaves de uma cole��o
# E gerando um histograma
pop <- mongo.distinct(mongo, coll, "pop")
hist(pop)

# Coletando elementos
nr <- mongo.count(mongo, coll, list('pop' = list("$lte" = 2)))
print(nr)

pops <- mongo.find.all(mongo, coll, list('pop' = list("$lte" = 2)))
print(pops, 2)

# Encerrando a conex�o
mongo.destroy(mongo)


# Validando arquivos json
library(jsonlite)
json_arquivo <- '{"pop":{"$lte": 2}, "pop":{"$gte": 1}}'
cat(prettify(json))

validate(json_arquivo)
