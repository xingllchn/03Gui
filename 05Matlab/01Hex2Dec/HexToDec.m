%%%���ļ���Ҫʵ��ʮ������ת����ʮ����
clc;
clear;
a=textread('.\DataHex.txt','%s')';%���ַ���ʽ���ļ� 
alpha=hex2dec(a)'; %16����ת��Ϊ10������������alpha���� 
%%%%%%%16����ת10���� ת��������%%%%%%%%%%%
[wenjian_ming,lujing_ming] = uigetfile('.\DataHex.txt','��������');
fid=fopen(strcat(lujing_ming,wenjian_ming),'r');
data=[];
while ~feof(fid)
m=fscanf(fid,'%3x',[1 inf]);
data=[data;m];         %�����������ݴ���data������
end
alpha=data;
%%%%%%%�����ļ�����һ%%%%%%%%%%%%%%
dlmwrite('.\DataDec1.txt',alpha,'delimiter', ' ') %���ó����ݴ����µ�b.txt�ĵ� 
%%%%%%%�����ļ�������%%%%%%%%%%%%%%
fid=fopen('.\DataDec2.txt','w');
fprintf(fid,'%d ',alpha');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alpha2=alpha(1:2:length(alpha)-mod(length(alpha)+1,2)); %������Ԫ����ȡ����
dlmwrite('.\DataDec3.txt',alpha2,'delimiter', ' ')  %���ó����ݴ����µ�c.txt�ĵ� 
%%%%%%%��ͼ%%%%%%%%%%%%%%
plot(1:length(alpha2),alpha2)  %��ͼ