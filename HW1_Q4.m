I = imread('noise.jpg');
figure, imshow(I)
title('Original Image')
X = uint8(I)/255;
h = [1/4 1/4; 1/4 1/4];
y = conv2(X,h,'same');
figure, imshow(y)
title('Convolved Image')