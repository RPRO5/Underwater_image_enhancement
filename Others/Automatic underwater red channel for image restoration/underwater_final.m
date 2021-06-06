%function [im1] = underwater_final(im)
%�趨t����ֵ�������͵����˲��Ż�����
clear all; clc; close all;

trainData = imageSet('./Dataset','recursive');
newSize = 500; %Size of the image
OutputPath = './Results/'; % Path for saving output images

for count = 1:trainData.Count
    
     img = read(trainData, count);
    imgpath = char(trainData.ImageLocation(count));
    [~,imgname,~] = fileparts(imgpath) ;

    %Pre-Processing
    img = imresize(img, [newSize,newSize]);
    im_haze = double(img)/255.0;
t0=0.1;
r = 15;
res = 0.001;
%��ʼ��ͼ��
%im_haze=im2double(im);
%��ͼ����к�ͨ���˲�
[ JRDark,JRSDark] = Red_channel(im_haze);
%ʹ�ò���satֵ�ĺ�ͨ������õ�Aֵ
 atmospheric=atmLight(im_haze,JRDark);
%ʹ��Aֵ�õ����յ�tֵ����ʹ�õ����˲��Ż�t
[ trans ] =transmittion(im_haze,atmospheric);
 trans = guided_filter(rgb2gray(im_haze), trans, r, res);
 %�õ����յĹ�һ�����
im1 =dehazing(im_haze, atmospheric,t0,trans);
savepath = strcat(OutputPath,imgname, '.png');
    imwrite(im1,savepath);
    
    
end
