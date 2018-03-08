function [distance]=calDistance(A, B)

D = A-B;      
distance = norm(D, 2);     