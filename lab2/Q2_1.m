function [a_50, a_70, a_30, rle_50, rle_70, rle_30] = Q2_1(input)

    I = imread(input);

    dimension = size(I);
    rows = dimension(1);
    columns = dimension(2);
    
    for i = 1:rows
        for j = 1:columns
            I(i, j) = I(i, j) - 128;
        end
    end    

    T = zeros(8);

    for x = 0:7
        for y = 0:7
            T(x + 1, y + 1) = (cos((pi/16) * (2*x + 1))) * (cos((pi/16) * (2*y + 1)));
        end
    end  

    B50 = zeros(rows, columns);
    B70 = zeros(rows, columns);
    B30 = zeros(rows, columns);
    M = zeros(8);
    Zig_zag_50 = zeros(rows, columns);
    Zig_zag_70 = zeros(rows, columns);
    Zig_zag_30 = zeros(rows, columns);
    
    count = 1;
    rle_50 = '';
    rle_70 = '';
    rle_30 = '';
    a_50 = 0;
    a_70 = 0;
    a_30 = 0;
    
    Q50 = [16 11 10 16 24 40 51 61;
        12 12 14 19 26 58 60 55;
        14 13 16 24 40 57 69 56;
        14 17 22 29 51 87 80 62;
        18 22 37 56 68 109 103 77;
        24 35 55 64 81 104 113 92;
        49 64 78 87 103 121 120 101;
        72 92 95 98 112 100 103 99];

    S70 = 200 - 2 * 70;
    S30 = 5000 / 30;

    Q70 = floor( (S70*Q50 + 50) / 100);
    Q70(Q70 == 0) = 1;
    Q30 = floor( (S30*Q50 + 50) / 100);
    Q30(Q30 == 0) = 1;

    for i = 1:8:rows
        for j = 1:8:columns
        
            for k = i:i+7
                for l = j:j+7
                    M(k - i + 1, l - j + 1) = I(k, l);
                end    
            end    
        
            G = T*M*T';
            Temp50 = G./Q50;
            Temp70 = G./Q70;
            Temp30 = G./Q30;
        
            zig_50 = zigzag(round(Temp50));
            zig_70 = zigzag(round(Temp70));
            zig_30 = zigzag(round(Temp30));
            
            [value_50] = RLE(zig_50);
            a_50 = a_50 + length(value_50);
            check_50 = join(string(value_50));
            rle_50 = strcat(rle_50, check_50);
            
            [value_70] = RLE(zig_70);
            a_70 = a_70 + length(value_70);
            check_70 = join(string(value_70));
            rle_70 = strcat(rle_70, check_70);
            
            [value_30] = RLE(zig_30);
            a_30 = a_30 + length(value_30);
            check_30 = join(string(value_30));
            rle_30 = strcat(rle_30, check_30);
            
            for k = 1:64
                Zig_zag_50(count) = zig_50(k);
                Zig_zag_70(count) = zig_70(k);
                Zig_zag_30(count) = zig_30(k);
                count = count + 1;
            end
        
            for k = i:i+7
                for l = j:j+7
                    B50(k, l) = round(Temp50(k - i + 1, l - j + 1));
                    B70(k, l) = round(Temp70(k - i + 1, l - j + 1));
                    B30(k, l) = round(Temp30(k - i + 1, l - j + 1));
                end    
            end 
        end
    end    
    B5 = uint8(B50);
    imwrite(B5, 'quantized_Q50.jpg');
    imwrite(B70, 'quantized_Q70.jpg');
    imwrite(B30, 'quantized_Q30.jpg');  
    
    %[value_500] = RLE(Zig_zag_50);
    %a_500 = a_500 + length(value_500);
    
    %[value_700] = RLE(Zig_zag_70);
    %a_700 = a_700 + length(value_700);
    
    %[value_300] = RLE(Zig_zag_30);
    %a_300 = a_300 + length(value_300);
    
end

