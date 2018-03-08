function [Matrix]=readfile(flag)
%��flagΪ1ʱ����ȡ����ͼƬ����flagΪ0ʱ����ȡѵ��ͼƬ
global row;
global col;
global persons;
if (flag == 0)                  %flagΪ0����ȡѵ��ͼƬ
    pMatrix = zeros(persons*7, row*col);  
    for i = 1:persons
        filePath = 'F:\final project\s';            %����filePath����ͼƬ��ĸ·��
        filePath = strcat(filePath, num2str(i));    %��filePath����ϵ�ǰ�˵���ſɵõ�������ͼƬ��·��
        filePath = strcat(filePath,'\');
        tmp = filePath;
        for j = 1:7                 %��ͨ����·���ַ���������������ȡǰ������Ϊѵ��ͼ��
            filePath = tmp;
            filePath = strcat(filePath,num2str(j)); 
            filePath = strcat(filePath,'.pgm');
            img=imread(filePath);
            pMatrix((i-1)*7+j,:)=img(:);        %����pMatrix��
        end
    end
    Matrix = pMatrix;                           %����pMatrix
end
if (flag == 1)              %flagΪ1����ȡѵ��ͼƬ
    tMatrix = zeros(persons*3, row*col);
    for i = 1:persons
        filePath = 'F:\final project\s';
        filePath = strcat(filePath, num2str(i));
        filePath = strcat(filePath,'\');
        tmp = filePath;
        for j = 1:3
            filePath = tmp;
            filePath = strcat(filePath,num2str(j+7));   %������ȡ��������Ϊѵ��ͼ��
            filePath = strcat(filePath,'.pgm');         %�����������������
            img=imread(filePath);
            tMatrix((i-1)*3+j,:)=img(:);        %����tMatrix��
        end
    end
    Matrix = tMatrix;                           %����tMatrix
end