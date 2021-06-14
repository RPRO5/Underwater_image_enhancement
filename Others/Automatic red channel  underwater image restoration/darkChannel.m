function dark = darkChannel(im2)
[height, width, ~] = size(im2);
patchSize = 3; 
padSize = 1; 
dark = zeros(height, width); 
imJ = padarray(im2, [padSize padSize], Inf);%��չ��Ե
for j = 1:height
    for i = 1:width
        patch = imJ(j:(j+patchSize-1), i:(i+patchSize-1),:);%ѡȡ��Χ
        dark(j,i) = min(patch(:));%�õ���Сֵ��Ϊ��ͨ����ֵ
     end
end
