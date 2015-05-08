%% Hough Transform for Detecting Lines (Subproblem [d,e,f])
% Task of 2d is to test which line equation each eadge point found in 2b satisfies.
% Task of 2e is to find out the line that obtains vote above threshold.
% Task of 2f is to test the code with at least 2 images.
% We create a function named lineTest(IM) that takes the image IM as
% argument and finds out which line receives vote more than specified
% threshold (e.g. 45). We have tested the function for two images in order
% to satisfy the requirement of 2f. We have manually set (rho,theta) for
% creating 4 lines.
%% Code
function lineTest(IM) %does the job of 2d,2e and 2f
I=imread(IM);
f =  rgb2gray(I);
BW = edge(f,'canny');
[m,n] = size(BW);
location = []; % this array holds edge points
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
[m,n]=size(f);

figure,
subplot(1,2,1),imshow(BW),

hold on
syms x y
rho_theta = [80,2;20,2;-10,2;-40,2]; % four example lines
for i = 1:size(rho_theta)
   h = ezplot(x * cos(rho_theta(i,2)) + y * sin(rho_theta(i,2))... 
   - rho_theta(i,1),[-m,m,-n,n]); % plot lines 
   set(h,'Color','red');
end
title('Lines on top of image'),
hold off;
[totalLines,dim] = size(rho_theta);
whichLineSatisfy = zeros(location_counter,1); 
% whichLineSatisfy array will store which line the edge point satisfies (2e)
voteArray = zeros(totalLines,1);
for i=1:size(location)
    for j = 1:totalLines
       if(pointSatisfy(location(i,1),location(i,2),...
           rho_theta(j,1),rho_theta(j,2),2))
        whichLineSatisfy(i,1) = j; % edge point satisfies line j
        voteArray(j,1) = voteArray(j,1) + 1;
       end 
    end    
end

subplot(1,2,2),imshow(BW),
hold on
for i=1:size(voteArray)
    if(voteArray(i,1)>45)
         h = ezplot(x * cos(rho_theta(i,2)) + y * sin(rho_theta(i,2))...
         - rho_theta(i,1),[-m,m,-n,n]); % plot line 
         set(h,'Color','red');
    end
end
title('Lines receiving votes>45'),
hold off;