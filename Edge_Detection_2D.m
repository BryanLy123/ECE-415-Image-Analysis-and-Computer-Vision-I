close all
clc;

%Input of Original Clean Image
orig_image = imread('car.jpg');
imshow(orig_image);
title('Original Clean Image');
figure; 

%Input of Noisey Image
noise_image = imread('car_noise.jpg');
imshow(noise_image);
title('Image with Noise');
figure;

%Applying Gaussian Noise to image with lack of noise
if size(noise_image, 3) == 3
    noise_image = rgb2gray(noise_image);
end

app_image = imnoise(noise_image, 'gaussian');
figure;
imshow(app_image);
title('Image with Gaussian Noise');

%Using Canny Method to detect Image Edges
edge_detect = edge(app_image, 'zerocross');
figure;
imshow(edge_detect);
title('Edge Detected Image');

%Using Gaussian Filtration on applied image
filter_image = imgaussfilt(app_image, 1);
figure;
imshow(filter_image);
title('Filtered Image');

%Conversion of images to double values
a = double(orig_image);
b = double(noise_image);
c = double(filter_image);

%Comparison between Original Image and Noisey Image
v = a-b;

figure;
freqz2(v);
figure;
mesh(abs(fft2(v)));
figure;

%Comparison between Original Image and Filtered Image
x = a-c;

figure;
freqz2(x);
figure;
mesh(abs(fft2(x)));
figure;

%Comparison between Filtered Image and Noise Image
y = c-b;

figure;
freqz2(y);
figure;
mesh(abs(fft2(y)));
figure;

%Peak Signal-to-Noise Ratio of Noisey Image vs Original Image
peak_psnrs_1 = psnr(noise_image,orig_image,"DataFormat","SSCB");
peak_psnrs_1 = squeeze(peak_psnrs_1)

%Peak Signal-to-Noise Ratio of Filtered Image vs Original Image
peak_psnrs_2 = psnr(filter_image,orig_image,"DataFormat","SSCB");
peak_psnrs_2 = squeeze(peak_psnrs_2)
