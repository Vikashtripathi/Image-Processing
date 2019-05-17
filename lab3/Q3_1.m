function [] = Q3_1(input, theta)

    I = imread(input); 
    dimension = size(I);
    initial_rows = dimension(1);
    initial_columns = dimension(2);
   
    theta = theta * (pi / 180);

    final_rows = ceil(initial_rows * abs(cos(theta)) + initial_columns * abs(sin(theta))); 
    final_columns = ceil(initial_rows * abs(sin(theta)) + initial_columns * abs(cos(theta)));  
   
    J = uint8(zeros(final_rows, final_columns));

    initial_centre_x = ceil(initial_rows / 2);
    initial_centre_y = ceil(initial_columns / 2);

    new_centre_x = ceil(final_rows / 2);
    new_centre_y = ceil(final_columns / 2);

    for i = 1 : final_rows
        for j = 1 : final_columns                                                       

            x = (i - new_centre_x) * cos(theta) + (j - new_centre_y) * sin(theta);                                       
            y = -(i - new_centre_x) * sin(theta) + (j - new_centre_y) * cos(theta);                             
            x = round(x) + initial_centre_x;
            y = round(y) + initial_centre_y;

            if (x >= 1 && y >= 1 && x <= initial_rows && y <= initial_columns ) 
                J(i, j) = I(x, y);  
            end
        end
    end

    imshow(J);
    imwrite(J, 'Rotated_and_interpolated_Image.tif');
    
end

