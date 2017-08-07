close all;
clear all;
clc;
%%
i=imread('lina.tif');
subplot(2,2,1)
imshow(i);
title('orignal image');
%%
f=fft2(i);
f1=fftshift(f);
f2=log(abs(f1));
subplot(2,2,2);
imshow(f2,[]);
title('fft of orignal image');

subplot(2,2,3);
imshow(abs(f1),[]);
title('fft of orignal image without log');
%%
fi= ifft2(f);
subplot(2,2,4);
imshow(fi,[]);
title('ifft of fft image');
%%
[Row Col] = size(i);
m=sum(sum((uint8(i(:,:))-uint8(fi(:,:))).^2));
mse=m/(Row*Col);
fprintf('MSE is %g\n',mse);
% figure,plot(mse);
%%
% i=im2double(i);
[x,y] =meshgrid(-256 : 255, -256 : 255);
z= (x).^2 + (y).^2 <= (512/4)^2;
r=f1.*z;
rd= log(abs(r));
figure,
subplot(4,2,2);
imshow(ifft2(r),[]);
title('zeroing out all frequencies outside a radius of N/4.')
subplot(4,2,1);
imshow(rd,[]);
title('abs of fft of the image');
m=sum(sum(uint8(i(:,:))-uint8(ifft2(r(:,:)))).^2);
mse=m/(Row*Col);
fprintf('MSE is %g\n',mse);
% figure,plot(mse);
%%
% i=im2double(i);
[x,y] =meshgrid(-256 : 255, -256 : 255);
z= (x).^2 + (y).^2 <= (512/8)^2;
r1=f1.*z;
rd1=log(abs(r1));
subplot(4,2,4);
imshow(ifft2(r1),[]);
title('zeroing out all frequencies outside a radius of N/8.')
subplot(4,2,3);
imshow(rd1,[]);
title('abs of fft of the image');
m=sum(sum(uint8(i(:,:))-uint8(ifft2(r1(:,:)))).^2);
mse=m/(Row*Col);
fprintf('MSE is %g\n',mse);
% figure,plot(mse);
%% 
% 
% i=im2double(i);
[x,y] =meshgrid(-256 : 255, -256 : 255);
z= (x).^2 + (y).^2 <= (512/16)^2;
r2=f1.*z;
rd2=log(abs(r2));
subplot(4,2,6);
imshow(ifft2(r2),[]);
title('zeroing out all frequencies outside a radius of N/16.')
subplot(4,2,5);
imshow(rd2,[]);
title('abs of fft of the image');
m=sum(sum(uint8(i(:,:))-uint8(ifft2(r2(:,:)))).^2);
mse=m/(Row*Col);
fprintf('MSE is %g\n',mse);
% figure,plot(mse);
%%
% 
% % i=im2double(i);
[x,y] =meshgrid(-256 : 255, -256 : 255);
z= (x).^2 + (y).^2 <= (512/32)^2;
r3=f1.*z;
rd3=log(abs(r3));
subplot(4,2,8);
imshow(ifft2(r3),[]);
title('zeroing out all frequencies outside a radius of N/32.')
subplot(4,2,7);
imshow(rd3,[]);
title('abs of fft of the image');
m=sum(sum(double(i(:,:))-double(ifft2(r3(:,:)))).^2);
mse=m/(Row*Col);
fprintf('MSE is %g\n',mse);
% figure
% plot( mse);
% xlabel 'quality factor'
% ylabel 'MSE'
