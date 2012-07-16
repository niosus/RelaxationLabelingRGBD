function prob_segments = make_prob_image(num_of_segments, pix_in_segm)

prob_segments = zeros(1, num_of_segments);
prob_segments(1,:) = 0.5;

%prob_segments  = fill_prob_image([85 133], 0.8,pix_in_segm, prob_segments);

%these are for the mouse
% prob_segments  = fill_prob_image([60 60], 0.2,pix_in_segm, prob_segments);
% prob_segments  = fill_prob_image([75 95], 0.8,pix_in_segm, prob_segments);
% prob_segments  = fill_prob_image([112 137], 0.2,pix_in_segm, prob_segments);


%these are for the sheep
%prob_segments  = fill_prob_image([137 218], 0,pix_in_segm, prob_segments);
%prob_segments  = fill_prob_image([83 143], 1,pix_in_segm, prob_segments);
%prob_segments  = fill_prob_image([30 54], 0,pix_in_segm, prob_segments);

% for square
prob_segments  = fill_prob_image([44 147], 1,pix_in_segm, prob_segments);
prob_segments  = fill_prob_image([5 5], 0,pix_in_segm, prob_segments);

end

