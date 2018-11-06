clear all;

I = imread('E:\matlab2016b\homework_image\付裕+515142910021\aa.jpg');
imgray = rgb2gray(I);
subplot(1,3,1);
imshow(imgray);
title('原图');

im1 = imgray;
im1 = double(im1);
im1 = DFT(im1);
subplot(2,3,2);
imshow(im1);
title('DFT正变换');


im2 = im1;
im2 = IDFT(im2);
im2 = uint8(im2);
subplot(2,3,5);
imshow(im2);
title('DFT反变换');

im3 = imgray;
im3 = double(im3);
im3 = DCT(im3);
subplot(2,3,3);
imshow(im3);
title('DCT正变换');

im4 = im3;
im4 = IDCT(im4);
im4 = uint8(im4);
subplot(2,3,6);
imshow(im4);
title('IDCT反变换');