function [A,V]=PCA(Matrix, means, n)
global row;
global col;
global k;
global persons;
meanMatrix = zeros(persons*n, row*col);
for i = 1:persons*n
   meanMatrix(i,:) = Matrix(i,:) - means; 
end
C = cov(meanMatrix);      
[V,d]=eigs(C, k);     
for i = 1:k;
    V(:,i) = V(:,i)/norm(V(:,i));
end
A = meanMatrix*V;           