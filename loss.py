import scipy as sp, pandas as pd,math
def llfun(act, pred):
    epsilon = 1e-15
    pred = sp.maximum(epsilon, pred)
    pred = sp.minimum(1-epsilon, pred)
    ll = sum(act*sp.log(pred) + sp.subtract(1,act)*sp.log(sp.subtract(1,pred)))
    ll = ll * -1.0/len(act)
    return ll


data=pd.read_csv('click.preds_cv.txt',names=['score','id'],sep=' ')
actual=pd.read_csv('cv_test_score.txt',sep=' ',names=['id','outcome'])


def zygmoid(x):
        #I know it's a common Sigmoid feature, but that's why I probably found
        #it on FastML too: https://github.com/zygmuntz/kaggle-stackoverflow/blob/master/sigmoid_mc.py
        return 1 / (1 + math.exp(-x))

scored=[zygmoid(float(x)) for x in data['score']]

print(llfun(actual['outcome'],scored))
