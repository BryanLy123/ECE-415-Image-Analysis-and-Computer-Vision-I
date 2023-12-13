left_image = im2gray(imread('left.PNG')); 
right_image = im2gray(imread('right.PNG')); 
montage({right_image,left_image})
figure;

c = xcorr2(left_image,right_image);
surf(c)
plot(c)
shading flat
figure;

[ypeak,xpeak] = find(c==max(c(:)));
yoffSet = ypeak-size(left_image,16);
xoffSet = xpeak-size(left_image,16);

imshow(right_image)
figure;
imshow(left_image)
figure;
drawrectangle(gca,'Position',[xoffSet,yoffSet,size(left_image,2),size(left_image,1)], ...
    'FaceAlpha',0);
imshow(drawrectangle)