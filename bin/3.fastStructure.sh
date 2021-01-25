###!/bin/bash


#Script for run FastStructure

#1.Run phyton structure.py
#k 1-5
#prior= simple
python structure.py -K 1 --input=structure2 --format=str --full --seed=100 --output=k1
python structure.py -K 2 --input=structure2 --format=str --full --seed=100 --output=k2
python structure.py -K 3 --input=structure2 --format=str --full --seed=100 --output=k3
python structure.py -K 4 --input=structure2 --format=str --full --seed=100 --output=k4
python structure.py -K 5 --input=structure2 --format=str --full --seed=100 --output=k5


#For each one  k, 5 output .log,.meanP, .meanQ, .varP, varQ. 

#2. Choose K for the best model
python chooseK.py --input=k*

#Model complexity that maximizes marginal likelihood = 2
#Model components used to explain structure in data = 1



#3.After I run files with logistic
#1.Run phyton structure.py
#k 1-5
#prior= simple
python structure.py -K 1 --input=structure2 --format=str --prior=logistic --full --seed=100 --output=log_k1
python structure.py -K 2 --input=structure2 --format=str --prior=logistic --full --seed=100 --output=log_k2
python structure.py -K 3 --input=structure2 --format=str --prior=logistic --full --seed=100 --output=log_k3
python structure.py -K 4 --input=structure2 --format=str --prior=logistic --full --seed=100 --output=log_k4
python structure.py -K 5 --input=structure2 --format=str --prior=logistic --full --seed=100 --output=log_k5




#4. Choose K for the best model for log

python chooseK.py --input=../out/log_*


#data plot k values
 #python distruct.py -K 1 --input=../output/k1 --output=../figures/k1_simple_distruct.svg


