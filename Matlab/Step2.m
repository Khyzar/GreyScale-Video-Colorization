function  [obs1] = Step2(obs2)
[rows columns] = size(obs2);
K = 1; 
obs1(1,:) = 0; 
obs1(2,:) = 0; 
obs1(:,1) = 0; 
obs1(:,2) = 0; 
 
obs1(rows-1,:) = 0; 
obs1(rows,:) = 0; 
obs1(:,columns-1) = 0; 
obs1(:,columns) = 0; 
     
for x = K + 1:rows- K % Rows 
        for y = K + 1:columns - K % Columns 
            sum = 0; 
             
            %Search for its neighbour matrix 
            for a = x-K : x+K 
                for b = y-K : y+K                     
                   % Add current neigbouring pixel's value to sum to 
                   % compute fuzzy wean wieght 
                   sum = sum + double(obs2(a,b)); 
                end   
            end 
 
            % Compute average weight of the neighbouring pixels  
            obs1(x,y) = abs(round( sum / ( ( 2 * K + 1) *( 2 * K + 1) ) )); 
        end 
    end 
end 