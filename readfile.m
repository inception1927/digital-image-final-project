function [Matrix]=readfile(flag)

global row;
global col;
global persons;
if (flag == 0)               
    pMatrix = zeros(persons*7, row*col);  
    for i = 1:persons
        filePath = 'F:\final project\s';           
        filePath = strcat(filePath, num2str(i));  
        filePath = strcat(filePath,'\');
        tmp = filePath;
        for j = 1:7               
            filePath = tmp;
            filePath = strcat(filePath,num2str(j)); 
            filePath = strcat(filePath,'.pgm');
            img=imread(filePath);
            pMatrix((i-1)*7+j,:)=img(:);      
        end
    end
    Matrix = pMatrix;                       
end
if (flag == 1)     
    tMatrix = zeros(persons*3, row*col);
    for i = 1:persons
        filePath = 'F:\final project\s';
        filePath = strcat(filePath, num2str(i));
        filePath = strcat(filePath,'\');
        tmp = filePath;
        for j = 1:3
            filePath = tmp;
            filePath = strcat(filePath,num2str(j+7));  
            filePath = strcat(filePath,'.pgm');   
            img=imread(filePath);
            tMatrix((i-1)*3+j,:)=img(:);    
        end
    end
    Matrix = tMatrix;                   
end