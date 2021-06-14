function [ JRDark,JRSDark] = Red_channel(im)
[height,width,~]=size(im);
patchsize=7;
padsize=3;
im(:,:,1)=1-im(:,:,1);%�õ���ͨ��ͼ��
imJ=padarray(im,[padsize,padsize],Inf);%��չ��Ե
JRDark=zeros(height,width);

imsize=height*width;
imvector=reshape(im,imsize,3);%��ͼ��������¶���
maxvector=max(imvector,[], 2);%�õ�RGB�����е����ֵ
minvector=min(imvector,[],2);%�õ�RGB�����е���Сֵ
im_sat=(maxvector-minvector)./maxvector;%�õ�������satֵ
lamda=1-mean(im_sat(:));%��������lamda���趨Ϊ1-sat��ƽ��ֵ
im_sat=im_sat*lamda;%�õ��Ż����satֵ
im_sat=reshape(im_sat, height,width);%��sat���¶���Ϊ��ͼ���С��ͬ�ľ���

ims=cat(4,im(:,:,1),im(:,:,2),im(:,:,3),im_sat);%��ô�sat���ͼ�����
imS=padarray(ims,[padsize,padsize],Inf);%��չ��Ե
JRSDark=JRDark;
%�˲��õ���ͨ���ʹ�satֵ��ͨ������
for j=1:height
    for i=1:width
        patch=imJ(j:(j+patchsize-1),i:(i+patchsize-1),:);
        patch1=imS(j:(j+patchsize-1),i:(i+patchsize-1),:);
        JRDark(j,i)=min(patch(:));%����satֵ
        JRSDark(j,i)=min(patch1(:));%����satֵ
    end
end
end


