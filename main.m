clc;
clear;
global row;        %ͼƬ������ 112
global col;        %ͼƬ������ 92
global persons;    %������ 40
global k;          %ѡȡ�����������ά���� 80
row=112;
col=92;
persons=40;
k = 80;
pMatrix = readfile(0); %����ѵ���õ�ͼƬ������ÿһ�д���һ��ͼ��
tMatrix = readfile(1); %��������õ�ͼƬ������ÿһ�д���һ��ͼ��
pMeans = mean(pMatrix);   %��ѵ��ͼƬƽ��ֵ
tMeans = mean(tMatrix);   %�����ͼƬƽ��ֵ
% m = reshape(pMeans, 112, 92);
% imshow(uint8(m));   %��ֵ��
[pA, pV] = PCA(pMatrix, pMeans, 7);     %��ѵ��ͼƬ��PCA��ά
[tA, tV] = PCA(pMatrix, tMeans, 3);     %�Բ���ͼƬ��PCA��ά
% m = reshape(tMatrix(1,:), 112, 92);   
cnt = 0;                            %����ƥ����ȷ����Ŀ
for i = 1:120
    minPos = 0;                     %ÿ��ѡȡ�µĲ���ͼƬʱ��������̾����ѵ��������λ��
    minDistance = realmax;          %ÿ��ѡȡ�µĲ���ͼƬʱ��������Сֵ�� ��ʼֵΪϵͳ��ȡ�����ֵ
    for j = 1:280
        curDistance = calDistance(tMatrix(i,:), pMatrix(j,:));  %��������ͼƬ�����������ĺ���
        if (curDistance < minDistance)            
            minDistance = curDistance;          %����ǰ������С��֮ǰ����Сֵʱ��������Сֵ
            minPos = j;
        end
    end
    t = reshape(tMatrix(i,:), 112, 92);
    p = reshape(pMatrix(minPos,:), 112, 92);
    subplot(1,2,1);imshow(uint8(t));title('����ͼ��');
    subplot(1,2,2);imshow(uint8(p));title('ƥ��ͼ��');
    str = 'F:\ƥ��Ա�ͼ��\s';
    str = strcat(str, num2str(floor((i-1)/3)+1));
    str = strcat(str, '-');
    str = strcat(str, num2str(rem(i-1,3)+1));
    str = strcat(str, '.png');
    saveas(gcf,str);            %�������õ�ͼ�����ƥ��ͼ����Ϊ�Աȱ��浽Ӳ����
    
    a = floor((minPos-1)/7);    %�жϵ�ǰ����ͼƬ��ƥ�䵽��ѵ��ͼƬ�Ƿ���ͬһ����
    b =  floor((i-1)/3);        %��Ϊѵ��ͼƬ�Ͳ���ͼƬ���ǰ�˳���ȡ�洢�ģ��ֱ�
    if (a == b)                 %ÿ���ź�ÿ������ͬһ���ˣ����Էֱ����7��3����ȡ��
        cnt = cnt + 1;          %�����Ⱦ���ζ�Ų���ͼƬƥ�䵽��ѵ��ͼƬ��ͬһ����
    end                         %��cnt��¼
end                             %���Խ��Ϊ 114/120 = 95% ��ʶ����
rate = cnt/120;
fprintf('��ȷ��Ϊ%.2f%%',rate*100);

