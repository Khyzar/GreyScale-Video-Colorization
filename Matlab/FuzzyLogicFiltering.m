function [Output] = FuzzyLogicFiltering(org)
  
sample = org;
[rows columns width] = size(sample);

sample(1,:) = org(1,:); 
sample(2,:) = org(2,:); 
sample(:,1) = org(:,1); 
sample(:,2) = org(:,2); 
 
sample(rows-1,:) = org(rows-1,:); 
sample(rows,:) = org(rows,:); 
sample(:,columns-1) = org(:,columns-1); 
sample(:,columns) = org(:,columns); 
 
% Offset to measure the size of pixel matrix 
K = 1;  
 
% No of noisy pixels found in the image 
victims1 = 0; 
victims2 = 0; 
 
epsilon = 20; 
 
% Place the input to the output matrix before manipulation 
      for x = 1:rows 
          for y = 1:columns 
              obs1(x,y) = 0; 
              temp(x,y) = 0; 
          end 
      end 
     
    % **************** First Detection Unit  
    % Step 1 
    obs2 = Step1(sample); 
    
    % Step 2 
    obs1 = Step2(obs2); 
    
    %Differentiation 
    for x = K + 1:rows- K % Rows 
        for y = K + 1:columns - K % Columns 
            % Compute differences 
            temp(x,y) =  abs( double(obs1(x,y)) - double(obs2(x,y)) ); 
        end 
    end 
    %Fuzzy Rule 1  
    [obs1,victims1] = FuzzyRule1(temp,epsilon);  
     
    % **************** Second Detection Unit  
    %Fuzzy Rule 2 & 3 Gradients 
    [obs2,victims21,victims22] = FuzzyRule2n3(sample,epsilon); 
     
    common = 0; 
    for x = 1:rows 
          for y = 1:columns 
              if obs1(x,y) > 0 | obs2(x,y) > 0 
                  temp(x,y) = 255; 
                  common = common + 1; 
              else 
                  temp(x,y) = -1; 
              end                   
         end 
    end 
 
     
%      Output = ApplyOriginalFilter(temp,sample); 
     Output = ApplyFilter(temp,sample);
end