clear all;
clc;

i= imread('lina.tif');
subplot(3,4,1)
imshow(i);
title('orignal image')
%method 1
sx=[-1,0,1;
    -2,0,2;
    -1,0,1];
sy=[-1,-2,-1;
    0,0,0;
    1,2,1];

i1=filter2(sx,i);
i11=abs(i1);
subplot(3,4,2)
imshow(i11,[]);
title('horizontal sobel of orignal image')

i2=filter2(sy,i);
i22=abs(i2);
subplot(3,4,3)
imshow(i22,[]);
title('vertical sobel of orignal image')

i12=i1+i2;
subplot(3,4,4)
imshow(i12,[]);
title('addition of sobel of orignal image')

%horizontal sobel of salt and pepper
n1=imnoise(i,'salt & pepper');
subplot(3,4,5)
imshow(n1,[]);
title('salt & pepper noise')

t1=filter2(sx,n1);
t11=abs(t1);
subplot(3,4,6)
imshow(t11,[]);
title('horizontal sobel of salt & pepper noise')

%vertical sobel of salt and pepper
t2=filter2(sy,n1);
t22=abs(t2);
subplot(3,4,7)
imshow(t22,[]);
title('vertical sobel of salt & pepper noise')

t12=t1+t2;
subplot(3,4,8)
imshow(t12,[]);
title('addition of sobel of salt & pepper noise')

n2=imnoise(i,'gaussian',0,0.05);
subplot(3,4,9)
imshow(n2,[]);
title('gaussian noise')

t3=filter2(sx,n2);
t33=abs(t3);
subplot(3,4,10)
imshow(t33,[]);
title('horizontal sobel of gaussian noise')

t4=filter2(sy,n2);
t44=abs(t4);
subplot(3,4,11)
imshow(t44,[]);
title('vertical sobel of gaussian noise')

t34=t3+t4;
subplot(3,4,12)
imshow(t34,[]);
title('addition of sobel of gaussian noise')
