%% Problem 2:  Hough Transform for Detecting Lines (Subproblem [a])
% Given an image IM and line parameters (rho,theta) that passes through
% point (x,y) our task is to draw the line on top of the image. We name our
% function as drawLine(rho,theta,IM) that takes 3 arguments as input where
% first two arguments denotes line parameters i.e. (rho,theta) and the
% third one is image IM. Output of the function is a plot showing the line
% on top of the given image. Sample instruction for calling the function: drawLine(5,2,'lena.jpg');
%% Code
function drawLine(rho,theta,IM)
f=imread(IM); %read input image
imshow(f); %show image
hold on
syms x y
h = ezplot(x * cos(theta) + y * sin(theta) - rho,[-256,256,-256,256]); % plot line
set(h,'Color','red');
title('Line on top of image');
colorbar;
hold off

