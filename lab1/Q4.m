function [compression_ratio, rmse] = Q4()

    images = ["lenaTest1.jpg", "lenaTest2.jpg", "lenaTest3.jpg", "lenaTest4.jpg"];
    compression_ratio = zeros(1, 4);
    rmse = zeros(1, 4);
    
    for i = 1:4
        k = imfinfo(char(images(i)));
        compressed_bytes = k.FileSize;
        actual_bytes = k.Width * k.Height * k.BitDepth / 8;
        compression_ratio(i) = actual_bytes / compressed_bytes;
    end    
    
    J1 = double(imread(char(images(1))));
    dimension = size(J1);
    rows = dimension(1);
    columns = dimension(2);
    
    for k = 1:4
        
        J2 = double(imread(char(images(k))));
        total_val = 0.0;
        
        for i = 1:rows
            for j = 1:columns
                total_val = total_val + (J1(i) - J2(i))^2;
            end
        end
        
        total_val = total_val / (rows * columns);
        rmse(k) = sqrt(total_val);
        
    end    
    
end