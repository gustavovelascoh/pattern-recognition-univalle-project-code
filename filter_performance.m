function [c, m] = filter_performance(gt, df, e0)

l = length(e0);
lgt = length(gt);

[m,n] = compare(gt,df);

lm = length(m);
ln = length(n);

tp = lgt-lm;
tn = l-lgt-ln;

fn = lm;
fp = ln;

acc = (tp + tn)/l;
rec = tp/lgt;
pre = tp / (tp+fp);
spe = tn / (tn +fp);
fpr = fp/(l-lgt);

c = [tp fn, fp tn];
m = [acc, rec, pre, spe, fpr];