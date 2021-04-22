library(readxl)
library(plyr)
library(dplyr)
library(tidyr)
library(agricolae)
library(factoextra)
library(psych)

df = read_excel("/Users/maicon/Dropbox/Edvalda/analises/renda_math_non.xlsx")



##############################
###### RENDA X FLSCORE_C100 ######
##############################

# Criando faixa renda
df$renda_faixa =    ifelse(df$renda_c == 1, "Até 1 SM",
ifelse(df$renda_c >= 2 & df$renda_c <= 2.9, "de 1 a 2 SM",
ifelse(df$renda_c >= 3 & df$renda_c <= 3.9, "de 2 a 4 SM",
ifelse(df$renda_c >= 4 & df$renda_c <= 4.9, "de 4 a 6 SM","Acima 8 SM"))))


# Faixa Renda (SIGNIFICATIVO)
table(df$renda_faixa)

kruskal(df$FLSCORE_C100,df$renda_faixa,p.adj = "bonferroni", console=TRUE)


##############################
###### RENDA X FLSCORE_C100 ######
##############################

kruskal(df$FLSCORE_C_RCM,df$renda_faixa,p.adj = "bonferroni", console=TRUE)

kruskal(df$FLSCORE_C_NRCM,df$renda_faixa,p.adj = "bonferroni", console=TRUE)



##############################
###### ESCOLA ######
##############################


df2 = read_excel("/Users/maicon/Dropbox/Edvalda/analises/renda_3.xlsx")


df2$escola_faixa =    ifelse(df2$escola == 1, "Bueno Brandão",
ifelse(df2$escola >= 2 & df2$escola <= 2.9, "E.E. Sergio de Freitas Pacheco",
ifelse(df2$escola >= 3 & df2$escola <= 3.9, "EE Alda Mota Batista",
ifelse(df2$escola >= 4 & df2$escola <= 4.9, "EE Americo René Gianetti",

ifelse(df2$escola >= 5 & df2$escola <= 5.9, "EE do Parque São Jorge",
ifelse(df2$escola >= 6 & df2$escola <= 6.9, "EE Teotônio Vilela",
ifelse(df2$escola >= 7 & df2$escola <= 7.9, "Guiomar de Freitas",
ifelse(df2$escola >= 8 & df2$escola <= 8.9, "Segismundo Pereira", "Sergio de Freitas Pacheco"))))))))



# ESCOLA (SIGNIFICATIVO)
table(df2$escola_faixa)
kruskal(df2$rcm,df2$escola_faixa,p.adj = "bonferroni", console=TRUE)

kruskal(df2$nrcm,df2$escola_faixa,p.adj = "bonferroni", console=TRUE)





























