function [C] = con2d(X,W)
[r,c] = size(X);
X_pad  = zeros(r+2,c+2);
X_pad(2:r+1,2:c+1) = X;

[r,c] = size(X_pad);
C = zeros(r-2,c-2);
for i = 1:r-2
    for j = 1:c-2
        C(i,j) = sum(W.*X_pad(i:i+2,j:j+2),'all');
    end
end