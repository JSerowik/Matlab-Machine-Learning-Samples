X1 = load('exData.mat','exData1');
w1 = X1.exData1;
X2 = load('exData.mat','exData2');
w2 = X2.exData2;
ci = 0;
cj = 0;

for i = -4:0.1:8
    ci = ci + 1;
    cj = 0;
    for j = -4:0.1:8
        cj = cj + 1;
        p1(ci,cj) = parzen(w1, [i;j]);
        p2(ci,cj) = parzen(w2, [i;j]);
    end
end
[parzen(w1,[1;-2])]
[parzen(w2,[1;-2])]
figure(1)
mesh(p1); 
hold;
mesh(p2);