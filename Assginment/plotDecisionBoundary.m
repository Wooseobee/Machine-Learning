function plotDecisionBoundary(w, X, y)
plot_x = [min(X(:,2))-2,  max(X(:,2))+2];
plot_y = (-1./w(3)).*(w(2).*plot_x + w(1));
plot(plot_x, plot_y)
axis([min(X(:,2)),max(X(:,2)),min(X(:,3)),max(X(:,3))])
end