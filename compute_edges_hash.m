function [ edges, weights ] = compute_edges_hash( hash_map, number_of_segments)
%COMPUTE_EDGES_HASH  computes  neighbouring segments relying on hash_map
%   returns cell of neighbouring labels and weights (how big is the border between two segments)
    disp('computing edges from hash map');
    tic;
    edges = cell(number_of_segments,1);
    weights = cell(number_of_segments,1);
    for segment_num=1:number_of_segments
        str_segm=int2str(segment_num);
        neigh_segm=hash_map(str_segm);
        if ~isempty(neigh_segm)
            edges{segment_num}=neigh_segm(1,:);
            weights{segment_num}=neigh_segm(2,:)./sum(neigh_segm(2,:));
        else
            edges{segment_num}=[];
            weights{segment_num}=[];
        end
    end
    create_edges_time=toc
end

