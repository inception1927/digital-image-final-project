function [distance]=calDistance(A, B)
%求A，B两个向量之间的二范数
D = A-B;                   %A-B求得A和B之间连成的向量D
distance = norm(D, 2);     %用norm求D的二范数就是AB间的二范数