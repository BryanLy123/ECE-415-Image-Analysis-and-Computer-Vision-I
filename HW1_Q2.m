I = imread('noise.jpg');
figure,imshow(I)
K = medfilt2(I);
imshowpair(I,K,'montage')