### swirl Lesson 4: Vectors

install.packages("swirl")
library(swirl)
ls() ## Para visualizar os objetos que tenho no Environment
rm(list=ls()) ## Para limpar meu Environment
swirl()
c(0.5, 55, -10, 6) ## Criar um vetor numÃ©rico, o c Ã© usado para criar um vetor
num_vect <- c(0.5, 55, -10, 6) ## Atribui o que estÃ¡ do lado direito a variÃ¡vel num_vect 
tf <- num_vect < 1 ## Cria a variÃ¡vel tf que obtÃ©m o valor da num_vect menor que 1 
tf ## Autoimprime
num_vect >= 6 ## Mostra uma resposta lÃ³gica para cada elemento do objeto num_vect
c("My", "name", "is")
my_char <- c("My", "name", "is") ## Cria um vetor caracter de cumprimento 3
my_char ## Autoimprime
paste(my_char, collapse = " ") ## Junta os objetos dentro do my_char e forma uma frase, o collapse fala para o R que deve ter espaÃ§o entre as palavras
my_name <- c(my_char, "Camila_Alcione_Vieira")
my_name
paste(my_name, collapse = " ")
paste("Hello", "world!", sep = " ")  ## Sep " " diz para o R que queremos separar as palavras com um Ãºnico espaÃ§o
paste(1:3, c("X", "Y", "Z"), sep = "") ## Juntas dois vetores de cumprimento 3, um num. e o outro char, o sep "" foi usado para nÃ£o ter espaÃ§o 
paste(LETTERS, 1:4, sep = "-")

### swirl Lesson 5: Missing Values
## Quando houver valores NAs nÃ£o deve ignorÃ¡-los, deve ser cuidadosamente estudados p/ ver se hÃ¡ um padrÃ£o ou causa subjacente da ausencia deles
library(swirl)  ## carregar o pacote swirl
ls()  ## Ver as variÃ¡vel que tenho no meu environment
rm(list = ls())  ## Limapar as variÃ¡veis do meu environment
swirl() ## Iniciando o swirl
x <- c(44, NA, 5, NA)  ## A variÃ¡vel x obtÃ©m estes valores, veremos que qualquer operaÃ§Ã£o envolvendo NA geralmente produz NA como resultado
## NA sÃ£o dados ausentes
x * 3
y <- rnorm(1000)  ## Criar um vetor contendo 1000, foi extraÃ­do de uma distribuiÃ§Ã£o normal
?rnorm
z <- rep(NA, 1000) ## Replica os valores em x (NA) na quantidade do prÃ³ximo nÃºmero (1000)
?rep
my_data <- sample(c(y,z), 100) ## Seleciona 100 elementos aleatoriamente das variÃ¡veis y e z
?sample  ## sample obtÃ©m uma amostra do tamanho especificado em  x (100)
my_na <- is.na(my_data)  ## A funÃ§Ã£o is.na nos darÃ¡ uma resposta dizendo se cada elemento do vetor Ã© um NA (TRUE, FALSE), e as respostas serÃ£o atribuÃ­das a my_na
my_na ## Para vizualizar os dados
my_data == NA  ## o operador == corresponde a teste de igualdade, irei receber todos os NAs pq, NAs nÃ£o Ã© um valor e sim um espaÃ§o reservado para uma quantidade que nÃ£o estÃ¡ disponÃ­vel
sum(my_na) ## A funÃ§Ã£o sum farÃ¡ a contagem de quantos NAs estÃ£o presentes na variÃ¡vel my_na
my_data ## Vizualizar os dados
## NaN Ã© tambÃ©m um tipo de valor ausente, mas significa nÃ£o numÃ©rico
0/0 ## IrÃ¡ gerar um valor NaN 
Inf - Inf  ## Inf significa infinito

