#!/bin/bash

#vw click.train.vw -f click.model.vw --loss_function logistic  --passes 4 -c -b 25 --learning_rate 0.328877386147401 --l1 1.13691524495807e-06 -—holdout_off

#vw click.cv_train.vw -f click.model_cv.vw --loss_function logistic  --passes 8 -c -b 25 --holdout_off --learning_rate .32  --l2 .000000002 

vw click.cv_train.vw -f click.model_combo.vw --loss_function logistic  --passes 10 -c -b 25 --holdout_off --learning_rate .328877 --l2 .000002  

#vw click.cv_train.vw -i click.model_combo.vw -f click.model_cv.vw --loss_function logistic  --passes 4 -c  --holdout_off --learning_rate .328877 --bfgs --mem 22 --l2 .000001 
vw click.cv_test.vw -t -i click.model_cv.vw -p click.preds_cv.txt
python loss.py




