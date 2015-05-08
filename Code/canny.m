%% Problem 2:  Hough Transform for Detecting Lines (Subproblem [b])
% Given an image, our task is to find edge locations (x_e,y_e) and drawing each
% location in red color where we utilize canny edge detector for detecting edges. 
% We write a function named canny(IM) that takes an image IM as argument and performs the given task. 
% This function is tested with couple of images.

%% Code
function canny(IM)
I=imread(IM); % input image
f =  rgb2gray(I); % transforming to gray
BW = edge(f,'canny'); 
% BW contains 1 in those locations where there are edges and 0 otherwise
[m,n] = size(BW);
location = []; % this array holds edge locations
location_counter = 1;
for i=1:m
    for j=1:n
        if(BW(i,j)==1)
            location(location_counter,2) = i; 
            location(location_counter,1) = j;
            location_counter = location_counter+1;
        end
    end
end
location_counter = location_counter-1;
figure,
% plotting detected edges by canny edge detector
subplot(1,2,1),imshow(BW),title('edges detected by canny edge detector'); 
% plotting detected edge points in red color
subplot(1,2,2),imshow(BW),hold on,
gscatter(location(:,1),location(:,2)),
title('detected edge points in red color'),hold off;

    