### swirl Lesson 6: Subsetting Vectors 
## Nesta liÃ§Ã£o, iremos ver como extrair elementos de um vetor com base em condiÃ§Ãµes que especificamos 
x ## VariÃ¡vel criada pelo curso automaticamente, contÃ©m uma ordem aleatÃ³ria de 20 elementos de uma distribuiÃ§Ã£o normal e 20 NAs
## Para oter um subconjunto (elementos especÃ­ficos) de um vetor Ã© colocando 'index vector' dentro do colchete imediatamente apÃ³s o nome do vetor
x[1:10] ## O subconjunto que quero Ã© o do 1 atÃ© o 10, entÃ£o coloquei entre []
## Vetores de Ã­ndices: vetores logical, vetores de integers positivos, vetores de intergers negativos e vetores de strings character
## is.na() nos diz onde os NAs estao, com valores TRUE (pra quando Ã© um NA) e FALSE
x[is.na(x)] ## Me darÃ¡ todos os NA
## ! nos dÃ¡ a negaÃ§Ã£o de uma expressÃ£o lÃ³gica
y <- x[!is.na(x)]  ## !is.na(x) pode ser lido como nÃ£o Ã© NA, me darÃ¡ todos os valores que nÃ£o sÃ£o NA
y ## y agora Ã© uma variÃ¡vel com todos os valores nÃ£o ausentes do x
y > 0 ## Ã‰ uma expressÃ£o lÃ³gica (TRUE, FALSE), TRUE indicarÃ¡ todos os elementos positivos maiores que zero
y[y > 0] ## Verei apenas os elementos positivos, aqui estou indexando vetor, indicando entre [] apenas o subconjunto que eu quero
x[x > 0] ## Aqui nÃ£o funciona como o exemplo anterior, pois NA nÃ£o Ã© um valor e sim um espaÃ§o reservado para uma quantidade desconhecida e entÃ£o temos um tanto de NA misturados com nossos valores positivos
x[!is.na(x) & x > 0] ## Quero todos os valores de x que nÃ£o sÃ£o NA e que sÃ£o maiores que 0
## R usa o 'one-based indexing', ou seja, usa a indexaÃ§Ã£o baseada em 1, isso significa que o primeiro elemento de um vetor Ã© considerado o elemento 1 
x[c(3, 5, 7)] ## Quero apenas o subconjunto do x, quero o terceiro, o quinto e o sÃ©timo elemento, para isso preciso usar o c()
x[0] ## Quero o elemento 0 da variÃ¡vel x, mas o 0 nÃ£o Ã© um elemento definido no R, olhe as duas linhas anteriores
x[3000] ## Quero o elemento da variÃ¡vel x que ocupa o lugar 3000Âº, receberei valor NA, pois sÃ³ tenho 40 objetos dentro do x
## x[c(2, 10)] me dÃ¡ apenas os elementos que ocupam a posiÃ§Ã£o 2 e a 10, x[c(-2, -10)] me dÃ¡ todos os elementos, menos os elementos que ocupam a posiÃ§Ã£o 2 e 10
x[c(-2, -10)] ## Receberei todos os elementos, exceto os que ocupam a posiÃ§Ã£o 2 e 10
x[-c(2, 10)] ## Receberei o mesmo resultado da linha anterior, mas esta Ã© uma forma de colocar o operador -, na frente do c e depois os numeros que se seguem vem de forma positiva
vect <- c(foo = 11, bar = 2, norf = NA) ## Criar um vetor numÃ©rico com trÃªs elementos nomeados
vect
names(vect) ## Para obter os nomes dos elementos da variÃ¡vel vect
vect2 <- c(11, 2, NA) ## Criar um vetor sem nomear os elementos
names(vect2) <- c("foo", "bar", "norf") ## Nomeando os elementos do vetor vect2
identical(vect, vect2) ## Ver se os vetores vect e vect2 sÃ£o identicos
vect["bar"] ## Quero o elemento nomeado por "bar"
vect[c("foo", "bar")] ## Quero esses elementos que especifiquei 

library(swirl)
swirl()
Camila
1

