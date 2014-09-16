#sleep 120m;

# tail -5000000 click.train.vw > click.cv_test.vw
# head -36256556 click.train.vw > click.cv_train.vw

#echo 'vw-hypersearch -L  -t click.cv_test.vw .000000001 1  vw -b 25 --loss_function logistic --learning_rate % click.cv_train.vw' >> RESULTS/parameter_testing.out 
#vw-hypersearch -L  -t click.cv_test.vw .000000001 1  vw  --loss_function logistic --learning_rate % click.cv_train.vw >> RESULTS/parameter_testing.out


#echo 'vw-hypersearch -t click.cv_test.vw .01 2  vw --l1 1.13691524495807e-06  --loss_function logistic --learning_rate % click.cv_train.vw' >> RESULTS/parameter_testing.out

#vw-hypersearch -t click.cv_test.vw .01 2  vw --l1 1.13691524495807e-06  --loss_function logistic --learning_rate % SAMPLE_DATA/sample.click.train.vw  >> RESULTS/parameter_testing.out


#echo 'vw-hypersearch -L  -t click.cv_test.vw 1 6  vw  --loss_function logistic --passes % click.cv_train.vw' >> RESULTS/parameter_testing.out

#vw-hypersearch -L  -t click.cv_test.vw 1 6  vw  --loss_function logistic --passes % SAMPLE_DATA/sample.click.train.vw >> RESULTS/parameter_testing.out

echo 'vw-hypersearch -L  -t click.cv_test.vw 0 .001  vw --passes 4 -c --learning_rate .33  --loss_function logistic --l2 % click.cv_train.vw' >> RESULTS/parameter_testing.out

vw-hypersearch -L  -t click.cv_test.vw 0.000000000001 .00001  vw --passes 4 -c --learning_rate .33  --loss_function logistic --l2 % click.cv_train.vw  >> RESULTS/parameter_testing.out


echo 'vw-hypersearch -L  -t click.cv_test.vw 0 1  vw  --loss_function logistic --power_t % click.cv_train.vw' >> RESULTS/parameter_testing.out

vw-hypersearch -L  -t click.cv_test.vw .00000001 1  vw  --loss_function logistic --power_t % SAMPLE_DATA/sample.click.train.vw >> RESULTS/parameter_testing.out

echo 'vw-hypersearch -L  -t click.cv_test.vw 0 1  vw  --loss_function logistic --decay_learning_rate % click.cv_train.vw' >> RESULTS/parameter_testing.out

vw-hypersearch -L  -t click.cv_test.vw .0000001 1  vw  --loss_function logistic --decay_learning_rate  % SAMPLE_DATA/sample.click.train.vw >> RESULTS/parameter_testing.out

./cv.sh
