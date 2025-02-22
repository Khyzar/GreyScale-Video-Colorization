function A = Airlight(HazeImg, method, wsz)
% estimating the global airlight
%
if strcmp(method, 'manual')
%      imshow(HazeImg, []); 
%     title('manual airlight estimation: left click to pick a most hazy pixel. ')
    [x, y] = ginput(1);
    A = HazeImg(round(y), round(x), :);
    A = double(A) -1;
    A = min(A, 255);
elseif strcmp(method, 'he')
    A = airlight_he(HazeImg, wsz);    
elseif strcmp(method, 'our')
    A = airlight_our(HazeImg, wsz);
else
    error('parameter error.');
end

%% 
function A = airlight_our(HazeImg, wsz)
% estimating A channel by channel separately
for k = 1 : 3
    minImg = FuzzyLogicFiltering(double(HazeImg(:, :, k)));
    A(k) = max(minImg(:));
end

%%
function A = airlight_he(HazeImg, wsz)
% estimating A using He's method
hsv = rgb2hsv(HazeImg);
GrayImg = hsv(:, :, 3);
[nRows, nCols, bt] = size(HazeImg);

% computing dark channel
DarkImg = min(double(HazeImg), [], 3);
% DarkImg = ordfilt2(DarkImg, 1, ones(wsz), 'symmetric');
DarkImg = FuzzyLogicFiltering(DarkImg);
% 
topDark = sort(DarkImg(:), 'descend');
idx = round(0.001 * length(topDark));
val = topDark(idx); 
id_set = find(DarkImg >= val);  % the top 0.1% brightest pixels in the dark channel
BrightPxls = GrayImg(id_set);
iBright = find(BrightPxls >= max(BrightPxls));
id = id_set(iBright); id = id(1);
row = mod(id, nRows);
col = floor(id / nRows) + 1;

% A is a vector
A = HazeImg(row, col, :);
A = double(A(:));

