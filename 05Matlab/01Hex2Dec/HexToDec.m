%%%该文件主要实现十六进制转换成十进制
clc;
clear;
a=textread('.\DataHex.txt','%s')';%以字符形式打开文件 
alpha=hex2dec(a)'; %16进制转化为10进制数，存入alpha矩阵 
%%%%%%%16进制转10进制 转化方法二%%%%%%%%%%%
[wenjian_ming,lujing_ming] = uigetfile('.\DataHex.txt','导入数据');
fid=fopen(strcat(lujing_ming,wenjian_ming),'r');
data=[];
while ~feof(fid)
m=fscanf(fid,'%3x',[1 inf]);
data=[data;m];         %将读出的数据存入data矩阵中
end
alpha=data;
%%%%%%%保存文件方法一%%%%%%%%%%%%%%
dlmwrite('.\DataDec1.txt',alpha,'delimiter', ' ') %将得出数据存入新的b.txt文档 
%%%%%%%保存文件方法二%%%%%%%%%%%%%%
fid=fopen('.\DataDec2.txt','w');
fprintf(fid,'%d ',alpha');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alpha2=alpha(1:2:length(alpha)-mod(length(alpha)+1,2)); %将奇数元素提取出来
dlmwrite('.\DataDec3.txt',alpha2,'delimiter', ' ')  %将得出数据存入新的c.txt文档 
%%%%%%%画图%%%%%%%%%%%%%%
plot(1:length(alpha2),alpha2)  %画图