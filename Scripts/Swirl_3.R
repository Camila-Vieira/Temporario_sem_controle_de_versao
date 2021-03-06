### swirl Lesson 4: Vectors

install.packages("swirl")
library(swirl)
ls() ## Para visualizar os objetos que tenho no Environment
rm(list=ls()) ## Para limpar meu Environment
swirl()
c(0.5, 55, -10, 6) ## Criar um vetor numérico, o c é usado para criar um vetor
num_vect <- c(0.5, 55, -10, 6) ## Atribui o que está do lado direito a variável num_vect 
tf <- num_vect < 1 ## Cria a variável tf que obtém o valor da num_vect menor que 1 
tf ## Autoimprime
num_vect >= 6 ## Mostra uma resposta lógica para cada elemento do objeto num_vect
c("My", "name", "is")
my_char <- c("My", "name", "is") ## Cria um vetor caracter de cumprimento 3
my_char ## Autoimprime
paste(my_char, collapse = " ") ## Junta os objetos dentro do my_char e forma uma frase, o collapse fala para o R que deve ter espaço entre as palavras
my_name <- c(my_char, "Camila_Alcione_Vieira")
my_name
paste(my_name, collapse = " ")
paste("Hello", "world!", sep = " ")  ## Sep " " diz para o R que queremos separar as palavras com um único espaço
paste(1:3, c("X", "Y", "Z"), sep = "") ## Juntas dois vetores de cumprimento 3, um num. e o outro char, o sep "" foi usado para não ter espaço 
paste(LETTERS, 1:4, sep = "-")

### swirl Lesson 5: Missing Values
## Quando houver valores NAs não deve ignorá-los, deve ser cuidadosamente estudados p/ ver se há um padrão ou causa subjacente da ausencia deles
library(swirl)  ## carregar o pacote swirl
ls()  ## Ver as variável que tenho no meu environment
rm(list = ls())  ## Limapar as variáveis do meu environment
swirl() ## Iniciando o swirl
x <- c(44, NA, 5, NA)  ## A variável x obtém estes valores, veremos que qualquer operação envolvendo NA geralmente produz NA como resultado
## NA são dados ausentes
x * 3
y <- rnorm(1000)  ## Criar um vetor contendo 1000, foi extraído de uma distribuição normal
?rnorm
z <- rep(NA, 1000) ## Replica os valores em x (NA) na quantidade do próximo número (1000)
?rep
my_data <- sample(c(y,z), 100) ## Seleciona 100 elementos aleatoriamente das variáveis y e z
?sample  ## sample obtém uma amostra do tamanho especificado em  x (100)
my_na <- is.na(my_data)  ## A função is.na nos dará uma resposta dizendo se cada elemento do vetor é um NA (TRUE, FALSE), e as respostas serão atribuídas a my_na
my_na ## Para vizualizar os dados
my_data == NA  ## o operador == corresponde a teste de igualdade, irei receber todos os NAs pq, NAs não é um valor e sim um espaço reservado para uma quantidade que não está disponível
sum(my_na) ## A função sum fará a contagem de quantos NAs estão presentes na variável my_na
my_data ## Vizualizar os dados
## NaN é também um tipo de valor ausente, mas significa não numérico
0/0 ## Irá gerar um valor NaN 
Inf - Inf  ## Inf significa infinito

