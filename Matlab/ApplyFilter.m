function [output] = ApplyFilter(noisedist,input) 
%  obs2 = imread('input.bmp','bmp'); 
 [rows columns width] = size(input);

SimilarityMatrix(1,:) = 0; 
SimilarityMatrix(2,:) = 0; 
SimilarityMatrix(:,1) = 0; 
SimilarityMatrix(:,2) = 0; 
 
SimilarityMatrix(rows-1,:) = 0; 
SimilarityMatrix(rows,:) = 0; 
SimilarityMatrix(:,columns-1) = 0; 
SimilarityMatrix(:,columns) = 0; 
 
    K = 1; 
     
    for x = 1:rows 
          for y = 1:columns 
              output(x,y) = input(x,y); 
          end 
    end 
       
    % Find level of similarity of pixels 
    [rows_ columns_ width_] = size(noisedist);
    for x = K + 1:rows_- K % Rows 
        for y = K + 1:columns_ - K % Columns 
%      for x = K + 1: 2 % Rows 
%          for y = K + 1: 2 % Columns 
 
            counter = 1; 
            if noisedist(x,y) == 255 
                % Search for its neighbour matrix 
                % Create List of neighbours 
                for a = x-K : x+K 
                    for b = y-K : y+K                     
                       % Add current neigbouring pixel's value to sum to 
                       % compute fuzzy wean wieght 
                        Xlist(counter) = double(input(a,b)); 
                        counter = counter + 1; 
                    end  
                end 
 
                % Sort Neighbour List 
                for a = 1 : length(Xlist) 
                    for b = 1 : length(Xlist) - 1                  
                       % Add current neigbouring pixel's value to sum to 
                       % compute fuzzy wean wieght 
                       if Xlist(a) < Xlist(b) 
                           t = Xlist(a); 
                           Xlist(a) = Xlist(b); 
                           Xlist(b) = t; 
                       end 
                    end  
                end 
               
                % Find P as distance b/w elements of Xlist 
                P = 0; 
                for a = 2 : length(Xlist) 
                   P =  P + abs( Xlist(a) - Xlist( a-1 ) );                    
                end 
 
                %Find X as median of the list 
                X = Xlist(5); 
                                 
                P1 = X - P; 
                P2 = X - ( 1.1 * P ); 
                 
                Q1 = X + P; 
                Q2 = X + ( 1.1 * P ); 
                 
%                 sprintf ('X = %d, P = %d, P1 = %d, P2 = %d,Q1 = %d, Q2 = %d',X,P,P1,P2,Q1,Q2); 
                sim = trapmf(double(input(x,y)), [ P2, P1, Q1, Q2 ]); 
%                 sprintf ('input(%d,%d) =  %d, sim = %d',x,y,double(input(x,y)),sim); 
                 
                SimilarityMatrix(x,y) = sim; 
                 
                 
            else 
                 
                output(x,y) = input(x,y); 
            end 
             
        end 
    end 
    
    denominator = 0; 
    numerator = 0; 
    % Apply Filteration Formula 
    for x = K + 1:rows- K % Rows 
        for y = K + 1:columns - K % Columns 
            %Search for its noisy pixels 
            if noisedist(x,y) == 255 
                for a = x-K : x+K 
                    for b = y-K : y+K 
                        denominator = denominator + ( double(input(a,b)) * SimilarityMatrix(a,b) ); 
                        numerator = numerator + SimilarityMatrix(a,b); 
                    end   
                end 
 
                lamda = SimilarityMatrix(x,y); 
 
                output(x,y) =  ( 1 - lamda) * ( denominator / numerator ) + ( lamda * double(input(x,y)) ); 
            else                 
                output(x,y) = input(x,y); 
            end     
        end 
    end 
    output ;
end