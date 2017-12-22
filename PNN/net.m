function class = net(x, w, sig)
    h = size(x, 2);
    class = 0;
    for i = 1:h
        nt = (w(i).')*x(i);
        class = class + exp((nt-1)/sig.^2);
    end
end