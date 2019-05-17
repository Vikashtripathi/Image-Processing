function [] = Q3_4(input, adjacency, V1, V2)
    
    J = imread(input);
    
    [rows, columns] = size(J);
    connected_image = zeros(rows, columns);
  
    for i = 1 : 16 : rows - 15
        for j = 1 : 16 : columns - 15
            
            for k = 1 : 16
                for p = 1 : 16
                    
                    current_pixel = J(k + i - 1, p + j - 1);
                    
                    if current_pixel >= V1 && current_pixel <= V2
                        
                        if (k - 1 > 0)
                             up = J(k - 1 + i - 1, p + j - 1);
                             if up >= V1 && up <= V2
                                connected_image(k - 1 + i - 1, p + j - 1) = up;
                             end    
                             
                             if (adjacency == 8)
                                
                                 if (p - 1 > 0)
                                    up_left = J(k - 1 + i - 1, p - 1 + j - 1);
                                    if up_left >= V1 && up_left <= V2
                                        connected_image(k - 1 + i - 1, p - 1 + j - 1) = up_left;
                                    end       
                                 end 
                                 
                                 if (p + 1 < 17)
                                    up_right = J(k - 1 + i - 1, p + 1 + j - 1);
                                    if up_right >= V1 && up_right <= V2
                                        connected_image(k - 1 + i - 1, p + 1 + j - 1) = up_right;
                                    end       
                                 end 
                                 
                             end    
                        end
                        
                        if (k + 1 < 17)
                            down = J(k + 1 + i - 1, p + j - 1);
                            if down >= V1 && down <= V2
                                connected_image(k + 1 + i - 1, p + j - 1) = down;
                            end 
                            
                            if (adjacency == 8)
                                
                                 if (p - 1 > 0)
                                    down_left = J(k + 1 + i - 1, p - 1 + j - 1);
                                    if down_left >= V1 && down_left <= V2
                                        connected_image(k + 1 + i - 1, p - 1 + j - 1) = down_left;
                                    end       
                                 end 
                                 
                                 if (p + 1 < 17)
                                    down_right = J(k + 1 + i - 1, p + 1 + j - 1);
                                    if down_right >= V1 && down_right <= V2
                                        connected_image(k + 1 + i - 1, p + 1 + j - 1) = down_right;
                                    end        
                                 end 
                                 
                             end    
                            
                        end 
                        
                        if (p - 1 > 0)
                            left = J(k + i - 1, p - 1 + j - 1);
                            if left >= V1 && left <= V2
                                connected_image(k + i - 1, p - 1 + j - 1) = left;
                            end 
                        end
                        
                        if (p + 1 < 17)
                            right = J(k + i - 1, p + 1 + j - 1);
                            if right >= V1 && right <= V2
                                connected_image(k + i - 1, p + 1 + j - 1) = right;
                            end 
                        end    
                    end    
                end
            end
            
        end
    end    
    
    connected_image = uint8(connected_image);
    imshow(connected_image);
    
    imwrite(connected_image, 'connected_image.jpg');
end

