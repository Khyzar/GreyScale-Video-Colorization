function [r] = Main2(HazeImg,method)

% input an image
%  imshow(HazeImg, []);

% estimating the global airlight
% method = 'our'; 
% method = 'he'; 
% method = 'he'; 
wsz = 15; % window size
A = Airlight(HazeImg, method, wsz); 

% calculating boundary constraints
wsz = 3; % window size
ts = Boundcon(HazeImg, A, 30, 300, wsz);

% refining the estimation of transmission
lambda = 2;  % regularization parameter, the more this parameter, the closer to the original patch-wise transmission
t = CalTransmission(HazeImg, ts, lambda, 0.5); % using contextual information

% dehazing
r = Defog(HazeImg, t, A, 0.85); 

% show and save the results

%  imshow(ts, []);
%  imshow(1-t, []); colormap hot;
%  imshow(r, []);
end