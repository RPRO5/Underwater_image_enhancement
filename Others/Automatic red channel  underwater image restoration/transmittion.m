function [ trans ] =transmittion(im,A)
%���ݻ�õ�Aֵ�����ù�ʽ�������յ�tֵ
im3=zeros(size(im));
%ʹ��Aֵ�仯im
for ind=1:3
    if ind==1
    im3(:,:,ind)=im(:,:,ind)./(1-A(ind));
    else
      im3(:,:,ind)=im(:,:,ind)./A(ind);  
    end
end
%�Ա仯���im���к�ͨ���˲����õ���satֵ��ͨ������
[ JRDark,JRSDark] = Red_channel(im3);
%���ղ��ô�satֵ��ͨ���������tֵ
trans=1-JRSDark;



