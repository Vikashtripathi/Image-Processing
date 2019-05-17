function Q_2(input, m, x, y, w, h)
    
    I = imread(input);
    J1 = I;
    J2 = I;
    dimension = size(I);
    
    rows = dimension(1, 1);
    columns = dimension(1, 2);
    
    x1 = rows / 2 - m / 2;
    x2 = rows / 2 + m / 2;
    y1 = columns / 2 - m / 2;
    y2 = columns / 2 + m / 2;

    for i = x1:x2
        for j = y1:y2
            I(i, j) = 255;
        end
    end

    imwrite(I, 'Q_2.jpg');
    imshow(I), title('Original Image')
    
    for i = 1:rows
        for j = 1:columns
            J1(i, j) = I(i, columns - j + 1);
            J2(i, j) = I(rows - i + 1, j);
        end
    end
    
    imwrite(J1, 'Q_2_Vertical.jpg');
    imwrite(J2, 'Q_2_Horizontal.jpg');
    figure, imshow(J1), title('Vertical Flip')
    figure, imshow(J2), title('Horizontal Flip')
    
    K = imcrop(I, [x, y, w, h]);
    figure, imshow(K), title('Section of Original Image')
    
end