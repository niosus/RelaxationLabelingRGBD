% computes the edges for an image of size img_size
% the edges represent the 8-neighborhood for each pixel
%
function edges = compute_edges(img_size)
n = prod(img_size);
edges = cell(n,1);
for r = 1:img_size(1)
    for c = 1:img_size(2)
        i = sub2ind(img_size,r,c);
        j = [];
        for k = r-1:r+1
            for l = c-1:c+1
                if( k <= 0 | l <= 0 | k>img_size(1) | l>img_size(2) )
                    continue;
                end
                idx =sub2ind(img_size, k,l);
                if(idx==i)
                    continue;
                end
                j = [j idx];
            end
        end
        edges{i} = j;
    end
end
