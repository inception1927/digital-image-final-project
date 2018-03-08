clc;
clear;
global row;       
global col;       
global persons;    
global k;          
row=112;
col=92;
persons=40;
k = 80;
pMatrix = readfile(0); 
tMatrix = readfile(1); 
pMeans = mean(pMatrix);   
tMeans = mean(tMatrix);   
% m = reshape(pMeans, 112, 92);
% imshow(uint8(m));  
[pA, pV] = PCA(pMatrix, pMeans, 7); 
[tA, tV] = PCA(pMatrix, tMeans, 3);     
% m = reshape(tMatrix(1,:), 112, 92);   
cnt = 0;                            
for i = 1:120
    minPos = 0;                     
    minDistance = realmax;          
    for j = 1:280
        curDistance = calDistance(tMatrix(i,:), pMatrix(j,:));  
        if (curDistance < minDistance)            
            minDistance = curDistance;         
            minPos = j;
        end
    end
    t = reshape(tMatrix(i,:), 112, 92);
    p = reshape(pMatrix(minPos,:), 112, 92);
    subplot(1,2,1);imshow(uint8(t));title('');
    subplot(1,2,2);imshow(uint8(p));title('');
    str = 'F:\训练图像路径\s';
    str = strcat(str, num2str(floor((i-1)/3)+1));
    str = strcat(str, '-');
    str = strcat(str, num2str(rem(i-1,3)+1));
    str = strcat(str, '.png');
    saveas(gcf,str);          
    
    a = floor((minPos-1)/7);    
    b =  floor((i-1)/3);        
    if (a == b)                 
        cnt = cnt + 1;          
    end                         
end                             
rate = cnt/120;
fprintf('识别率%.2f%%',rate*100);

