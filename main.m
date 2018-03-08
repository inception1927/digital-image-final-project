clc;
clear;
global row;        %图片行数， 112
global col;        %图片列数， 92
global persons;    %人数， 40
global k;          %选取特征向量最大维数， 80
row=112;
col=92;
persons=40;
k = 80;
pMatrix = readfile(0); %读入训练用的图片，矩阵每一行代表一张图像
tMatrix = readfile(1); %读入测试用的图片，矩阵每一行代表一张图像
pMeans = mean(pMatrix);   %求训练图片平均值
tMeans = mean(tMatrix);   %求测试图片平均值
% m = reshape(pMeans, 112, 92);
% imshow(uint8(m));   %均值脸
[pA, pV] = PCA(pMatrix, pMeans, 7);     %对训练图片做PCA降维
[tA, tV] = PCA(pMatrix, tMeans, 3);     %对测试图片做PCA降维
% m = reshape(tMatrix(1,:), 112, 92);   
cnt = 0;                            %计算匹配正确的数目
for i = 1:120
    minPos = 0;                     %每次选取新的测试图片时都重置最短距离的训练向量的位置
    minDistance = realmax;          %每次选取新的测试图片时都重置最小值， 初始值为系统可取的最大值
    for j = 1:280
        curDistance = calDistance(tMatrix(i,:), pMatrix(j,:));  %计算两个图片向量二范数的函数
        if (curDistance < minDistance)            
            minDistance = curDistance;          %当当前二范数小于之前的最小值时，更新最小值
            minPos = j;
        end
    end
    t = reshape(tMatrix(i,:), 112, 92);
    p = reshape(pMatrix(minPos,:), 112, 92);
    subplot(1,2,1);imshow(uint8(t));title('测试图像');
    subplot(1,2,2);imshow(uint8(p));title('匹配图像');
    str = 'F:\匹配对比图像\s';
    str = strcat(str, num2str(floor((i-1)/3)+1));
    str = strcat(str, '-');
    str = strcat(str, num2str(rem(i-1,3)+1));
    str = strcat(str, '.png');
    saveas(gcf,str);            %将测试用的图像和其匹配图像作为对比保存到硬盘中
    
    a = floor((minPos-1)/7);    %判断当前测试图片和匹配到的训练图片是否是同一个人
    b =  floor((i-1)/3);        %因为训练图片和测试图片都是按顺序读取存储的，分别
    if (a == b)                 %每七张和每三张是同一个人，所以分别除以7和3向下取整
        cnt = cnt + 1;          %如果相等就意味着测试图片匹配到的训练图片是同一个人
    end                         %用cnt记录
end                             %测试结果为 114/120 = 95% 的识别率
rate = cnt/120;
fprintf('正确率为%.2f%%',rate*100);

