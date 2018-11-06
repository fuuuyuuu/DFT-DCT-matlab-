clear all;

I = imread('E:\matlab2016b\homework_image\付裕+515142910021\cc.jpg');
imgray = rgb2gray(I);
%imgray = im2double(imgray);
subplot(1,3,1);
imshow(imgray);
title('原图');


im1= im2double(imgray);
im1 = blkproc(im1,[8,8],'DCT_P');
subplot(2,3,2);
imshow(im1);
title('分块DCT');

im2 = blkproc(im1,[8,8],'IDCT');
subplot(2,3,5);
imshow(im2);
title('分块IDCT');

im3 = im2double(imgray);
im3 = blkproc(im3,[8,8],'DFT_P');
subplot(2,3,3);
imshow(im3);
title('分块DFT');

im4 = blkproc(im3,[8,8],'IDFT');
subplot(2,3,6);
imshow(im4);
title('分块IDFT');

