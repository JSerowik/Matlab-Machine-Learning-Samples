% Example of a Matlab implementaion of the Stochastic Backpropagation 
% Algorithm to train a neural network
clear
load exData.mat
x1 = exData1;
x2 = exData2;
figure(1);
plot(x1(1,:),x1(2,:),'o',x2(1,:),x2(2,:),'*')

X = [x1 x2];
target1 = [ones(1,100);(-1*ones(1,100))];
target2 = [(-1*ones(1,100)); ones(1,100)];
T = [target1 target2];
% Normalizing the values in X
xx1 = X(1,:);
xx2 = X(2,:);
mn1 = mean(xx1);
mn2 = mean(xx2);
st1 = std(xx1, 0, 2);
st2 = std(xx2, 0, 2);
sz = size(X, 2);
for i = 1:sz
    tmp1(i) = (xx1(i)-mn1)/st1;
    tmp2(i) = (xx2(i)-mn2)/st1;
end
normX = [tmp1; tmp2];
% Set constant parameters as specified in the problem
theta=0.1;
eta=0.1;
Nh=10;
Ni=2;
No=2;
bias = 1;
a = 1.716;
b = 2/3;
% Set initial in-hidden and hidden-out values
wji = ((1/sqrt(Ni))-(-1/sqrt(Ni))).*rand(10,3) + (-1/sqrt(Ni));
wkj = ((1/sqrt(Nh))-(-1/sqrt(Nh))).*rand(2,11) + (-1/sqrt(Nh));
cnt = 0;
err = 1;    
% Train the network with randomly selected X values
while(theta < err)
    r = randperm(sz);
    cnt = cnt + 1;
    in = normX(:,r(cnt));
    tgt = T(:,r(cnt));
    % Adjust in-hidden and hidden-out values
    net_j = wji*[in; bias];
    Y = act(net_j, a, b);
    net_k = wkj*[Y;bias];
    Z = act(net_k, a, b);
    % Calculate sensitivity
    delta_k = (tgt - Z).*actPrime(net_k, a, b);
    delta_wkj = eta.*delta_k*[Y;1]';
    actPrime(net_j, a, b);
    delta_j = wkj(:,1:end-1)'*delta_k;
    actNet_j = actPrime(net_j, a, b);
    
    for l = 1:Nh
        delta_j(l) = delta_j(l)*actNet_j(l);
    end
    
    delta_wji = eta*delta_j*[in;1]';
    wkj = wkj+delta_wkj;
    wji = wji+delta_wji;    
    targets = T(:,1);
    
    err = ((tgt(1)-Z(1))^2+(tgt(2) - Z(2))^2)/2;
    % Restart count if index larger than the size of the data
    if cnt == 200
        cnt = 0;
    end
end
[err]
% Input D to try to classify
D = [2 -3 -2 3; 2 -3 5 -4];
class = zeros(2,4);
szD = size(D, 2);
cnt = 1;
for cnt = 1:szD
    in = D(:,cnt);
    net_j = wji*[in; bias];
    Y = act(net_j, a, b);
    net_k = wkj*[Y;bias];
    Z = act(net_k, a, b);
    class(:,cnt) = Z;
end
% For column, if closer to [1; -1] than class 1 and if cloder to [-1; 1]
% than class 2
[class]