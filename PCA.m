function [A,V]=PCA(Matrix, means, n)
global row;
global col;
global k;
global persons;
meanMatrix = zeros(persons*n, row*col);
for i = 1:persons*n
   meanMatrix(i,:) = Matrix(i,:) - means; %��ÿһ�ж���ȥ��ƽ��ֵ���������Ļ�
end
C = cov(meanMatrix);        %��Э����
[V,d]=eigs(C, k);           %�����k������ֵ���������� ����v������������ d������ֵ
for i = 1:k;
    V(:,i) = V(:,i)/norm(V(:,i));   %����������λ��
end
A = meanMatrix*V;           %����������ͶӰ�����Ļ����������