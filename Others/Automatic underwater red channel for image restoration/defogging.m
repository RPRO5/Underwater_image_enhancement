function im1 = defogging(im)
%��һ��ͼ��İ�ͨ��ͼ�񣬴��ڴ�СΪ15*15
im = im2double(im);
dark = darkChannel(im);
%ѡȡͨ����������0.1%���أ��Ӷ���ô�����
[m, n, ~] = size(im);
atmospheric = atmLight(im,dark);
x = zeros(size(im));
im1 = zeros(size(im));
for ind = 1:3
    x(:,:,ind) = im(:,:,ind)./atmospheric(ind);
end
dark= darkChannel(x);
t = 1- dark;
t = guided_filter(rgb2gray(im), t, 15, 0.001);
for i = 1:m
    for j = 1:n
        for c = 1:3
            im1(i,j,c) = (im(i,j,c) - atmospheric(c))/max(t(i,j),0.1) + atmospheric(c);
        end
    end
end
end