###  swirl Lesson 7: Matrices and Data Frames
my_vector <- 1:20  ## Cria um vetor de número 1 até o 20 armazenado na variável "my_vector"
my_vector
dim(my_vector)  ## Tira as dimensões do vetor, como não tem atributos, vai ser nulo
length(my_vector)  ## Para saber qual o comprimento do "my_vector"
## A função dim () permite q eu obtenha OU defina o atributo `dim` para um objeto R. 
dim(my_vector) <- c(4,5)  ## Atribuímos o valor c (4, 5) ao atributo `dim` de my_vector
dim(my_vector) ## Autoimprime no console
attributes(my_vector)  ## Faz o mesmo que o dim, temos o 4 como linhas e o 5 como colunas
View(my_vector) ## Para ver em outra aba a variável my_vector
my_vector ## Aqui mostra no console 
class(my_vector)  ## Permite confirmar se agora o que era um vetor, virou uma matrix
my_matrix <- my_vector  ## Aqui estou nomeando o que era o my_vector como my_matrix
?matrix ## Ler sobre matrix
my_matrix2 <- matrix(c(1:20), nrow = 4, ncol = 5) ## Cria uma matrix
identical(my_matrix, my_matrix2)  ## Dirá se são iguais 
patients <- c("Bill", "Gina", "Kelly", "Sean")
cbind(patients, my_matrix)  ## A função cbind combina as colunas, vamos perceber que a matrix que era numérica ao juntar com a variável character, ela virou tbm. 
## Lembrete - matrix só pode conter uma classe de dados; nuémrica, logica, character
my_data <- data.frame(patients, my_matrix) ## Incluir os nomes dos pacientes na tabela sem destruir a integridade dos nossos dados numéricos
my_data
## data.frame() permite armazenar vetor de caracter de nome ao lado da matriz de números
class(my_data) ## Permite saber ou confirmar a qual tipo de classe o meu objeto pertence
cnames <- c("patient", "age", "weight", "bp", "rating", "test") ## Criando uma variável com nome
colnames(my_data) <- cnames ## Atribuindo as colunas de nomes 
my_data


### swirl 8 Logic

library(swirl)
swirl()
Camila
## == testa se dois valores ou números booleanos são iguais
TRUE == TRUE ## Operador de == (igualdade) para saber se são iguais
(FALSE == TRUE) == FALSE ## Expressões lógicas podem ser usadas entre (), como se fosse expressão aritmétrica, resolve o que está entre () e depois as outras
6 == 7  ## Pode ser usado para comparar números
6 < 7 ## Operador de maior ou menor
10 <= 10 ## Operador menor ou igual
## o operador diferente de `!=` testa se dois valores booleanos ou números são desiguais
5 != 7  ## Operador != diferente de, avalia se são desiguais
## O operador '!' na frente do número nega as expressões, para que as TRUE se tornem FALSE e as FALSE se tornem TRUE
!5 == 7 

## Tem dois Operadores e, '&', '&&'
FALSE & FALSE
TRUE & c(TRUE, FALSE, FALSE)  ## O operador TRUE o avalia em todo o vetor. Aqui vai funcionar como se tivesse mais 2 TRUE do lado esquerdo, c(TRUE, TRUE, TRUE) & c(TRUE, FALSE, FALSE)
TRUE && c(TRUE, FALSE, FALSE)  ## O operando esquerdo só é avaliado com o primeiro membro do operando à direita (o vetor).

