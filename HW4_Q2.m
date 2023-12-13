I = imread('boat.jpg');
I = im2double(I);

numBlkH = 8;
numBlkW = 8;
[imgH,imgW,~] = size(I);
szBlkH = [repmat(fix(imgH/numBlkH),1,numBlkH-1) imgH-fix(imgH/numBlkH)*(numBlkH-1)];
szBlkW = [repmat(fix(imgW/numBlkW),1,numBlkW-1) imgW-fix(imgW/numBlkW)*(numBlkW-1)];
C = mat2cell(I, szBlkH, szBlkW)';
C = C(:);

figure 
imshow(I)
figure
for i=1:numBlkH*numBlkW
    subplot(numBlkH,numBlkW,i), imshow( C{i} )
end

T = dctmtx(8);
dct = @(block_struct) T * block_struct.data * T';
B = blockproc(I,[8 8],dct);
mask = [1   1   1   0   0   0   0   0
        1   0   0   0   0   0   0   0
        1   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0];
B2 = blockproc(B,[8 8],@(block_struct) mask .* block_struct.data);
invdct = @(block_struct) T' * block_struct.data * T;
I2 = blockproc(B2,[8 8],invdct);
figure
imshow(I2)

MSE1 = mean((I2 - I).^2);
fprintf('Mean Square Error (Clean vs. Noisy): %.4f\n', MSE1);
