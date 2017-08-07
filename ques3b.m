clear all;
clc;
i= imread('lina.tif');
subplot(3,3,1)
imshow(i);
title('orignal image')

s =edge(i,'sobel');
subplot(3,3,2)
imshow(s);
title('sobel of orignal image')

% s =edge(i,'sobel','vertical');
% subplot(3,3,3)
% imshow(s);


n1=imnoise(i,'salt & pepper');
subplot(3,3,4)
imshow(n1);
title('salt & pepper noise')

s1 =edge(n1,'sobel');
subplot(3,3,5)
imshow(s1);
title('sobel of salt & pepper noise')
% s11 =edge(n1,'sobel','vertical');
% subplot(3,3,6)
% imshow(s11);



n2=imnoise(i,'gaussian',0,0.05);
subplot(3,3,7)
imshow(n2);
title('gaussian noise')

s2 =edge(n2,'sobel');
subplot(3,3,8)
imshow(s2);
title('sobel of gaussian noise')
% s22 =edge(n2,'sobel','vertical');
% subplot(3,3,9)
% imshow(s22);


mf1=medfilt2(n1);
s11 =edge(mf1,'sobel');
subplot(3,3,6)
imshow(s11);
title('sobel of median filter on salt & pepper noise')

f= fspecial('gaussian',5,5); %gaussian filter
s12 =edge(n2,'sobel');
gf1 = filter2(f,s12,'full');%filtering salt & pepper image with median filter 
subplot(3,3,9);
imshow(gf1,[]);
title('sobel of gaussian filter on gaussian noise')

% mf2=medfilt2(n2);
% s12 =edge(mf2,'sobel');
% subplot(3,3,9)
% imshow(s12);
% title('sobel of median filer on gaussian noise')