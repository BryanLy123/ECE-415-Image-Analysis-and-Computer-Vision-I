reg = imread('shirt.jpg');
sm = imread('shirt_small.jpg');
[x,y,z] = size(reg);
[x1,y1,z1] = size(sm);
D1 = im2double(reg);
D2 = im2double(sm);

h = [0.25 0.5 0.25];
hi = [1/2 1 1/2];
n = [-1,0,1];
figure;
stem(n,h);
figure;
imshow(reg);

filter_image = imfilter(D1,h);
decimate = filter_image(1:2:end,:);
downsample(filter_image,2);
figure;
imshow(decimate);
title('Horizontally Filtered');
axis on;

filter_image2 = imfilter(D1,h);
decimate2 = filter_image2(:,1:2:end);
figure;
imshow(decimate2);
title('Vertically Filtered');

filter_image3 = imfilter(decimate,h);
decimate3 = filter_image3(:,1:2:end);
figure;
imshow(decimate3);
title('Horizontally and Vertically Filtered');
axis on;

filter_image4 = imfilter(decimate3,hi);
interpolate = filter_image4(1:2:end,:);
upsample(filter_image4,2);
figure;
imshow(interpolate);
title('Horizontally Filtered');
axis on;

filter_image5 = imfilter(decimate3,hi);
interpolate2 = filter_image5(:,1:2:end);
figure;
imshow(decimate2);
title('Vertically Filtered');

filter_image6 = imfilter(interpolate,hi);
interpolate3 = filter_image6(:,1:2:end);
figure;
imshow(interpolate3);
title('Horizontally and Vertically Filtered');
axis on;

freqz2(hi)