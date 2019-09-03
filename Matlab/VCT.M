function [opVideo]=VCT(filename,impector,option,counter)

movObj = VideoReader(filename);
 effector = imread(impector);
 path='E:\New folder (4)\out';
coun=counter;
format='.avi';
fullpath=strcat(path,coun,format);
opVideo = VideoWriter(fullpath);
open(opVideo);

numOfFrames = movObj.NumberOfFrames;
temp = numOfFrames/10;
percent = 10;
for indexer = 1 : numOfFrames
    if(~mod(indexer,temp))
    disp(percent);
    percent = percent + 10;
    end
currentFrame = gray2rgb(read(movObj, indexer),effector);
if(option == 1)
currentFrame = Main2(currentFrame,'he');
imwrite(currentFrame,'Khyzer.jpg');
currentFrame = imread('Khyzer.jpg');
end
writeVideo(opVideo,currentFrame);
% writeVideo(opVideo,double(currentFrame(:,:,:))/65536);
end     
close(opVideo);
end
