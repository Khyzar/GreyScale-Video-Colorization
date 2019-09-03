a = imread('ggg.jpg');
b = rgb2gray(a);
imwrite(b,'result.jpg');