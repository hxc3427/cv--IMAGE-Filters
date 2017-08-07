close all;
clear all;
clc;

i = imread('t.tif');
t=i;
w=i;
w1=i;
subplot(2,3,1);
imshow(i,[]);
title('orignal image')
f= fspecial('gaussian',[5,5],0.5);
time1=tic;
fil = filter2(f,i,'same');
time2=toc(time1);
fprintf('time is %d\n',time2);
subplot(2,3,2)
imshow(fil,[]);
title('one timed filtered image')



fill=fil;

for i= 1:4
    fill = filter2(f,fill,'same');
end
subplot(2,3,3)
imshow(fill,[]);
title('five timed filtered image')


for i= 1:5
    fill = filter2(f,fill,'same');
end
subplot(2,3,4)
imshow(fill,[]);
title('ten timed filtered image')

for i= 1:10
    fill= filter2(f,fill,'same');
end
subplot(2,3,5)
imshow(fill,[]);
title('twenty timed filtered image')

fft =fftshift(fft2(t));

u= meshgrid(1:512);
v= meshgrid(1:512);
h= 1- 1./(1+((((sqrt((u-256).^2 +(v-256).^2)))./10).^10));
time3=tic;
k=fft.*h;
time4=toc(time3);
time= time2-time1;
fprintf('time is %d\n',time4);
k1= ifft2(k);
subplot(2,3,6);
imshow(abs(k1),[]);
title('coded filter image')
figure,freqz2(f);
figure,freqz2(h);




w = imresize(w, 0.5);
time1=tic;
filter2(f,w,'same');
time2=toc(time1);
fprintf('time is %d\n',time2);
w= fft2(w);
u1= meshgrid(1:256);
v1= meshgrid(1:256);
h1= 1- 1./(1+((((sqrt((u1-128).^2 +(v1-128).^2)))./10).^10));
time3=tic;
k=w.*h1;
time4=toc(time3);
fprintf('time is %d\n',time4);

w1 = imresize(w1,2);
time1=tic;
filter2(f,w1,'same');
time2=toc(time1);
fprintf('time is %d\n',time2);
w1= fft2(w1);
u2= meshgrid(1:1024);
v2= meshgrid(1:1024);
h2= 1- 1./(1+((((sqrt((u2-512).^2 +(v2-512).^2)))./10).^10));
time3=tic;
k=w1.*h2;
time4=toc(time3);
fprintf('time is %d\n',time4);


