function [outputVideo] = VideoJoiner(firstV,obj,counter)

vid1 = VideoReader(firstV);
cd(obj.Path);
vid2 = VideoReader(obj.Filename);
path='E:\New folder (4)\NewVideo';
coun=counter;
format='.avi';
fullpath=strcat(path,coun,format);
% new video
outputVideo = VideoWriter(fullpath);
outputVideo.FrameRate = vid1.FrameRate;
open(outputVideo);

numOfFrames = vid1.NumberOfFrames;

for  indexer = 1 : numOfFrames
    img1 = read(vid1, indexer);
    img2 = read(vid2, indexer);
    imgt = horzcat(img1, img2);
    writeVideo(outputVideo, imgt);
end
close(outputVideo);
end