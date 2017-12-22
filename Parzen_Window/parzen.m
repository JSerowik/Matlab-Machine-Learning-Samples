function y = parzen(x, xi)
    h = 0.2;
    Xm = x - xi*ones(1,100);       
    phi = (Xm(1,:).^2+Xm(2,:).^2)./(2*h^2);
    y = (1/size(x,2))*(1/h)*(1/sqrt(2*pi))*sum(exp((-phi)));
end