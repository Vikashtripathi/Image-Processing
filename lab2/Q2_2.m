function [W] = Q2_2(input)

    M = imread(input);
    dimension = size(M);
    rows = dimension(1);
    columns = dimension(2);
    W = zeros(rows, columns);

    j = 1;

    for i = 1:rows/2
        W(i, j) = 1/2;
        W(i, j + 1) = 1/2;
        j = j + 2;
    end 

    j = 1;

    for i = (rows/2)+1:rows
        W(i, j) = 1/2;
        W(i, j + 1) = -1/2;
        j = j + 2;
    end 

    X = W*double(M)*W';
    X = uint8(X);

    for i = 1:rows
        for j = 1:columns
            if X(i, j) <= 15
                X(i, j) = 0;
            end
        end    
    end 

    result_15 = inv(W)*double(X)*inv(W');
    result_15 = uint8(result_15);
    imwrite(result_15, 'image_name_15.jpg');
    imwrite(X, 'test_15.jpg');

    for i = 1:rows
        for j = 1:columns
            if X(i, j) <= 20
                X(i, j) = 0;
            end
        end    
    end 

    result_20 = inv(W)*double(X)*inv(W');
    result_20 = uint8(result_20);
    imwrite(result_20, 'image_name_20.jpg');
    imwrite(X, 'test_20.jpg');

    for i = 1:rows
        for j = 1:columns
            if X(i, j) <= 25
                X(i, j) = 0;
            end
        end    
    end 

    result_25 = inv(W)*double(X)*inv(W');
    result_25 = uint8(result_25);
    imwrite(result_25, 'image_name_25.jpg');
    imwrite(X, 'test_25.jpg');

end

