function [encoded] = RLE(zig_zag)
    
    position = 1;
    dimension = size(zig_zag);
    N = dimension(2);
    count = 0;
    
    for i = 1:N
       
        if i == N
            count = count + 1;
            encoded(position) = zig_zag(i);
            encoded(position + 1) = count;
            position = position + 2;
            
        elseif zig_zag(i) == zig_zag(i + 1)
            count = count + 1;
            
        else
            count = count + 1;
            encoded(position) = zig_zag(i);
            encoded(position + 1) = count;
            position = position + 2;
            count = 0;
        end
    end
    
    encoded(position) = 0;
    encoded(position + 1) = 0;
    
end

