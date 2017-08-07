close all;
clear all;
clc;
%%
t=linspace(0, 4*pi/2, 512);
y=sin(2*t*6);
plot(y);
% blankimage = zeros(512,512);
blankimage=zeros(size(y));
onesimage=ones(size(y));
% imshow(blankimage);
z=onesimage'*y;

t=linspace(0, 5*pi/2, 512);
y=sin(2*t*6);



z1=onesimage'*y;

t=linspace(0, 5*pi/2, 512);
y=sin(2*t*11);
plot(y);
% blankimage = zeros(512,512);
% zeroMatrix=zeros(size(y));
% imshow(blankimage);
z2=onesimage'*y;
%%
figure,imshow(z,[]);
title('image[A] constructed with integral no of sine cycles')
figure,imshow(z1,[]);
title('image[B] constructed with non-integral no of sine cycles')
figure,imshow(z2,[]);
title('image[C] constructed with non-integral no of sine cycles with different frequency')
%%

q=log(abs(fftshift(fft2(z))));
q1=log(abs(fftshift(fft2(z1))));
q2=log(abs(fftshift(fft2(z2))));
%%
figure,imshow(q,[]);
title('DFT of image[C]')
figure,imshow(q1,[]);
title('DFT of image[C]')
figure,imshow(q2,[]);
title('DFT of image[C]')