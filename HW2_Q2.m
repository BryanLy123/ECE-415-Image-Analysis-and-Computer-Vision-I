reg = imread('shirt.jpg');

h = [0.25 0.5 0.25];
h2 = h.*h;
n = [-1,0,1];
figure;
stem(n,h);
figure;
imshow(reg);

filter_image = imfilter(reg,h);
decimate = filter_image(1:2:end,:);
downsample(filter_image,2);
figure;

filter_2D = imfilter(decimate, h);
decimateD = filter_2D(:,1:2:end);
figure;
imshow(decimateD);
title('2D Filtered');
freqz2(h);


