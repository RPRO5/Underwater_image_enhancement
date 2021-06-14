function [ A ] = atmLight1( im, JRDark )
%������������atmLight������ͬ
[height, width, ~]=size(im);
imsize=height*width;
numpx=floor(imsize/1000);
JRDarkvec=reshape(JRDark,imsize,1);
ImVec=reshape(im,imsize,3);
[JDarkvec,indices]=sort(JRDarkvec);
indices=indices(imsize-numpx+1:end);
%��֮ͬ������������ѡ����Сֵ��Ϊˮ�¹�ǿ
min=Inf;
for ind=1:numpx
    temp=ImVec(indices(ind),:);
    if temp(1)<min
        min=temp(1);
        A=temp;
    end
end





