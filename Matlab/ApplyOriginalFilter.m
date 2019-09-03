function [output] = ApplyOriginalFilter(noisedist,input) 
%     org = imread('Fog3.jpg');
    [rows columns width] = size(input);
    for x = 1:rows
              for y = 1:columns
                  if noisedist(x,y) == 255 
                      output(x,y) = org(x,y); 
                  else 
                      output(x,y) = input(x,y); 
                  end                   
             end 
    end     
end