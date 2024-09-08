function result = MinZakharov(x)
    term1 = sum(x .^ 2-10);
    term2 = sum(0.5 .* (1:length(x)) .* x);
    result = term1 + term2 * 2 + term2 * 4;
end