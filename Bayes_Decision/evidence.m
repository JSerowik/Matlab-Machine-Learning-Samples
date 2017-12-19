function y = evidence(x)
    y = (normpdf(x, 0, 1)*(3/5)) + (normpdf(x, 2, 2)*(2/5));
end
