function [Path] = Main(video,image,choice,option,counter)
disp('Progress....');
% video = video file name | image = image name | choice = merge result or
% not |option = 1 also defog the video 
singleRV = VCT(video,image,option,counter);
if(choice == 1)% merge the videos 
  mergedRV = VideoJoiner(video,singleRV,counter);
  Path = mergedRV.Path;
else %     simple code
    Path = singleRV.Path;
end
end