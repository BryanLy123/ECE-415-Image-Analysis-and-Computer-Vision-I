input_image = im2gray(imread('chess.jpg'));
threshold=graythresh(A);
value =imbinarize(input_image,threshold);
imdata=reshape(A,[],1);
imdata=double(imdata);
[imdx, mn]=kmeans(imdata,2);
imIdx=reshape(imdx,size(A));
imshow(imIdx,[]);