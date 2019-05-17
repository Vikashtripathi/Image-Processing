function [scan_matrix] = zigzag(Temp)
    
    dimension = size(Temp);
    N = dimension(2);
    scan_matrix = zeros(1, N*N);
    scan_matrix(1) = Temp(1, 1);

    position = 1;

    for k = 1:2*N-1
        if k <= N
            if mod(k, 2) == 0
                j = k;
                
                for i = 1:k
                    scan_matrix(position) = Temp(i, j);
                    position = position + 1;
                    j = j - 1;    
                end
            else
                i = k;
                
                for j = 1:k   
                    scan_matrix(position) = Temp(i, j);
                    position = position + 1;
                    i = i - 1; 
                end
            end
        else
            if mod(k, 2) == 0
                p = mod(k, N);
                j = N;
     
                for i = p+1:N
                    scan_matrix(position) = Temp(i, j);
                    position = position + 1;
                    j = j - 1;    
                end
            else
                p = mod(k, N);
                i = N;
        
                for j = p+1:N   
                    scan_matrix(position) = Temp(i, j);
                    position = position + 1;
                    i = i - 1; 
                end
            end
        end
    end
end

