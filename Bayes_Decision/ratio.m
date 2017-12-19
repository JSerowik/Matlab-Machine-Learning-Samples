function y = ratio(x)
    y = ((normpdf(x, 0, 1)./(normpdf(x, 2, 2))));
end