function [sk_mapping] = Q3_2(input)

    L = 256;
    I = imread(input);
    dimension = size(I);
    rows = dimension(1);
    columns = dimension(2);
    
    total_pixels = rows * columns;
    equalized_histogram = zeros(rows, columns);
    
    intensity_freq = zeros(1, L);
    intensity_probability = double(zeros(1, L));
    
    for i = 1 : rows
        for j = 1 : columns
            intensity = I(i, j);
            intensity_freq(intensity + 1) = intensity_freq(intensity + 1) + 1;
        end
    end    
    
    for i = 1 : L
        intensity_probability(i) = intensity_freq(i) / total_pixels; 
    end    

    sum = 0;
    sk_mapping = uint8(zeros(1, L));
    for i = 1 : L
        sum = sum + intensity_freq(i);
        sk_mapping(i) = round((L - 1) * (sum / total_pixels));
    end    
    
    for i = 1 : rows
        for j = 1 : columns
            equalized_histogram(i, j) = sk_mapping(I(i, j) + 1);
        end
    end
    
    equalized_histogram = uint8(equalized_histogram);
    
    figure, imshow(I), title('Original');
    figure, imshow(equalized_histogram), title('Histogram Equalized Image');
    
    imwrite(equalized_histogram, 'Histogram Equalized Image.tif');
    
end