### swirl Lesson 6: Subsetting Vectors 
## Nesta lição, iremos ver como extrair elementos de um vetor com base em condições que especificamos 
x ## Variável criada pelo curso automaticamente, contém uma ordem aleatória de 20 elementos de uma distribuição normal e 20 NAs
## Para oter um subconjunto (elementos específicos) de um vetor é colocando 'index vector' dentro do colchete imediatamente após o nome do vetor
x[1:10] ## O subconjunto que quero é o do 1 até o 10, então coloquei entre []
## Vetores de índices: vetores logical, vetores de integers positivos, vetores de intergers negativos e vetores de strings character
## is.na() nos diz onde os NAs estao, com valores TRUE (pra quando é um NA) e FALSE
x[is.na(x)] ## Me dará todos os NA
## ! nos dá a negação de uma expressão lógica
y <- x[!is.na(x)]  ## !is.na(x) pode ser lido como não é NA, me dará todos os valores que não são NA
y ## y agora é uma variável com todos os valores não ausentes do x
y > 0 ## É uma expressão lógica (TRUE, FALSE), TRUE indicará todos os elementos positivos maiores que zero
y[y > 0] ## Verei apenas os elementos positivos, aqui estou indexando vetor, indicando entre [] apenas o subconjunto que eu quero
x[x > 0] ## Aqui não funciona como o exemplo anterior, pois NA não é um valor e sim um espaço reservado para uma quantidade desconhecida e então temos um tanto de NA misturados com nossos valores positivos
x[!is.na(x) & x > 0] ## Quero todos os valores de x que não são NA e que são maiores que 0
## R usa o 'one-based indexing', ou seja, usa a indexação baseada em 1, isso significa que o primeiro elemento de um vetor é considerado o elemento 1 
x[c(3, 5, 7)] ## Quero apenas o subconjunto do x, quero o terceiro, o quinto e o sétimo elemento, para isso preciso usar o c()
x[0] ## Quero o elemento 0 da variável x, mas o 0 não é um elemento definido no R, olhe as duas linhas anteriores
x[3000] ## Quero o elemento da variável x que ocupa o lugar 3000º, receberei valor NA, pois só tenho 40 objetos dentro do x
## x[c(2, 10)] me dá apenas os elementos que ocupam a posição 2 e a 10, x[c(-2, -10)] me dá todos os elementos, menos os elementos que ocupam a posição 2 e 10
x[c(-2, -10)] ## Receberei todos os elementos, exceto os que ocupam a posição 2 e 10
x[-c(2, 10)] ## Receberei o mesmo resultado da linha anterior, mas esta é uma forma de colocar o operador -, na frente do c e depois os numeros que se seguem vem de forma positiva
vect <- c(foo = 11, bar = 2, norf = NA) ## Criar um vetor numérico com três elementos nomeados
vect
names(vect) ## Para obter os nomes dos elementos da variável vect
vect2 <- c(11, 2, NA) ## Criar um vetor sem nomear os elementos
names(vect2) <- c("foo", "bar", "norf") ## Nomeando os elementos do vetor vect2
identical(vect, vect2) ## Ver se os vetores vect e vect2 são identicos
vect["bar"] ## Quero o elemento nomeado por "bar"
vect[c("foo", "bar")] ## Quero esses elementos que especifiquei 

library(swirl)
swirl()
Camila
1

###  swirl Lesson 7: Matrices and Data Frames
my_vector <- 1:20  ## Cria um vetor de n�mero 1 at� o 20 armazenado na vari�vel "my_vector"
my_vector
dim(my_vector)  ## Tira as dimens�es do vetor, como n�o tem atributos, vai ser nulo
length(my_vector)  ## Para saber qual o comprimento do "my_vector"
## A fun��o dim () permite q eu obtenha OU defina o atributo `dim` para um objeto R. 
dim(my_vector) <- c(4,5)  ## Atribu�mos o valor c (4, 5) ao atributo `dim` de my_vector
dim(my_vector) ## Autoimprime no console
attributes(my_vector)  ## Faz o mesmo que o dim, temos o 4 como linhas e o 5 como colunas
View(my_vector) ## Para ver em outra aba a vari�vel my_vector
my_vector ## Aqui mostra no console 
class(my_vector)  ## Permite confirmar se agora o que era um vetor, virou uma matrix
my_matrix <- my_vector  ## Aqui estou nomeando o que era o my_vector como my_matrix
?matrix ## Ler sobre matrix
my_matrix2 <- matrix(c(1:20), nrow = 4, ncol = 5) ## Cria uma matrix
identical(my_matrix, my_matrix2)  ## Dir� se s�o iguais 
patients <- c("Bill", "Gina", "Kelly", "Sean")
cbind(patients, my_matrix)  ## A fun��o cbind combina as colunas, vamos perceber que a matrix que era num�rica ao juntar com a vari�vel character, ela virou tbm. 
## Lembrete - matrix s� pode conter uma classe de dados; nu�mrica, logica, character
my_data <- data.frame(patients, my_matrix) ## Incluir os nomes dos pacientes na tabela sem destruir a integridade dos nossos dados num�ricos
my_data
## data.frame() permite armazenar vetor de caracter de nome ao lado da matriz de n�meros
class(my_data) ## Permite saber ou confirmar a qual tipo de classe o meu objeto pertence
cnames <- c("patient", "age", "weight", "bp", "rating", "test") ## Criando uma vari�vel com nome
colnames(my_data) <- cnames ## Atribuindo as colunas de nomes 
my_data


### swirl 8 Logic

