X1 = load('exData.mat','exData1');
d1 = X1.exData1;
X2 = load('exData.mat','exData2');
d2 = X2.exData2;

x =[1;-2];
sig = 0.2;
net1 = x'*d1;
net2 = x'*d2;
class1 = sum(exp((net1-1)/sig.^2));
class2 = sum(exp((net2-1)/sig.^2));
if class1 > class2
    display('X is Class 1');
    [class1, class2]
else
    display('X is Class 2');
    [class1, class2]
end