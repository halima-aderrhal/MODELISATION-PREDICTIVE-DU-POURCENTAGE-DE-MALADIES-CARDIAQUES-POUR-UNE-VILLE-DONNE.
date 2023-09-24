
#chargement des librairies 
rm(list=ls())

library(faraway)
library(carData)
library(car)
library(zoo)
library(ggplot2)
#rechargement des donnees 
library(readr)
heart_data <- read_delim("MODELISATION-PREDICTIVE-DU-POURCENTAGE-DE-MALADIES-CARDIAQUES-POUR-UNE-VILLE-DONNE.-main/heart.data.csv", 
                         delim = ";", escape_double = FALSE, trim_ws = TRUE)
View(heart_data)


#affichage des 6 premiers lignes  
head(heart_data)

#correlation entre biking et smooking 
cor(heart_data$biking, heart_data$smoking)


#plot(heart_disease ~ biking, data=heart_data)
#plot(heart_disease ~ smoking, data=heart_data)

##histogrammes des variables
hist(heart_data$biking)
hist(heart_data$smoking )
hist(heart_data$heart_disease)

##summary
summary(heart_data)

##dessin du graph du modele
plot(heart_data)

## Reression avec tous les variables

lm=lm(heart_disease ~ biking+ smoking ,data=heart_data)
summary(lm)


coef(lm)
confint(lm)
fitted(lm)
resid(lm)

res<-resid(lm)
plot(res,main="Residus")
abline(h=0,col="red")

## residus vs. valeurs predites
plot(lm,1)

## Prediction
p <-predict(lm, newdata=data.frame(biking=30.3881837436929 ,smoking=16.9860863648355 ),se.fit=TRUE, interval = "prediction", level = 0.95)
 print(p)      
## ou bien
a_prevoir <- data.frame(biking=30.3881837436929 ,smoking=16.9860863648355 )
prev <- predict(lm,a_prevoir)
round(prev, digits=2)


## analyse des donnes influentes
## Points levier
## =============
alpha <- 0.05
n <- dim(heart_data)[1]
print(n)
p <-2 # Dernier modele : lm
analyses <- data.frame(obs=1:n)
analyses$levier <- hat(model.matrix(lm))
seuil_levier <- 2*p/n
print(analyses$levier)


# Visualisation des leviers
ggplot(data=analyses,aes(x=obs,y=levier))+
  geom_bar(stat="identity",fill="steelblue")+
  geom_hline(yintercept=seuil_levier,col="red")+
  theme_minimal()+
  xlab("Observation")+
  ylab("Leviers")+
  scale_x_continuous(breaks=seq(0,n,by=5))

# Selectionner les points leviers
idl <- analyses$levier>seuil_levier
idl
analyses$levier[idl]
which(idl == TRUE)

##########################################################
## La distance de Cook (leviers)
influence <- influence.measures(lm)
names(influence)
colnames(influence$infmat)
analyses$dcook <- influence$infmat[,"cook.d"]  
seuil_dcook <- 4/(n-p)  # Le seuil de la distance de Cook est de 4/(n-p) 


# Visualisation de la distance de cook
ggplot(data=analyses,aes(x=obs,y=dcook))+
  geom_bar(stat="identity",fill="steelblue")+
  geom_hline(yintercept=seuil_dcook,col="red")+
  theme_minimal()+
  xlab("Observation")+
  ylab("Distance de cook")+
  scale_x_continuous(breaks=seq(0,n,by=5))

# Selectionner des points
idl <- analyses$dcook>seuil_dcook
idl
analyses$dcook[idl]
which(idl == TRUE)
analyses[idl,]

#residuals vs Leverage
plot(lm,5)

######Creation de la nouvelle dataset nettoyee:
sans = heart_data[-(which(analyses$dcook>seuil_dcook)),] 
dimsans=dim(sans)[1]
print(dimsans)

###Effectuer l’analyse de régression linéaire sur la nouvelle dataset:
reg=lm(heart_disease ~ biking+ smoking,data=sans)
summary(reg)


#commparons les coefficients pour les deux regression 
coef(lm)
coef(reg)


#les graphes pour la derniere  regression 
plot(reg)

##verification des hypotheses
plot(reg,1)


# Par autocorrélogramme 
acf(residuals(reg) ,main="Autocorrélogramme des résidus")
# Normalité des résidus
# ---------------------
# Par QQPlot
#windows()-
plot(reg,2)# 2 type de graphe 2
#Par test de Shapiro
shapiro.test(residuals(reg))## Normalité acceptée

# Constance de la variance des résidus (homogénéité des résidus)
# --------------------------------------------------------------
# Par la graphe résidus vs valeurs ajustées
plot(reg, 3)# 3 type de graphe 3

plot(reg,2)

#### studentized Breusch-Pagan test
library(zoo)
library(lmtest)
bptest(reg)

## test de DurbinWatson 
durbinWatsonTest(reg)

##test de multicolinearite
vif(reg)


