function [] = Q3_3(input)
    
    I = double(imread(input));
    dimension = size(I);
    rows = dimension(1);
    columns = dimension(2);
    
    sobel_x = [1  2  1;
               0  0  0;
              -1 -2 -1];
            
    sobel_y = [1 0 -1;
               2 0 -2;
               1 0 -1];
            
    prewitt_x = [1 0 -1;
                 1 0 -1;
                 1 0 -1];
             
    prewitt_y = [1  1  1;
                 0  0  0;
                -1 -1 -1]; 
    
    J = padarray(I, [2, 2], 0, 'both');
    J = double(J);
    
    sobel_image = double(zeros(rows + 4, columns + 4));
    prewitt_image = double(zeros(rows + 4, columns + 4));
    
    i_x = 1;
    i_y = 1;
    
    for i = 1 : rows + 2
        for j = 1 : columns + 2
            
            g_x = 0.0;
            g_y = 0.0;
            
            g_x1 = 0.0;
            g_y1 = 0.0;
            
            for k = 1 : 3
                for m = 1 : 3
                    
                    g_x = g_x + (sobel_x(k, m) * J(i + k - 1, j + m - 1));
                    g_y = g_y + (sobel_y(k, m) * J(i + k - 1, j + m - 1));
                    
                    g_x1 = g_x1 + (prewitt_x(k, m) * J(i + k - 1, j + m - 1));
                    g_y1 = g_y1 + (prewitt_y(k, m) * J(i + k - 1, j + m - 1));
                
                end
            end
            
            M1 = sqrt(double(g_x^2) + double(g_y^2));
            M2 = sqrt(double(g_x1^2) + double(g_y1^2));
            
            sobel_image(i_x, i_y) = M1;
            prewitt_image(i_x, i_y) = M2;
            
            i_y = i_y + 1;
            
        end
        
        i_x = i_x + 1;
        i_y = 1;
        
    end
   
    sobel_image2 = uint8(sobel_image);
    prewitt_image2 = uint8(prewitt_image);
    
    sobel_image2([1 2 rows+3 rows+4], :) = [];
    sobel_image2(:, [1 2 columns+3 columns+4]) = [];
    prewitt_image2([1 2 rows+3 rows+4], :) = [];
    prewitt_image2(:, [1 2 columns+3 columns+4]) = [];
    
    imshow(sobel_image2), title('Sobel image');
    figure, imshow(prewitt_image2), title('Prewitt image');
    
    imwrite(sobel_image2, 'sobel_image.tif');
    imwrite(prewitt_image2, 'prewitt_image.tif');
    
end

