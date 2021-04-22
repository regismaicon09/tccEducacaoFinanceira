*****************************************************************************************************************************************************
*************************************************************** ABRIR O ARQUIVO *********************************************************************

clear
use "C:\Users\Regis\Documents\GitHub\tccEducacaoFinanceira\2_Teste de Diferenca Medias\base1.dta"





*1)Tratando a normalidade da variável 


ladder AFM //traz as diversas alternativas para transformação da variável --> pega a de menor qui2
gladder AFM //demonstra em gráficos qual seria a melhor maneira de corrigir a normalidade dos dados --> manter a variável

gen sAFM = sqrt(AFM)

histogram AFM, norm 
kdensity AFM, norm 

histogram sAFM, norm 
kdensity sAFM, norm 

*2)winsorização (técnica para tratar os outliers).
graph box sAFM //muitos outliers *Comentário teórico: O boxplot mostra os outliers.
**  winsorização não apresentou melhoras significativa

tabstat sAFM, s(count min max mean sd cv sk p1 p5 p10 p25 p50 p75 p90 p95 p99)



ladder CFM 
gladder CFM 

histogram CFM, norm 
kdensity CFM, norm 
graph box CFM



swilk  sAFM CFM
sktest sAFM CFM, noadjust



** referencia interessante para o teste de curtose e assimetria
*** https://www.researchgate.net/publication/314032599_TO_DETERMINE_SKEWNESS_MEAN_AND_DEVIATION_WITH_A_NEW_APPROACH_ON_CONTINUOUS_DATA
**https://repositorio.bc.ufg.br/bitstream/ri/11372/5/TCCG%20-%20Ci%C3%AAncias%20Cont%C3%A1beis%20-%20Leandro%20Bernardino.pdf


****** TESTE t ***** 
ttest sAFM, by(Genero)
ttest CFM, by(Genero)

****** TESTE ANOVA ***** 
*Não há diferença de média significante entre os grupos

graph box sAFM, over(Renda)
oneway sAFM Renda

oneway sAFM EscolMae 
graph box sAFM, over(EscolMae) 
*sg 5%

oneway sAFM EscolPai
graph box sAFM, over(EscolPai) 
*sg 5%

graph box sAFM, over(Idade)
oneway sAFM Idade



graph box CFM, over(Renda)
oneway CFM Renda
oneway CFM EscolMae
oneway CFM EscolPai
oneway CFM Idade 
*sg 10%







