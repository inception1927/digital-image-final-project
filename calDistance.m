function [distance]=calDistance(A, B)
%��A��B��������֮��Ķ�����
D = A-B;                   %A-B���A��B֮�����ɵ�����D
distance = norm(D, 2);     %��norm��D�Ķ���������AB��Ķ�����