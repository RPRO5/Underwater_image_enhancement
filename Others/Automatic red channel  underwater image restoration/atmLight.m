function A = atmLight(im, JDark)
[height, width, ~] = size(im);
imsize = width * height;%�õ��������ص�ĸ���

numpx = floor(imsize/1000);%ȷ��ѡȡ��Χ
JDarkVec = reshape(JDark,imsize,1);%�õ���ͨ������
ImVec = reshape(im,imsize,3);%�õ�ͼ������

[JDarkVec, indices] = sort(JDarkVec);%��ͨ������������
indices = indices(imsize-numpx+1:end); %ȷ��Ҫѡȡ�����ص��λ��

atmSum = zeros(1,3);
max=0;
%����ѡȡ��Χ��ѡ���������ص�ֵ��ΪAֵ
for ind=1:numpx
   temp=sum( ImVec(indices(ind),:));
   if temp>max
   max=temp;
   A=ImVec(indices(ind),:);
   end
end
