function [Jval, gradient] = costfunction(w, X, y)

m = length(y);
Jval = 0;
gradient = zeros(size(w));

h = sigmoid(X*w);
Jval = (1/m)*sum((-y).*log(h)-(1-y).*log(1-h));
gradient = (1/m)*(transpose(X)*(h-y));
end