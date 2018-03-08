function [Matrix]=readfile(flag)
%当flag为1时，读取测试图片，当flag为0时，读取训练图片
global row;
global col;
global persons;
if (flag == 0)                  %flag为0，读取训练图片
    pMatrix = zeros(persons*7, row*col);  
    for i = 1:persons
        filePath = 'F:\final project\s';            %先用filePath保存图片的母路径
        filePath = strcat(filePath, num2str(i));    %在filePath后加上当前人的序号可得到其所有图片的路径
        filePath = strcat(filePath,'\');
        tmp = filePath;
        for j = 1:7                 %再通过对路径字符串操作，遍历读取前七张作为训练图像
            filePath = tmp;
            filePath = strcat(filePath,num2str(j)); 
            filePath = strcat(filePath,'.pgm');
            img=imread(filePath);
            pMatrix((i-1)*7+j,:)=img(:);        %存入pMatrix中
        end
    end
    Matrix = pMatrix;                           %返回pMatrix
end
if (flag == 1)              %flag为1，读取训练图片
    tMatrix = zeros(persons*3, row*col);
    for i = 1:persons
        filePath = 'F:\final project\s';
        filePath = strcat(filePath, num2str(i));
        filePath = strcat(filePath,'\');
        tmp = filePath;
        for j = 1:3
            filePath = tmp;
            filePath = strcat(filePath,num2str(j+7));   %遍历读取后七张作为训练图像
            filePath = strcat(filePath,'.pgm');         %其余操作和上面类似
            img=imread(filePath);
            tMatrix((i-1)*3+j,:)=img(:);        %存入tMatrix中
        end
    end
    Matrix = tMatrix;                           %返回tMatrix
end