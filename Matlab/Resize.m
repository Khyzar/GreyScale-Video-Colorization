function [P]=Resize(video,image,choice,option,counter,resize)
disp('Resizing...');
movObj = VideoReader(video);
numOfFrames = movObj.NumberOfFrames;
 path='C:\Users\khyzar\Documents\MATLAB\out';
coun=counter;
format='.avi';
%videoName=strcat('out',coun,format);
fullpath=strcat(path,coun,format);
opVideo = VideoWriter(fullpath);
open(opVideo);
for indexer = 1 : numOfFrames
frame = imresize(read(movObj, indexer),resize);
writeVideo(opVideo,frame);
end
close(opVideo);
disp('DONE!');
P=Main(fullpath,image,choice,option,counter);
end