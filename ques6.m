close all;
clear all;
clc;

i=imread('ques6a.tif');
subplot(2,3,1)
imshow(i);
title('image a')

f=fft2(i);
m=abs(f);
subplot(2,3,2);
imshow(m,[]);
title('mag of fft of a')

a=angle(f);
subplot(2,3,3);
imshow(a,[]);
title('angle of fft of a')

i1=imread('ques6b.tif');
subplot(2,3,4)
imshow(i1);
title('image b')


f2=fft2(i1);
m1=abs(f2);
subplot(2,3,5);
imshow(m1,[]);
title('mag of fft of b')

a1=angle(f2);
subplot(2,3,6);
imshow(a1,[]);
title('angle of fft of b')

k=m.*exp(1i*(a1));
%subplot(2,4,8);
figure,imshow(real(ifft2(k)),[]);
title('reconstructed image with magn. of a and phase of b')
e=(double(i1)-double(ifft2(k))).^2;
mse=mean2(e);
fprintf('MSE is %g\n',mse);

k1=m1.*exp(1i*(a));
%subplot(2,4,4);
figure,imshow(real(ifft2(k1)),[]);
title('reconstructed image with magn. of b and phase of a')
e1=(double(i)-double(ifft2(k1))).^2;
mse1=mean2(e1);
fprintf('MSE is %g',mse1);

