function C  = compute_compatibility_neighbors( segm_colors, edges )
%COMPUTE_COMPATIBILITY_NEIGHBORS 
%   computes the 
disp('computing compatibilities');
    C=edges;
    %initialize min with big value and max with small
    maxC=-1000;
    minC=1000;
    segments_num=size(segm_colors,2)
    for i=1:segments_num                                                                       
        numOfEdges=length(edges{i});
        for j=1:numOfEdges           
            if (size(segm_colors(:,i),1)>1) %check if the segm_colors has color or is bw
                center=segm_colors(:,i)';
                neigh=segm_colors(:,j)';
                C{i}(j)=compute_compatibility(center, neigh);%give vectors as an input then
            else
                C{i}(j)=compute_compatibility(segm_colors(1,i), segm_colors(1,j)); %in case of grayscale segm_colors
            end
        end
        %find max and min over all compatibility coefs
%         minC=min(min(C{i}(:)),minC);
%         maxC=max(max(C{i}(:)),maxC);
    end
    %normalize the coefficients
%     for i=1:segments_num
%         C{i}=(C{i}-minC)/(maxC-minC);
%         C{i};
%     end
end