## Operador ou, |OR (avalia OR em todo um vetor), ||OR (avalia apenas o primeiro membro de um vetor)
TRUE | c(TRUE, FALSE, FALSE)  ## Uma expressão usando o operador OR será avaliada como TRUE se o operando esquerdo ou o operando certo é TRUE. Se ambos forem TRUE, a expressão será avaliada como TRUE, no entanto, se nenhum for TRUE, a expressão será FALSE.
TRUE || c(TRUE, FALSE, FALSE)
## Todos os 'e' são avaliados antes dos 'ou', resolva primeiro os 'e' e depois os 'ou'
5 > 8 || 6 != 8 && 4 > 3.9
FALSE 
1: TRUE && 62 < 62 && 44 >= 44
FALSE
2: FALSE || TRUE && FALSE
FALSE
3: 99.99 > 100 || 45 < 7.3 || 4 != 4.0
FALSE || FALSE
4: TRUE && FALSE || 9 >= 4 && 3 < 6
TRUE 
1: 6 >= -9 && !(6 > 7) && !(!TRUE)
TRUE  
2: !(8 > 4) ||  5 == 5.0 && 7.8 >= 7.79
TRUE
3: FALSE || TRUE && 6 != 4 || 9 > 4
TRUE 
4: FALSE && 6 >= 6 || 7 >= 8 || 50 <= 49.5
FALSE 

isTRUE (6 > 4) ## A função isTRUE () leva um argumento. Se esse argumento for avaliado como TRUE, o a função retornará TRUE. Caso contrário, a função retornará FALSE
identical('twins', 'twins') ## Retornará TRUE se os dois elementos forem iguais
xor(5 == 6, !FALSE)  ## A função xor () significa OR exclusivo. Se um argumento for avaliado como TRUE e um argumento for avaliado como FALSO, então esta função retornará VERDADEIRO, caso contrário, retornará FALSO.
## Se for dois TRUE a função retornará FALSE
ints <- sample(10)  ## Criar vetor de números aleatórios até o 10
ints ## Exibir o conteúdo
ints > 5 ## Resultará em repostas lógicas para cada elemento do ints se é menor que 5
which(ints > 7) ## PAra procurar os elementos de ints maiores que 7
## any() retornará TRUE se um ou mais dos elementos no vetor lógico for TRUE. 
## all() retornará TRUE se cada elemento no vetor lógico é TRUE.

any(ints < 0)  ## ver se algum dos elementos de ints é menor que zero
all(ints > 0)  ## ver se todos os elementos de ints são maiores que zero


### swirl Lesson 2: Functions - Funções retornam um valor
## Funções geralmente são caracterizadas pelo nome da função seguido por parêntese
Sys.Date()  ## retorna uma string que representa a data de hoje
mean(c(2, 4, 5)) ## mean retorna a média dos argumentos dentro dos ()
boring_function('My first function!')
boring_function  ## Para ver o código fonte de uma função, basta digitar o nome dela sem os ()
##  sum () retorna a soma de um vetor.
## length () retorna o tamanho de um vetor.

my_mean(c(4,5,10))
library(swirl)
swirl()
Camila
3
1
14
### swirl Lesson 3: Dates and Times

library(swirl)
swirl()
d1 <- Sys.Date()  ## Armazenar a data na variável d1
class(d1)  ## Para confirmar se d1 é um objeto Date
unclass(d1)  ## Para ver como d1 funciona internamente, o número que sairá como resultado representará a contagem de dias deste 01/01/1970
d1 ## Ao imprimir, receberei a data, ano, mês e dia de hoje
d2 <- as.Date("1969-01-01")  ## Fazer referencia a data antes de 1970
unclass(d2)  ## Aparecerá dias negativos, indicandos quantos dias antes de 1970
t1 <- Sys.time()  ## Data e hora atual (hora, minuto, segundos - POSIXct)
t1
class(t1)
unclass(t1)  ## Quantidade de segundos deste 1970
t2 <- as.POSIXlt(Sys.time())
class(t2)
t2  ## O resultado será identico ao t1
unclass(t2)  ## Todos os POSIXlt aparecerá uma lista de valores da data e tempo
str(unclass(t2))  ## Para ter uma visão mais compacta dos valores
t2$min  ## Para ver apenas o valor de min da variável t2
weekdays(d1)  ## retornará o dia da semana do objeto d1 (data ou hora)
months(t1)  ## retornará o mes do objeto t1 POSIXct que contém a hora atual (bem, era a hora atual quando eu o criou).
quarters(t2)  ## retorna o trimestre do ano (Q1-Q4) a partir de qualquer data ou objeto de tempo, t2 é o objeto POSIXlt que contém a hora em que eu o criou.
## Datas e horas em um conjunto de dados podem estar em um formato que R não reconhece. A função strptime () pode ser útil nessa situação.
## strptime () converte vetores de caracteres em POSIXlt. Nesse sentido, é semelhante a as.POSIXlt (), exceto que a entrada não precisa estar em um formato específico (AAAA-MM-DD).
t3 <- "October 17, 1986 08:24"
t4 <- strptime(t3, "%B %d, %Y %H:%M")  ## para ajudar R a converter nosso objeto de data / hora em um formato que ele entenda.
t4  ## Imprimir o conteúdo da variável
class(t4)  ## Verificar a classe da variável
### Posso realizar em datas e horas operações aritméticas (+ e -) e comparações (<, ==, 