library(swirl)
swirl()
Camila
## == testa se dois valores ou n�meros booleanos s�o iguais
TRUE == TRUE ## Operador de == (igualdade) para saber se s�o iguais
(FALSE == TRUE) == FALSE ## Express�es l�gicas podem ser usadas entre (), como se fosse express�o aritm�trica, resolve o que est� entre () e depois as outras
6 == 7  ## Pode ser usado para comparar n�meros
6 < 7 ## Operador de maior ou menor
10 <= 10 ## Operador menor ou igual
## o operador diferente de `!=` testa se dois valores booleanos ou n�meros s�o desiguais
5 != 7  ## Operador != diferente de, avalia se s�o desiguais
## O operador '!' na frente do n�mero nega as express�es, para que as TRUE se tornem FALSE e as FALSE se tornem TRUE
!5 == 7 

## Tem dois Operadores e, '&', '&&'
FALSE & FALSE
TRUE & c(TRUE, FALSE, FALSE)  ## O operador TRUE o avalia em todo o vetor. Aqui vai funcionar como se tivesse mais 2 TRUE do lado esquerdo, c(TRUE, TRUE, TRUE) & c(TRUE, FALSE, FALSE)
TRUE && c(TRUE, FALSE, FALSE)  ## O operando esquerdo s� � avaliado com o primeiro membro do operando � direita (o vetor).

## Operador ou, |OR (avalia OR em todo um vetor), ||OR (avalia apenas o primeiro membro de um vetor)
TRUE | c(TRUE, FALSE, FALSE)  ## Uma express�o usando o operador OR ser� avaliada como TRUE se o operando esquerdo ou o operando certo � TRUE. Se ambos forem TRUE, a express�o ser� avaliada como TRUE, no entanto, se nenhum for TRUE, a express�o ser� FALSE.
TRUE || c(TRUE, FALSE, FALSE)
## Todos os 'e' s�o avaliados antes dos 'ou', resolva primeiro os 'e' e depois os 'ou'
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

isTRUE (6 > 4) ## A fun��o isTRUE () leva um argumento. Se esse argumento for avaliado como TRUE, o a fun��o retornar� TRUE. Caso contr�rio, a fun��o retornar� FALSE
identical('twins', 'twins') ## Retornar� TRUE se os dois elementos forem iguais
xor(5 == 6, !FALSE)  ## A fun��o xor () significa OR exclusivo. Se um argumento for avaliado como TRUE e um argumento for avaliado como FALSO, ent�o esta fun��o retornar� VERDADEIRO, caso contr�rio, retornar� FALSO.
## Se for dois TRUE a fun��o retornar� FALSE
ints <- sample(10)  ## Criar vetor de n�meros aleat�rios at� o 10
ints ## Exibir o conte�do
ints > 5 ## Resultar� em repostas l�gicas para cada elemento do ints se � menor que 5
which(ints > 7) ## PAra procurar os elementos de ints maiores que 7
## any() retornar� TRUE se um ou mais dos elementos no vetor l�gico for TRUE. 
## all() retornar� TRUE se cada elemento no vetor l�gico � TRUE.

any(ints < 0)  ## ver se algum dos elementos de ints � menor que zero
all(ints > 0)  ## ver se todos os elementos de ints s�o maiores que zero


