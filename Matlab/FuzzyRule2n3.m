function [obs2,victims21,victims22] = FuzzyRule2n3(sample,epsilon) 
[rows columns] = size(sample);
    K = 2; 
    victims21 = 0; 
    victims22 = 0; 
 
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
               
            %pix = double ( sample (x,y) ); 
            %Search for its neighbour matrix 
            for a = x- (K-1): x+ (K-1) 
                for b = y-(K-1) : y+ (K-1) 
 
                     if ( a == (x - 1) ) & ( b == (y - 1) ) % NW direction 
                        gradients(1,1) = abs( double(sample(a    ,b    )) - double(sample(x    ,y    ))); % Basic 
                        gradients(1,2) = abs( double(sample(a - 1,b + 1)) - double(sample(x - 1,y + 1))); % Related 1 
                        gradients(1,3) = abs( double(sample(a + 1,b - 1)) - double(sample(x + 1,y - 1))); % Related 2 
                         
                        if (gradients(1,1) <= epsilon) & (gradients(1,2) > epsilon) & (gradients(1,3) > epsilon) 
                            obs2(x,y) = 1; 
                             
                        elseif (gradients(1,1) > epsilon) & (gradients(1,2) <= epsilon) & (gradients(1,3) <= epsilon) 
                            obs2(x,y) = 1; 
                             
                        elseif (gradients(1,1) > epsilon) & (gradients(1,2) > epsilon) & (gradients(1,3) <= epsilon) 
                            obs2(x,y) = 1; 
                             
                        elseif (gradients(1,1) > epsilon) & (gradients(1,2) <= epsilon) & (gradients(1,3) < epsilon) 
                            obs2(x,y) = 1; 
                             
                        else 
                            obs2(x,y) = 0; 
                             
                        end 
                          
                     elseif ( a == (x - 1) ) & ( b == (y    ) )   % N direction 
                        gradients(2,1) = abs( double(sample(a    ,b    )) - double(sample(x    ,y    ))); % Basic 
                        gradients(2,2) = abs( double(sample(a    ,b + 1)) - double(sample(x    ,y + 1))); % Related 1 
                        gradients(2,3) = abs( double(sample(a    ,b - 1)) - double(sample(x    ,y - 1))); % Related 2                          
                         
                        if (gradients(2,1) <= epsilon) & (gradients(2,2) > epsilon) & (gradients(2,3) > epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        elseif (gradients(2,1) > epsilon) & (gradients(2,2) <= epsilon) & (gradients(2,3) <= epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        elseif (gradients(2,1) > epsilon) & (gradients(2,2) > epsilon) & (gradients(2,3) <= epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        elseif (gradients(2,1) > epsilon) & (gradients(2,2) <= epsilon) & (gradients(2,3) < epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        else 
                            obs2(x,y) = obs2(x,y) - 1; 
                             
                        end 
                     elseif ( a == (x - 1) ) & ( b == (y + 1) ) % NE direction 
                        gradients(3,1) = abs( double(sample(a    ,b    )) - double(sample(x    ,y    ))); % Basic 
                        gradients(3,2) = abs( double(sample(a + 1,b + 1)) - double(sample(x + 1,y + 1))); % Related 1 
                        gradients(3,3) = abs( double(sample(a - 1,b - 1)) - double(sample(x - 1,y - 1))); % Related 2                          
                         
                        if (gradients(3,1) <= epsilon) & (gradients(3,2) > epsilon) & (gradients(3,3) > epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        elseif (gradients(3,1) > epsilon) & (gradients(3,2) <= epsilon) & (gradients(3,3) <= epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        elseif (gradients(3,1) > epsilon) & (gradients(3,2) > epsilon) & (gradients(3,3) <= epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        elseif (gradients(3,1) > epsilon) & (gradients(3,2) <= epsilon) & (gradients(3,3) < epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        else 
                            obs2(x,y) = obs2(x,y) - 1; 
                             
                        end 
                     elseif ( a == (x   ) ) & ( b == (y - 1) )   % W direction 
                        gradients(4,1) = abs( double(sample(a    ,b    )) - double(sample(x    ,y    ))); % Basic 
                        gradients(4,2) = abs( double(sample(a - 1,b    )) - double(sample(x - 1,y    ))); % Related 1 
                        gradients(4,3) = abs( double(sample(a + 1,b    )) - double(sample(x + 1,y    ))); % Related 2                               
                         
                        if (gradients(4,1) <= epsilon) & (gradients(4,2) > epsilon) & (gradients(4,3) > epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        elseif (gradients(4,1) > epsilon) & (gradients(4,2) <= epsilon) & (gradients(4,3) <= epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        elseif (gradients(4,1) > epsilon) & (gradients(4,2) > epsilon) & (gradients(4,3) <= epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        elseif (gradients(4,1) > epsilon) & (gradients(4,2) <= epsilon) & (gradients(4,3) < epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        else 
                            obs2(x,y) = obs2(x,y) - 1; 
                             
                        end 
%                    elseif ( a == (x) ) & ( b == (y) )     % Centre 
                      
                     elseif ( a == (x    ) ) & ( b == (y + 1) )   % E direction 
                        gradients(5,1) = abs( double(sample(a    ,b    )) - double(sample(x    ,y    ))); % Basic 
                        gradients(5,2) = abs( double(sample(a + 1,b    )) - double(sample(x + 1,y    ))); % Related 1 
                        gradients(5,3) = abs( double(sample(a - 1,b    )) - double(sample(x - 1,y    ))); % Related 2                               
                         
                        if (gradients(5,1) <= epsilon) & (gradients(5,2) > epsilon) & (gradients(5,3) > epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        elseif (gradients(5,1) > epsilon) & (gradients(5,2) <= epsilon) & (gradients(5,3) <= epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        elseif (gradients(5,1) > epsilon) & (gradients(5,2) > epsilon) & (gradients(5,3) <= epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        elseif (gradients(5,1) > epsilon) & (gradients(5,2) <= epsilon) & (gradients(5,3) < epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        else 
                            obs2(x,y) = obs2(x,y) - 1; 
                             
                        end 
                     elseif ( a == (x + 1) ) & ( b == (y - 1) ) % SW direction 
                        gradients(6,1) = abs( double(sample(a    ,b    )) - double(sample(x    ,y    ))); % Basic 
                        gradients(6,2) = abs( double(sample(a - 1,b - 1)) - double(sample(x - 1,y - 1))); % Related 1 
                        gradients(6,3) = abs( double(sample(a + 1,b + 1)) - double(sample(x + 1,y + 1))); % Related 2                               
                      
                        if (gradients(6,1) <= epsilon) & (gradients(6,2) > epsilon) & (gradients(6,3) > epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        elseif (gradients(6,1) > epsilon) & (gradients(6,2) <= epsilon) & (gradients(6,3) <= epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        elseif (gradients(6,1) > epsilon) & (gradients(6,2) > epsilon) & (gradients(6,3) <= epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        elseif (gradients(6,1) > epsilon) & (gradients(6,2) <= epsilon) & (gradients(6,3) < epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        else 
                            obs2(x,y) = obs2(x,y) - 1; 
                             
                        end 
                     elseif ( a == (x + 1) ) & ( b == (y   ) )   % S direction 
                        gradients(7,1) = abs( double(sample(a    ,b    )) - double(sample(x    ,y    ))); % Basic 
                        gradients(7,2) = abs( double(sample(a    ,b - 1)) - double(sample(x    ,y - 1))); % Related 1 
                        gradients(7,3) = abs( double(sample(a    ,b + 1)) - double(sample(x    ,y + 1))); % Related 2                               
                      
                        if (gradients(7,1) <= epsilon) & (gradients(7,2) > epsilon) & (gradients(7,3) > epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        elseif (gradients(7,1) > epsilon) & (gradients(7,2) <= epsilon) & (gradients(7,3) <= epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        elseif (gradients(7,1) > epsilon) & (gradients(7,2) > epsilon) & (gradients(7,3) <= epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        elseif (gradients(7,1) > epsilon) & (gradients(7,2) <= epsilon) & (gradients(7,3) < epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        else 
                            obs2(x,y) = obs2(x,y) - 1; 
                        end 
                     elseif ( a == (x+1) ) & ( b == (y+1) ) % SE direction 
                        gradients(8,1) = abs( double(sample(a    ,b    )) - double(sample(x    ,y    ))); % Basic 
                        gradients(8,2) = abs( double(sample(a + 1,b - 1)) - double(sample(x + 1,y - 1))); % Related 1 
                        gradients(8,3) = abs( double(sample(a - 1,b + 1)) - double(sample(x - 1,y + 1))); % Related 2                               
                         
                        if (gradients(8,1) <= epsilon) & (gradients(8,2) > epsilon) & (gradients(8,3) > epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        elseif (gradients(8,1) > epsilon) & (gradients(8,2) <= epsilon) & (gradients(8,3) <= epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        elseif (gradients(8,1) > epsilon) & (gradients(8,2) > epsilon) & (gradients(8,3) <= epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        elseif (gradients(8,1) > epsilon) & (gradients(8,2) <= epsilon) & (gradients(8,3) < epsilon) 
                            obs2(x,y) = obs2(x,y) + 1; 
                             
                        else 
                            obs2(x,y) = obs2(x,y) - 1; 
                             
                        end 
                     end 
                     
                end    
            end 
            
            if obs2(x,y) > 0 
                victims21 = victims21 + 1; 
            else 
                victims22 = victims22 + 1; 
            end 
        end 
    end 
     
end