%%%%%%%%%%%%%%%%% 影视工程系数字图像处理课程实验：实验3 高频阻断（低通）%%%%%%%%%%%%%%%%%%%%%%%%
% 读图（要换成你自己的图片）
clear;
orgImage1 = imread('PingGuo.jpg'); 
orgImage=rgb2gray(orgImage1);
subplot(2,2,1); imshow(orgImage); 
fftImage =((fft2(orgImage)));  % 使用fft2变换 % 2d fft 
ampImage= abs(fftImage); 
[h w]=size(orgImage1);
subplot(2,2,2); imshow(ampImage,[0 20000]); 
for i=w/3/2-730:w/3/2+730%擦除高频分量
    for j=h/2-480:1:h/2+480
       fftImage(j,i)=0;
    end
end
subplot(2,2,3); imshow(abs(fftImage),[0 20000]); 
s=ifft2((fftImage));
subplot(2,2,4); imshow(s,[0 255]);%imshow(s/200);
%%%%思考：shift的目的(与实验4比较，实验3不用shift函数)%%%%%%%%%%%%%
%%%将图像的第一象限与第三象限交换，将第二象限与第四象限交换,用于把低频放到区域中心，以便一起进行低频阻断