#!/bin/bash


#ESTE SCRIPT ES PARA CORRER EL SOFWARE fastStructure

#1.Correr phyton structure.py
#k 1-5
#prior= simple
python structure.py -K 1 --input=../data/bobos50 --format=str --full --seed=100 --output=../output/k1
python structure.py -K 2 --input=../data/bobos50 --format=str --full --seed=100 --output=../output/k2
python structure.py -K 3 --input=../data/bobos50 --format=str --full --seed=100 --output=../output/k3
python structure.py -K 4 --input=../data/bobos50 --format=str --full --seed=100 --output=../output/k4
python structure.py -K 5 --input=../data/bobos50 --format=str --full --seed=100 --output=../output/k5

#Se obtienen por cada k, 5 output .log,.meanP, .meanQ, .varP, varQ. 

#2. Elegir el modelo que explica mejor los datos
python chooseK.py --input=k*

#Model complexity that maximizes marginal likelihood = 2
#Model components used to explain structure in data = 1



#3.POSTERIORMENTE CORRí LOS ARCHIVOS Con logistic


python structure.py -K 1 --input=../data/bobos50 --format=str --full --prior=logistic --seed=100 --output=../output/priorlogcv_k1
python structure.py -K 2 --input=../data/bobos50 --format=str --full --prior=logistic --seed=100 --output=../output/priorlogcv_k2
python structure.py -K 3 --input=../data/bobos50 --format=str --full --prior=logistic --seed=100 --output=../output/priorlogcv_k3
python structure.py -K 4 --input=../databobos50 --format=str --full --prior=logistic --seed=100 --output=../outputpriorlogcv_k4
python structure.py -K 5 --input=../data/bobos50 --format=str --full --prior=logistic --seed=100 --output=../output/priorlogcv_k5



#4. Elegir el modelo que explica mejor los datos

python chooseK.py --input=../output/priorlogcv_*

#Model complexity that maximizes marginal likelihood = 3
#Model components used to explain structure in data = 1


#5.HACER UN PLOT CON LOS DATOS
 python distruct.py -K 1 --input=../output/k1 --output=../figures/k1_simple_distruct.svg


