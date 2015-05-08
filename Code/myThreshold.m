%% Problem 1:  Choosing a Threshold
% Given an image and initial threshold T(estimated in code) our task is to apply the
% incremental adaptive threshold algorithm to reproduce the image.
% Moreover, we need to test the code using two seperate images. Function myThreshold(IM) takes image IM as an argument. User needs to
% call the function using following command: myThreshold('lena.jpg')
%% Code
function myThreshold(IM)
f=imread(IM); %read input image
f=im2double(f);
T=0.5*(min(f(:))+max(f(:))); %intial estimate is T
change=false;
while ~change  % loop until change is negligible
    
    Object1 = f<T;
    Object2 = ~Object1;
    mu1 = mean(f(Object1)); % average intesity of object1
    mu2 = mean(f(Object2)); % average intesity of object2
    T_new = 0.5 * (mu1 + mu2); % new estimate is T_new
    change=abs(T-T_new)<0.1;  % calculating change
    T=T_new;
end
r=im2bw(f,T);
figure,
% showing input image
subplot(1,2,1),imshow(f),title('Given Image'); 
% showing image after thresholding
subplot(1,2,2),imshow(r),title('After Thresholding'); 
