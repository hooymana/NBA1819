rm(list=ls())

library(ggplot2)
setwd("C:/Users/Andrew/Documents/") #HOME COMPUTER
A=read.table(file="NBA1819_Advanced.txt",header = TRUE,sep = ",")
To=read.table(file="NBA1819_Totals.txt",header = T,sep = ",")

#Removes Duplicates
Adv = A[!duplicated(A$Rk),]
Tot = To[!duplicated(To$Rk),]


Adv=Adv[Adv$MP>330,]
Tot=Tot[Tot$MP>330,]

AT=merge(Adv,Tot)

ggplot(AT,aes(y=X3PAr,x=FTr,color=Pos))+
  geom_point(size=5,alpha = .7)+
  #theme_bw()+
  ylim(-0.01,.9)+
  xlim(-0.01,.9)+
  stat_smooth(method = "lm",formula = 'y~x',data=AT,aes(y=X3PAr,x=FTr),color='black',se=F)+
  ggtitle("NBA 18-19: 3 Point Rate versus Free Throw Rate")+
  xlab("Free Throw Rate")+
  guides(colour=guide_legend(title="Player \nPosition",face = "bold"),
         size=guide_legend(legend.position = 'none'))+
  theme(axis.text.x = element_text(face = "bold",size=10),axis.text.y=element_text(face = "bold",size=10),
        legend.text = element_text(size=10, face = "bold"),
        axis.title.x = element_text(face = "bold"),
        axis.title.y = element_text(face = "bold"),
        legend.title = element_text(face = "bold"))+
  ylab("3 Point Rate")+
  geom_label(aes(x = .733, y = .1, label = "Rudy Gobert"),show.legend = F,color='black')+
  geom_label(aes(x = .38, y = .9, label = "Anthony Tolliver"),show.legend = F,color='black')

