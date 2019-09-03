function  [obs2] = Step1(sample) 
[rows columns] = size(sample);
K = 1; 
obs2(1,:) = 0; 
obs2(2,:) = 0; 
obs2(:,1) = 0; 
obs2(:,2) = 0; 
 
obs2(rows-1,:) = 0; 
obs2(rows,:) = 0; 
obs2(:,columns-1) = 0; 
obs2(:,columns) = 0; 
     
for x = K + 1:rows- K % Rows 
        for y = K + 1:columns - K % Columns 
            sum = 0; 
             
            %Search for its neighbour matrix 
            for a = x-K : x+K 
                for b = y-K : y+K 
                    if a == x & b == y % Leave the pixel itself as it is 
                        ; 
                    else  
                        % Add current neigbouring pixel's value to sum to 
                        % compute fuzzy wean wieght 
                       sum = sum + ( double(sample(a,b)) - double(sample(x,y)) );  
                    end 
                end   
            end 
 
            % Compute average weight of the neighbouring pixels  
            obs2(x,y) = abs(round( sum / ( ( 2 * K + 1) *( 2 * K + 1) - 1) )); 
        end 
end 
 
end 