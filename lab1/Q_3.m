function [] = Q_3(u0, v0, A)

    I = zeros(512);

    for x = 0:511
        for y = 0:511
            I(x + 1, y + 1) = A * sin(u0 * x + v0 * y);
        end
    end    

    imwrite(I, 'Q_3.jpg');
    imshow(I)

end