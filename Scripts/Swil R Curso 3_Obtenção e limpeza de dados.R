### Curso 3/10: Obtenção e limpeza de dados 
# Swirl
install_from_swirl("Getting and Cleaning Data")
swirl()
# 1: Manipulating Data with dplyr
#  Aprender como manipular dados usando dplyr. 
# dplyr é um pacote R que fornece uma gramática consistente e concisa para a manipulação de dados tabulares.

mydf <- read.csv(path2csv, stringsAsFactors = FALSE)
dim(mydf) # Visualizar as dimensões
head(mydf) # Visualizar o cabeçalho com as primeiras 6 linhas
library(dplyr) # Carregar o pacote
packageVersion("dplyr") # Visualizar versão do pacote
# data frame tbl' ou 'tbl_df' 
cran <- tbl_df(mydf) # criar um novo tbl_df chamado cran
rm("mydf") # Remover o dataframe original da area de trabalho
cran # imprimir no console -> tdl_df é mais informativo do que dataframe
# O pacote dply possui: select(), filter(), arrange(), mutate(), and summarize()

# selecionar um subconjunto de colunas usando select()
?select # Ler documentação da primeira função
select(cran, ip_id, package, country) # Selecionar no cran apenas as variaveis de interesse
# Repare que nao foi necessario digitar cran $ ip_id, como faria em um dataframe
# Repare tbm que ficou na ordem que especifiquei
5:20 # Criar sequencia do 5 ao 20
select(cran, r_arch:country) # Select permite selecionar a sequencia que especifiquei
select(cran, country:r_arch) # Selecionar na ordem inversa
select(cran, -time) # Omitir a coluna time do cran
-5:20 # Apenas do 1 ao 5 fica negativos
-(5:20) # Coloca todos os numeros em negativo
select(cran, -(X:size)) # Omitir todas as colunas de X ate size

# selecionar um subconjunto de linhas usando filter()
filter(cran, package == "swirl") # selecionar todas as linhas para as quais a variável de pacote é igual a "swirl"
# Repare que filter () reconhece 'pacote' como uma coluna de cran, sem eu especificar explicitamente cran$package.
# operador == pergunta se o que está à esquerda é igual ao que está à direita. Se sim, ele retorna TRUE. Se não, então FALSE. 
filter(cran, r_version == "3.1.1", country == "US") # Especificando minhas condições
# retornará todas as linhas de cran correspondendo a downloads de usuários nos EUA executando a versão R 3.1.1. 
?Comparison
filter(cran, r_version <= "3.0.2", country == "IN") # menor ou igual
filter(cran, country == "US" | country == "IN") # Me dará todas as linhas para as quais a variável do país é igual a "EUA" ou "IN"
filter(cran, size > 100500, r_os == "linux-gnu") # nos dará todas as linhas para as quais o tamanho é estritamente maior que 100500 e r_os é "linux-gnu".

# Para ver valores ausentes no R (NA)
is.na(c(3,5,NA, 10)) # Emite resposta logica no console, nos diz o que é NA por meio do TRUE e FALSE para os valores que nao sao NA
!is.na(c(3,5,NA, 10)) # Alterar todos os TRUEs para FALSEs e todos os FALSEs para TRUEs, nos dizendo o que NÃO é NA
filter(cran, !is.na(r_version)) # para retornar todas as linhas de cran para o qual r_version NÃO é NA.
cran2 <- select(cran, size:ip_id) # Pegar um subconjunto de cran,select() todas as colunas de size até ip_id e armazenar o resultado em cran2
arrange(cran2, ip_id) # Organizar em ordem crescente
arrange(cran2, desc(ip_id)) # Organizar em ordem decrescente
arrange(cran2, package, ip_id)
# Organizará por nomes de pacotes em ordem alfabetica e, depois, por ip_id. Se houver várias linhas com o mesmo valor p/ o pacote, elas serão classificadas por ip_id (crescentenumericamente). 
arrange(cran2, country, desc(r_version), ip_id) # Organizar
cran3 <- select(cran, ip_id, package, size)
cran3

# mutate() cria uma nova variável com base no valor de uma ou mais variáveis existente em um conjunto de dados
mutate (cran3, size_mb = size / 2 ^ 20) ## adicionar uma coluna chamada size_mb que contém o tamanho do download em megabytes
mutate(cran3, size_mb = size / 2^20, size_gb = size_mb / 2^10)
mutate(cran3, correct_size = size + 1000)


## summarize() reduz o conjunto de dados em uma única linha. 
summarize(cran, avg_bytes = mean(size)) # estamos interessados em saber o tamanho médio do download, resultará no valor médio do tamanho da variável

