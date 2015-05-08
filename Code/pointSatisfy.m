%% Problem 2c:  Hough Transform for Detecting Lines (Subproblem [c])
% Given an edge location (x_e,y_e), line parameters (rho,theta) and tolerance k, our task is 
% test whether point (x_e,y_e) satisfies the given line or not. We write a
% function named pointSatisfy(x_e,y_e,rho,theta,k) that takes 5 arguments
% as input and returns either true (if point satisfies line) or false (if
% point doesn't satisfy line). 
% Calling instruction: output = pointSatisfy(3,6,5,2,1). 
% We tested the function using two edge locations (3,6) and (10,50) where (3.6) satisfies the line
% but (10,50) does not satisfy.
%% Code
function output = pointSatisfy(x_e,y_e,rho,theta,k)
syms x y
if((x_e * cos(theta) + y_e * sin(theta))<=rho+k && ...
    (x_e * cos(theta) + y_e * sin(theta))>=rho-k)
    
    output = true; % satisfies
else
    output = false; % does not satisfy
end