### swirl Lesson 2: Functions - Fun��es retornam um valor
## Fun��es geralmente s�o caracterizadas pelo nome da fun��o seguido por par�ntese
Sys.Date()  ## retorna uma string que representa a data de hoje
mean(c(2, 4, 5)) ## mean retorna a m�dia dos argumentos dentro dos ()
boring_function('My first function!')
boring_function  ## Para ver o c�digo fonte de uma fun��o, basta digitar o nome dela sem os ()
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
d1 <- Sys.Date()  ## Armazenar a data na vari�vel d1
class(d1)  ## Para confirmar se d1 � um objeto Date
unclass(d1)  ## Para ver como d1 funciona internamente, o n�mero que sair� como resultado representar� a contagem de dias deste 01/01/1970
d1 ## Ao imprimir, receberei a data, ano, m�s e dia de hoje
d2 <- as.Date("1969-01-01")  ## Fazer referencia a data antes de 1970
unclass(d2)  ## Aparecer� dias negativos, indicandos quantos dias antes de 1970
t1 <- Sys.time()  ## Data e hora atual (hora, minuto, segundos - POSIXct)
t1
class(t1)
unclass(t1)  ## Quantidade de segundos deste 1970
t2 <- as.POSIXlt(Sys.time())
class(t2)
t2  ## O resultado ser� identico ao t1
unclass(t2)  ## Todos os POSIXlt aparecer� uma lista de valores da data e tempo
str(unclass(t2))  ## Para ter uma vis�o mais compacta dos valores
t2$min  ## Para ver apenas o valor de min da vari�vel t2
weekdays(d1)  ## retornar� o dia da semana do objeto d1 (data ou hora)
months(t1)  ## retornar� o mes do objeto t1 POSIXct que cont�m a hora atual (bem, era a hora atual quando eu o criou).
quarters(t2)  ## retorna o trimestre do ano (Q1-Q4) a partir de qualquer data ou objeto de tempo, t2 � o objeto POSIXlt que cont�m a hora em que eu o criou.
## Datas e horas em um conjunto de dados podem estar em um formato que R n�o reconhece. A fun��o strptime () pode ser �til nessa situa��o.
## strptime () converte vetores de caracteres em POSIXlt. Nesse sentido, � semelhante a as.POSIXlt (), exceto que a entrada n�o precisa estar em um formato espec�fico (AAAA-MM-DD).
t3 <- "October 17, 1986 08:24"
t4 <- strptime(t3, "%B %d, %Y %H:%M")  ## para ajudar R a converter nosso objeto de data / hora em um formato que ele entenda.
t4  ## Imprimir o conte�do da vari�vel
class(t4)  ## Verificar a classe da vari�vel
### Posso realizar em datas e horas opera��es aritm�ticas (+ e -) e compara��es (<, ==, 

Sys.time() > t1  ## t1 cont�m a data que eu o criei, a sys.time de agora � maior que t1
Sys.time() - t1  ## Para saber a hora atual menos a hora que criei a t1
### Se eu quiser mais controle sobre as unidades ao encontrar a diferen�a de tempo acima, posso usar difftime (), que permite que eu especifique um par�metro de 'unidades'
difftime(Sys.time(), t1, units = 'days')  ## para encontrar a quantidade de tempo em DAYS que passou desde que eu criei t1.

###  swirl Lesson 1: Os dois recebem uma lista -  lapply (sempre retorna lista) and sapply (tenta simplicar em vetor, mas as vezes n�o consegue)
library(swirl)
swirl()
head(flags)  ##  para visualizar as primeiras seis linhas do conjunto de dados flags
dim(flags)  ## para visualizar as dimens�es do conjunto de dados flags, o primeiro valor(194) ser� a quantidade de linhas ou observa��es e o segundo (30) ser� as colunas ou vari�veis.
viewinfo(flags)  ## Para abrir uma descri��o mais completa do conjunto de dados em um arquivo de texto separado
class(flags) ## Para ver qual � a classe
## A fun��o lapply () recebe uma lista como entrada, aplica uma fun��o a cada elemento da lista e retorna uma lista do mesmo comprimento da origina
cls_list <- lapply(flags, class)  ## Usei o lapply para aplicar a fun��o class a cada coluna do conjunto de dados para saber a classe de cada coluna
cls_list  ## vetor de caracteres
## o l em lapply significa lista
class(cls_list)  ## Retornar uma lista
## As listas s�o mais �teis para armazenar v�rias classes de dados. 
as.character(cls_list)
## sapply () permite automatizar esse processo chamando lapply (), s de simplificar
cls_vect <- sapply(flags, class)  ## Semelhante ao lapply, aqui fornecerar tipo caracter
?sapply
args(sapply)
class(cls_vect)
sum(flags$orange)  ## Quero que some todos os pa�ses em que a bandeira tenha a cor laranja
## Apenas nas colunas 11 a 17 que cont�m as cores
flag_colors <- flags[, 11: 17] ## A virgula antes do subconjunto  diz a R que quero todas as linhas, mas apenas as colunas de 11 a 17.)
head(flag_colors)  ## Para ver as 6 primeiras linhas 
lapply(flag_colors, sum)  ## Para somar os dados de flag_colors, o primeiro argumento � o flag_colors e o segundo � a fun��o sum sem ()
## O resultado � uma lista j� que lapply sempre retorna uma lista
## Sapply () nos exemplos acima foi capaz de simplificar o resultado para vetor. Isso ocorre porque cada elemento da lista retornado por lapply () era um vetor de comprimento um.
## quando cada elemento da lista retornada por lapply () � um vetor do mesmo comprimento (> 1), sapply () retorna uma matriz 
sapply(flag_colors, sum)  ## para retornar um vetor de somas de coluna
sapply(flag_colors, mean) ## para aplicar a m�dia em cada coluna da flag_colors
flag_shapes <- flags[, 19:23]  ## Quero todas as linhas do subconjuntos 19 a 23 colunas
lapply(flag_shapes, range)  ## Para saber o m�n e o m�x de cada coluna
shape_mat <- sapply(flag_shapes, range)
shape_mat
class(shape_mat)  ## Foi maior que 1 por isso � matrix
unique(c(3, 4, 5, 5, 5, 6, 6))  ## retorna um vetor de apenas com os elementos '�nicos', exclui os duplicados 
unique_vals <- lapply(flags, unique)
unique_vals
sapply(unique_vals, length)  ## retorna a altura de cada elemento da lista unique_vals
sapply(flags, unique) ## retorna uma lista n�o simplificada
### Exemplo de minha fun��o anonima usada com a fun��o lapply, podem ser muito �teis quando uma das fun��es integradas de R n�o � uma op��o.
lapply(unique_vals, function(elem) elem[2])  ## retornar� uma lista contendo o segundo item de cada elemento da lista unique_vals. 
## nossa fun��o recebe um argumento, elem, que � apenas uma 'vari�vel fict�cia' que assume o valor de cada elemento de unique_vals, por sua vez.