Sys.time() > t1  ## t1 contém a data que eu o criei, a sys.time de agora é maior que t1
Sys.time() - t1  ## Para saber a hora atual menos a hora que criei a t1
### Se eu quiser mais controle sobre as unidades ao encontrar a diferença de tempo acima, posso usar difftime (), que permite que eu especifique um parâmetro de 'unidades'
difftime(Sys.time(), t1, units = 'days')  ## para encontrar a quantidade de tempo em DAYS que passou desde que eu criei t1.

###  swirl Lesson 1: Os dois recebem uma lista -  lapply (sempre retorna lista) and sapply (tenta simplicar em vetor, mas as vezes não consegue)
library(swirl)
swirl()
head(flags)  ##  para visualizar as primeiras seis linhas do conjunto de dados flags
dim(flags)  ## para visualizar as dimensões do conjunto de dados flags, o primeiro valor(194) será a quantidade de linhas ou observações e o segundo (30) será as colunas ou variáveis.
viewinfo(flags)  ## Para abrir uma descrição mais completa do conjunto de dados em um arquivo de texto separado
class(flags) ## Para ver qual é a classe
## A função lapply () recebe uma lista como entrada, aplica uma função a cada elemento da lista e retorna uma lista do mesmo comprimento da origina
cls_list <- lapply(flags, class)  ## Usei o lapply para aplicar a função class a cada coluna do conjunto de dados para saber a classe de cada coluna
cls_list  ## vetor de caracteres
## o l em lapply significa lista
class(cls_list)  ## Retornar uma lista
## As listas são mais úteis para armazenar várias classes de dados. 
as.character(cls_list)
## sapply () permite automatizar esse processo chamando lapply (), s de simplificar
cls_vect <- sapply(flags, class)  ## Semelhante ao lapply, aqui fornecerar tipo caracter
?sapply
args(sapply)
class(cls_vect)
sum(flags$orange)  ## Quero que some todos os países em que a bandeira tenha a cor laranja
## Apenas nas colunas 11 a 17 que contém as cores
flag_colors <- flags[, 11: 17] ## A virgula antes do subconjunto  diz a R que quero todas as linhas, mas apenas as colunas de 11 a 17.)
head(flag_colors)  ## Para ver as 6 primeiras linhas 
lapply(flag_colors, sum)  ## Para somar os dados de flag_colors, o primeiro argumento é o flag_colors e o segundo é a função sum sem ()
## O resultado é uma lista já que lapply sempre retorna uma lista
## Sapply () nos exemplos acima foi capaz de simplificar o resultado para vetor. Isso ocorre porque cada elemento da lista retornado por lapply () era um vetor de comprimento um.
## quando cada elemento da lista retornada por lapply () é um vetor do mesmo comprimento (> 1), sapply () retorna uma matriz 
sapply(flag_colors, sum)  ## para retornar um vetor de somas de coluna
sapply(flag_colors, mean) ## para aplicar a média em cada coluna da flag_colors
flag_shapes <- flags[, 19:23]  ## Quero todas as linhas do subconjuntos 19 a 23 colunas
lapply(flag_shapes, range)  ## Para saber o mín e o máx de cada coluna
shape_mat <- sapply(flag_shapes, range)
shape_mat
class(shape_mat)  ## Foi maior que 1 por isso é matrix
unique(c(3, 4, 5, 5, 5, 6, 6))  ## retorna um vetor de apenas com os elementos 'únicos', exclui os duplicados 
unique_vals <- lapply(flags, unique)
unique_vals
sapply(unique_vals, length)  ## retorna a altura de cada elemento da lista unique_vals
sapply(flags, unique) ## retorna uma lista não simplificada
### Exemplo de minha função anonima usada com a função lapply, podem ser muito úteis quando uma das funções integradas de R não é uma opção.
lapply(unique_vals, function(elem) elem[2])  ## retornará uma lista contendo o segundo item de cada elemento da lista unique_vals. 
## nossa função recebe um argumento, elem, que é apenas uma 'variável fictícia' que assume o valor de cada elemento de unique_vals, por sua vez.


