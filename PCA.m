function [A,V]=PCA(Matrix, means, n)
global row;
global col;
global k;
global persons;
meanMatrix = zeros(persons*n, row*col);
for i = 1:persons*n
   meanMatrix(i,:) = Matrix(i,:) - means; %让每一列都减去其平均值，数据中心化
end
C = cov(meanMatrix);        %求协方差
[V,d]=eigs(C, k);           %求最大k个特征值和特征向量 其中v是特征向量， d是特征值
for i = 1:k;
    V(:,i) = V(:,i)/norm(V(:,i));   %特征向量单位化
end
A = meanMatrix*V;           %将特征向量投影到中心化后的数据上