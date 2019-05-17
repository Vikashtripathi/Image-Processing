function [] = Q_1(x)

    start_val = 256 - x / 2;
    end_val = 256 + x / 2;

    I = zeros(512);

    for i = start_val:end_val
        for j = start_val:end_val
            I(i, j) = 255;
        end
    end

    imwrite(I, 'Q_1.jpg');
    imshow(I)
    
end