### swirl Lesson 2: vapply and tapply

dim(flags)
head(flags)
str(flags)
summary(flags)
viewinfo(flags)
sapply(flags, unique)  ## retorna uma lista contendo um vetor de valores exclusivos para cada coluna do conjunto de dados do flags
## vapply () permite que eu especifique explicitamente. Se o resultado não corresponder ao formato que eu especificar, vapply () lançará um erro, fazendo com que a operação pare. 
vapply(flags, unique, numeric(1))  ## Vou obter uma msg de erro, digite ok()
ok()
sapply(flags, class)  ## Na lição anterior, retornava um vetor de caracteres contendo a classe de cada coluna no conjunto de dados
vapply(flags, class, character(1))  ## O argumento 'caractere (1)' diz a R que esperamos que a função de classe retorne um vetor de caracteres de comprimento 1 quando aplicado a CADA coluna do conjunto de dados flags
?tapply
table(flags$landmass)  ## Visualizar quantas bandeiras/países caem em cada grupo
table(flags$animate)  ## Visualizar quantas bandeiras contém uma imagem animadas, leva o valor 1 se a bandeira de um país contiver uma imagem animada e 0 se não
tapply(flags$animate, flags$landmass, mean)  ## média de cada grupo que contém bandeiras animadas
tapply(flags$population, flags$red, summary)  ## Resumo dos valores populacionais dos países com ou sem a cor vermelha na bandeira 
tapply(flags$population, flags$landmass, summary)  ## Resumo das populações para cada uma das seis massas de terra - landmass

### Semana 4 - swirl Lesson 1: Looking at Data
library(swirl)
swirl()
ls()
class(plants)  ## Saber a classe da minha variável
## Por ser um data.frame eu sei que tem duas dimensões - linha e colunas
dim(plants)  ## primeiro resultado são as linhas(observações), segundo colunas (variáveis)
nrow(plants)  ## mais um comando para saber o número de linhas
ncol(plants)  ## comando para saber número de colunas
object.size(plants)  ## Para saber o espaço que o conjunto de dados está ocupando na memória
names(plants)  ## retornarão um vetor de caracteres de coluna (ou seja, nomes de variáveis)
head(plants)  ## permite que visualizar o topo do conjunto de dados - 6 primeiras linhas
head(plants, 10)  ## p/ ver mais do que 6l (padrão) basta indicar a quantidade
tail(plants, 15)  ## p/ visualizar o final do conjunto de dados, as 15 últimas linhas
## NAs são marcadores de posição de R para valores ausentes
summary(plants)  ## Permite ter uma ideia melhor de como cada variável é distribuída e quanto do conjunto de dados está faltando
## summary () fornece saída diferente para cada variável, dependendo de sua classe
table(plants$Active_Growth_Period)  ## Ver quantas vezes cada valor ocorre
str(plants)  ## É o melhor para ver estrutura dos dados


### Semana 4 - swrl Lesson 2: Simulation

