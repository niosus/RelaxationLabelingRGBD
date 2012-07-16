function hash = compute_hash( segm )
    disp('computing hash map');
    tic;
    hash=containers.Map;
    isize=size(segm,1);
    jsize=size(segm,2);
    %loop over all pixels
    for i=1:isize
        for j=1:jsize
            %test if we hit the right margin of the image
            if i<isize
                %test if the labels of pixel (i,j) and (i+1,j) are
                %different
                if segm(i+1,j)~=segm(i,j)
                    %create a key
                    key=segm(i,j);
                    key_neigh=segm(i+1,j);
                    key2map; %this is a script that adds key to map (see code)
                end
            end
            %test if we hit the bottom margin of the image
            if j<jsize
                %test if the labels of pixel (i,j) and (i,j+1) are
                %different
                if segm(i,j+1)~=segm(i,j)
                    %create a key
                    key=segm(i,j);
                    key_neigh=segm(i,j+1);
                    key2map; %this is a script that adds key to map (see code)
                end
            end
        end
    end
    hash
    compute_hash_time=toc
end

