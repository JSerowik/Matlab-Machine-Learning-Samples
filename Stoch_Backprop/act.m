function y = act(net, a, b)
        y = a.*tanh(b.*net);
 end