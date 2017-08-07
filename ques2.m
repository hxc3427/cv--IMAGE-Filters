clear all;
clc;

i= imread('t.tif');%reading image file
subplot(3,3,1);
imshow(i,[]);
title('orignal image')
t=im2double(i);%convert image to double
w=var(t(:));%taking variance of the indexed image

%adding salt & pepper noise to the image
n1=imnoise(i,'salt & pepper');
subplot(3,3,2);
imshow(n1,[]);
title('salt & pepper noise')
t1=im2double(n1); %convert image to double
w1=var(t1(:));  %taking variance of the indexed image
snr1= 10*log10(w/w1); %calculating SNR value
fprintf('snr1 is %g\n',snr1);

mf1=medfilt2(n1);%filtering salt & pepper image with median filter
subplot(3,3,5);
imshow(mf1);
title('median filter on salt and pepper noise')

f= fspecial('gaussian',5,5); %gaussian filter
gf1 = filter2(f,n1,'full');%filtering salt & pepper image with median filter 
subplot(3,3,8);
imshow(gf1,[]);
title('gaussian filter on salt and pepper noise')

%adding gaussian noise to the image
n2=imnoise(i,'gaussian',0,0.05);
subplot(3,3,3);
imshow(n2,[]);
title('gaussian noise')
t2=im2double(n2);%convert image to double
w2=var(t2(:));%taking variance of the indexed image
snr2= 10*log10(w/w2);%calculating SNR value
fprintf('snr2 is %g',snr2);

mf2=medfilt2(n2);%filtering gaussian image with median filter
subplot(3,3,6);
imshow(mf2);
title('median filter on gaussian noise')

gf2 = filter2(f,n2,'full');%filtering gaussian image with gaussian filter
subplot(3,3,9);
imshow(gf2,[]);
title('gaussian filter on gaussian noise')