### swirl Lesson 2: vapply and tapply

dim(flags)
head(flags)
str(flags)
summary(flags)
viewinfo(flags)
sapply(flags, unique)  ## retorna uma lista contendo um vetor de valores exclusivos para cada coluna do conjunto de dados do flags
## vapply () permite que eu especifique explicitamente. Se o resultado n�o corresponder ao formato que eu especificar, vapply () lan�ar� um erro, fazendo com que a opera��o pare. 
vapply(flags, unique, numeric(1))  ## Vou obter uma msg de erro, digite ok()
ok()
sapply(flags, class)  ## Na li��o anterior, retornava um vetor de caracteres contendo a classe de cada coluna no conjunto de dados
vapply(flags, class, character(1))  ## O argumento 'caractere (1)' diz a R que esperamos que a fun��o de classe retorne um vetor de caracteres de comprimento 1 quando aplicado a CADA coluna do conjunto de dados flags
?tapply
table(flags$landmass)  ## Visualizar quantas bandeiras/pa�ses caem em cada grupo
table(flags$animate)  ## Visualizar quantas bandeiras cont�m uma imagem animadas, leva o valor 1 se a bandeira de um pa�s contiver uma imagem animada e 0 se n�o
tapply(flags$animate, flags$landmass, mean)  ## m�dia de cada grupo que cont�m bandeiras animadas
tapply(flags$population, flags$red, summary)  ## Resumo dos valores populacionais dos pa�ses com ou sem a cor vermelha na bandeira 
tapply(flags$population, flags$landmass, summary)  ## Resumo das popula��es para cada uma das seis massas de terra - landmass

### Semana 4 - swirl Lesson 1: Looking at Data
library(swirl)
swirl()
ls()
class(plants)  ## Saber a classe da minha vari�vel
## Por ser um data.frame eu sei que tem duas dimens�es - linha e colunas
dim(plants)  ## primeiro resultado s�o as linhas(observa��es), segundo colunas (vari�veis)
nrow(plants)  ## mais um comando para saber o n�mero de linhas
ncol(plants)  ## comando para saber n�mero de colunas
object.size(plants)  ## Para saber o espa�o que o conjunto de dados est� ocupando na mem�ria
names(plants)  ## retornar�o um vetor de caracteres de coluna (ou seja, nomes de vari�veis)
head(plants)  ## permite que visualizar o topo do conjunto de dados - 6 primeiras linhas
head(plants, 10)  ## p/ ver mais do que 6l (padr�o) basta indicar a quantidade
tail(plants, 15)  ## p/ visualizar o final do conjunto de dados, as 15 �ltimas linhas
## NAs s�o marcadores de posi��o de R para valores ausentes
summary(plants)  ## Permite ter uma ideia melhor de como cada vari�vel � distribu�da e quanto do conjunto de dados est� faltando
## summary () fornece sa�da diferente para cada vari�vel, dependendo de sua classe
table(plants$Active_Growth_Period)  ## Ver quantas vezes cada valor ocorre
str(plants)  ## � o melhor para ver estrutura dos dados


