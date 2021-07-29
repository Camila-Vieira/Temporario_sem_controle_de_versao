### Curso 3/10: Obtenção e limpeza de dados 
# Swirl
library(swirl)
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




###########################################################################

# swirl Lesson 2: Grouping and Chaining with dplyr
library(dplyr) # Carregar pacote
cran <- tbl_df(mydf)  # Pegar *mydf* tranaformando em *tbl_df* e amazenando-a em nova variavel *cran*
rm('mydf') # Remover dado original
cran # Visualizar no console
# Agrupar os dados por nome de pacotes
?group_by # Abrir arquivo de ajuda
by_package <- group_by(cran, package) # Agrupar *cran* pela variavel *package* e armazenar em *by_package*
by_package
# No topo verei *Groups: package*, agora qualquer coisa que alterar ocorrerá pela variavel pacote
summarize(by_package, mean(size)) # Observar o tamanho médio do download para cada pacote exclusivo

############
# Compute four values, in the following order, from
# the grouped data:
#
# 1. count = n()
# 2. unique = n_distinct(ip_id)
# 3. countries = n_distinct(country)
# 4. avg_bytes = mean(size)
#
# A few thing to be careful of:
#
# 1. Separate arguments by commas
# 2. Make sure you have a closing parenthesis
# 3. Check your spelling!
# 4. Store the result in pack_sum (for 'package summary')
#
# You should also take a look at ?n and ?n_distinct, so
# that you really understand what is going on.

pack_sum <- summarize(by_package,
                      count = n(),
                      unique = n_distinct(ip_id),
                      countries = n_distinct(country),
                      avg_bytes = mean(size))
submit()
pack_sum

# A coluna *count*, criada com n (), contém o número total de linhas (ou seja, downloads) para cada pacote. 
# A coluna *unique*, criada com n_distinct (ip_id), fornece o número total de downloads exclusivos para cada pacote, medido pelo número de ip_ids distintos. 
# A coluna *countries*, criada com n_distinct (country), fornece o número de países em que cada pacote foi baixado.
# A coluna 'avg_bytes', criada com mean(size), contém o tamanho médio do download (em bytes) para cada pacote.

quantile(pack_sum$count, probs = 0.99) #  Saber o valor de *count* que divide os dados em 1% superior e 99% inferior dos pacotes com base no total de downloads.
top_counts <- filter(pack_sum, count > 679.)
top_counts
View(top_counts)
top_counts_sorted <- arrange(top_counts, desc(count)) # Organizar em ordem decrescente a coluna *count* e atribuir a uma nova variavel
View(top_counts_sorted)
quantile(pack_sum$unique, probs = 0.99) # Para obter o quantil de 0,99, ou 99% para *unique*
top_unique <- filter(pack_sum, unique > 465) # selecionar todas as linhas correspondentes aos valores de *unique* que são estritamente maiores que 465.
View(top_unique)
top_unique_sorted <- arrange(top_unique, desc(unique)) # Organizar em ordem decrescente, para ver quais pacotes foram mais baixados do maior número de endereços IP unique.
View(top_unique_sorted)

######
# Don't change any of the code below. Just type submit()
# when you think you understand it.

# We've already done this part, but we're repeating it
# here for clarity.

by_package <- group_by(cran, package)
pack_sum <- summarize(by_package,
                      count = n(),
                      unique = n_distinct(ip_id),
                      countries = n_distinct(country),
                      avg_bytes = mean(size))

# Here's the new bit, but using the same approach we've
# been using this whole time.

top_countries <- filter(pack_sum, countries > 60)
result1 <- arrange(top_countries, desc(countries), avg_bytes)

# Print the results to the console.
print(result1)

submit()

#########
# Don't change any of the code below. Just type submit()
# when you think you understand it. If you find it
# confusing, you're absolutely right!

result2 <-
  arrange(
    filter(
      summarize(
        group_by(cran,
                 package
        ),
        count = n(),
        unique = n_distinct(ip_id),
        countries = n_distinct(country),
        avg_bytes = mean(size)
      ),
      countries > 60
    ),
    desc(countries),
    avg_bytes
  )

print(result2)
submit()

##########
# Read the code below, but don't change anything. As
# you read it, you can pronounce the %>% operator as
# the word 'then'.
#
# Type submit() when you think you understand
# everything here.

result3 <-
  cran %>%
  group_by(package) %>%
  summarize(count = n(),
            unique = n_distinct(ip_id),
            countries = n_distinct(country),
            avg_bytes = mean(size)
  ) %>%
  filter(countries > 60) %>%
  arrange(desc(countries), avg_bytes)

# Print result to console
print(result3)
View(result3)

#########
# select() the following columns from cran. Keep in mind
# that when you're using the chaining operator, you don't
# need to specify the name of the data tbl in your call to
# select().
#
# 1. ip_id
# 2. country
# 3. package
# 4. size
#
# The call to print() at the end of the chain is optional,
# but necessary if you want your results printed to the
# console. Note that since there are no additional arguments
# to print(), you can leave off the parentheses after
# the function name. This is a convenient feature of the %>%
# operator.

cran %>%
  select(ip_id, country, package, size) %>%
  print
submit()

#########
# Use mutate() to add a column called size_mb that contains
# the size of each download in megabytes (i.e. size / 2^20).
#
# If you want your results printed to the console, add
# print to the end of your chain.

cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  print
submit()

########
# Use filter() to select all rows for which size_mb is
# less than or equal to (<=) 0.5.
#
# If you want your results printed to the console, add
# print to the end of your chain.

cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  filter(size_mb <= 0.5) %>%
  print
# Your call to filter() goes here
submit()

#########
# arrange() the result by size_mb, in descending order.
#
# If you want your results printed to the console, add
# print to the end of your chain.

cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  filter(size_mb <= 0.5) %>%
  arrange(desc(size_mb))
submit()
# Your call to arrange() goes here



###############################################################
#### swirl Lesson 3: Tidying Data with tidyr
library(swirl)
swirl()
# Nesta lição, você aprenderá como organizar seus dados com o pacote tidyr.
library(tidyr) # Carregar pacote
# Os dados organizados *tidyr* são formatados de uma forma padrão que facilita a exploração e a análise e funcionam perfeitamente com outras ferramentas de dados organizados.
# Os dados organizados satisfazem três condições:
# 1) Cada variável forma uma coluna 
# 2) Cada observação forma uma linha
# 3) Cada tipo de unidade observacional forma uma tabela
students # Dados confusos, pois tem cabeçalhos de coluna que são valores, não nomes de variáveis.
# A primeira coluna representa cada uma das cinco séries possíveis que os alunos podem receber para uma classe particular. A segunda e terceira colunas fornecem o número de alunos do sexo masculino e feminino, respectivamente, que receberam cada série.
# Esse conjunto de dados tem três variáveis: nota, sexo e contagem. A primeira coluna está correta.
?gather # Reúna colunas em pares de valores-chave


