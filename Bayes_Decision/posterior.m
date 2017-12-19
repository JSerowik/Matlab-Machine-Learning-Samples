function y = posterior(x, u, v, p)
    y = ((normpdf(x, u, v)*(p))./evidence(x));
end