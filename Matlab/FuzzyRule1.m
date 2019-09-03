function  [obs1,victims1] = FuzzyRule1(temp,epsilon) 
[rows columns] = size(temp);
K = 1; 
temp(1,:) = 0; 
temp(2,:) = 0; 
temp(:,1) = 0; 
temp(:,2) = 0; 
 
temp(rows-1,:) = 0; 
temp(rows,:) = 0; 
temp(:,columns-1) = 0; 
temp(:,columns) = 0; 
 
obs1(1,:) = 0; 
obs1(2,:) = 0; 
obs1(:,1) = 0; 
obs1(:,2) = 0; 
 
obs1(rows-1,:) = 0; 
obs1(rows,:) = 0; 
obs1(:,columns-1) = 0; 
obs1(:,columns) = 0; 
victims1 = 0; 
   
    for x = K + 1:rows- K % Rows 
        for y = K + 1:columns - K % Columns 
%      for x = K + 1: 2 % Rows 
%          for y = K + 1: 2 % Columns 
            min = double(temp(x,y)); 
     
            %Search for its neighbour matrix 
            for a = x-K : x+K 
                for b = y-K : y+K                     
                   % Add current neigbouring pixel's value to sum to 
                   % compute fuzzy wean wieght 
    
                   if (double(temp(a,b)) < min) 
                       min = double(temp(a,b)); 
                   end 
                end  
            end 
 
            if( min > 0) 
                aa = min; 
                bb = aa + (0.2 * aa); 
                 
 
                fuz = trapmf(double(temp(a,b)), [ aa, bb, 1, 1 ]); 
%                 sprintf('x %d, y %d,temp(x,y) %d,a %d,b %d,fuzz %d,',x,y,temp(x,y),aa,bb,fuz) 
                if fuz >= bb 
%                     sprintf('x %d, y %d,temp(x,y) %d,a %d,b %d,fuzz %d,',x,y,temp(x,y),aa,bb,fuz) 
                    victims1 = victims1 + 1; 
                end 
                obs1(x,y) = fuz; 
 
                if ( abs(double(temp(x,y)) - bb) > epsilon) 
                    obs1(x,y) = double(temp(x,y)); 
                    victims1 = victims1 + 1; 
%                     sprintf('temp(%d,%d) = %d,b = %d',x,y,temp(x,y),bb) 
                else 
                    obs1(x,y) = -1; 
                end                 
            end 
            
        end 
    end 