sample()  ## obter números aleatórios
?sample
sample(1:6, 4, replace = TRUE)  ## simular o lançamento de quatro dados de seis lados
## O comando de cima  instrui R a selecionar aleatoriamente quatro números entre 1 e 6, COM substituição. 
## Amostragem com substituição permite que um número apareça mais de uma vez
## Posso repetir o comando anterior e não encontrarei o mesmo resultado
sample(1:20, 10)  ## 10 números entre 1 e 20, SEM substituição.
LETTERS  ## É uma variável pré-definida, contendo todas as letras do alfabeto
sample(LETTERS)  ## Vai desorganizar as letras
flips <- sample(c(0,1), 100, replace = TRUE, prob = c(0.3, 0.7))
flips
sum(flips)  ## Irá somar todos 0 e 1, resultando em 70, que é a quantidade de cara
## O e 1 é resultado binário, simula um binômio aleatório variável
?rbinom
rbinom(1, size = 100, prob = 0.7)  ## variável aleatória binomial representa o número de 'sucessos' (cara) em um determinado número de 'tentativas' independentes (cara ou coroa)
flips2 <- rbinom(n = 100, size = 1, prob = 0.7)
flips2
sum(flips2)  ## Irá somar todos 0 e 1, o resultado será a quantidade de cara
### rnorm - simula números aleatórios de uma distribuição normal padrão
?rnorm  ## mean - 0    sd - 1
rnorm(10)
rnorm(10, mean = 100, sd = 25)  ## Quero 10 números de uma média de 100 e desvio 25
?rpois
rpois(5, 10)  ## Gerar 5 valores aleatórios de uma distribuição de Poisson com média 10
my_pois <- replicate(100, rpois(5,10))  ## para realizar esta operação 100 vezes
my_pois ## replicate () criou uma matriz, cada coluna contendo 5 números aleatórios gerado a partir de uma distribuição de Poisson com média 
cm <- colMeans(my_pois)  ## Encontrar a média de cada coluna
hist(cm)  ## histograma
### Todas as distribuições de probabilidade padrão são construídas em R
### exponential (rexp()), chi-squared (rchisq()), gamma (rgamma())



###  swirl Lesson 3: Base Graphics

library(swirl)
swirl()
ls()  ## p/ visualizar o que tenho no meu ambiente
rm(list = ls())  ## p/ limpar o meu ambiente de trabalho
data(cars)
?cars  ## Abrir pag de ajuda para cars
head(cars)  ## Antes de plotar é bom ter uma noção dos dados
## Pode usar tbm dim(), names(), head(), tail() and summary()
plot(cars)  ## Plotar, criar um grafico de dispersão do cars
?plot  ## pag de ajuda do plot
plot(x = cars$speed, y = cars$dist)  ## para usar como os argumentos no eixo x e y
plot(x = cars$dist, y = cars$speed)  ## igual o ex de cima, só mudou a ordem dos eixos
## Faz mais sentido o eixo x ser nomeado por speed
plot(x = cars$speed, y = cars$dist, xlab = "Speed")
plot(x = cars$speed, y = cars$dist, ylab = "Stopping Distance")
## Para mudar o nome de x e y, deve usar xlab e ylab
plot(x = cars$speed, y = cars$dist, xlab = "Speed", ylab = "Stopping Distance")
plot(cars, main = "My Plot")  ## Para colocar titulo no Plot
plot(cars, sub = "My Plot Subtitle")  ## Para colocar subtítulo
plot(cars, col = 2)  ## Para mudar a cor dos pontos para vermelho
plot(cars, xlim = c(10, 15))  ## para limitar do eixo x de 10 a 15
plot(cars, pch = 2)  ## para mudar o símbolo de bolinha para triangulo
data(mtcars)  ## para carregar o dataframe mtcars
?boxplot  ## pedindo ajuda
## ("~") que indica a relação entre as variáveis de entrada
boxplot(formula = mpg ~cyl, data = mtcars)  ## P/ criar um grafico de caixas
hist(mtcars$mpg)  ## para criar histograma

