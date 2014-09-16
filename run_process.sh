#!/bin/bash

#vw click.train.vw -f click.model.vw --loss_function logistic --holdout_off --passes 4 -c  -b 25  -q ii
#vw click.train.vw -f click.model.vw --loss_function logistic  --passes 4 -c -b 25 --holdout_off

vw click.cv_train.vw -f click.model_combo.vw --loss_function logistic  --passes 4 -c -b 25 --holdout_off --learning_rate .328877  

vw click.cv_train.vw -i click.model_combo.vw -f click.model.vw --loss_function logistic  --passes 5 -c -b 25 --holdout_off --learning_rate .328877 --bfgs --mem 22 --l2 .00000001 --termination .000001


vw click.test.vw -t -i click.model.vw -p click.preds.txt

python vw_to_kaggel.py

mv kaggle.click.submission.csv criteo.csv