### Semana 4 - swrl Lesson 2: Simulation

sample()  ## obter n�meros aleat�rios
?sample
sample(1:6, 4, replace = TRUE)  ## simular o lan�amento de quatro dados de seis lados
## O comando de cima  instrui R a selecionar aleatoriamente quatro n�meros entre 1 e 6, COM substitui��o. 
## Amostragem com substitui��o permite que um n�mero apare�a mais de uma vez
## Posso repetir o comando anterior e n�o encontrarei o mesmo resultado
sample(1:20, 10)  ## 10 n�meros entre 1 e 20, SEM substitui��o.
LETTERS  ## � uma vari�vel pr�-definida, contendo todas as letras do alfabeto
sample(LETTERS)  ## Vai desorganizar as letras
flips <- sample(c(0,1), 100, replace = TRUE, prob = c(0.3, 0.7))
flips
sum(flips)  ## Ir� somar todos 0 e 1, resultando em 70, que � a quantidade de cara
## O e 1 � resultado bin�rio, simula um bin�mio aleat�rio vari�vel
?rbinom
rbinom(1, size = 100, prob = 0.7)  ## vari�vel aleat�ria binomial representa o n�mero de 'sucessos' (cara) em um determinado n�mero de 'tentativas' independentes (cara ou coroa)
flips2 <- rbinom(n = 100, size = 1, prob = 0.7)
flips2
sum(flips2)  ## Ir� somar todos 0 e 1, o resultado ser� a quantidade de cara
### rnorm - simula n�meros aleat�rios de uma distribui��o normal padr�o
?rnorm  ## mean - 0    sd - 1
rnorm(10)
rnorm(10, mean = 100, sd = 25)  ## Quero 10 n�meros de uma m�dia de 100 e desvio 25
?rpois
rpois(5, 10)  ## Gerar 5 valores aleat�rios de uma distribui��o de Poisson com m�dia 10
my_pois <- replicate(100, rpois(5,10))  ## para realizar esta opera��o 100 vezes
my_pois ## replicate () criou uma matriz, cada coluna contendo 5 n�meros aleat�rios gerado a partir de uma distribui��o de Poisson com m�dia 
cm <- colMeans(my_pois)  ## Encontrar a m�dia de cada coluna
hist(cm)  ## histograma
### Todas as distribui��es de probabilidade padr�o s�o constru�das em R
### exponential (rexp()), chi-squared (rchisq()), gamma (rgamma())



###  swirl Lesson 3: Base Graphics

library(swirl)
swirl()
ls()  ## p/ visualizar o que tenho no meu ambiente
rm(list = ls())  ## p/ limpar o meu ambiente de trabalho
data(cars)
?cars  ## Abrir pag de ajuda para cars
head(cars)  ## Antes de plotar � bom ter uma no��o dos dados
## Pode usar tbm dim(), names(), head(), tail() and summary()
plot(cars)  ## Plotar, criar um grafico de dispers�o do cars
?plot  ## pag de ajuda do plot
plot(x = cars$speed, y = cars$dist)  ## para usar como os argumentos no eixo x e y
plot(x = cars$dist, y = cars$speed)  ## igual o ex de cima, s� mudou a ordem dos eixos
## Faz mais sentido o eixo x ser nomeado por speed
plot(x = cars$speed, y = cars$dist, xlab = "Speed")
plot(x = cars$speed, y = cars$dist, ylab = "Stopping Distance")
## Para mudar o nome de x e y, deve usar xlab e ylab
plot(x = cars$speed, y = cars$dist, xlab = "Speed", ylab = "Stopping Distance")
plot(cars, main = "My Plot")  ## Para colocar titulo no Plot
plot(cars, sub = "My Plot Subtitle")  ## Para colocar subt�tulo
plot(cars, col = 2)  ## Para mudar a cor dos pontos para vermelho
plot(cars, xlim = c(10, 15))  ## para limitar do eixo x de 10 a 15
plot(cars, pch = 2)  ## para mudar o s�mbolo de bolinha para triangulo
data(mtcars)  ## para carregar o dataframe mtcars
?boxplot  ## pedindo ajuda
## ("~") que indica a rela��o entre as vari�veis de entrada
boxplot(formula = mpg ~cyl, data = mtcars)  ## P/ criar um grafico de caixas
hist(mtcars$mpg)  ## para criar histograma

