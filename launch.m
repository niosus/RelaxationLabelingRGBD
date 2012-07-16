image = imread('sheep.ppm');
% initializing image, prob_image, edges, C for relaxation-labeling function
f =figure(1);
image=im2double(image);
imshow(image);
disp('starting');
[segm, pix_in_segm, segm_colors, super_image ]= over_segmentation(image);
figure(2);
imshow(super_image);
figure(3);
number_of_segments = max(max(segm));
borders = compute_hash(segm);
[edges, weights] = compute_edges_hash (borders, number_of_segments);
comp = compute_compatibility_neighbors(segm_colors, edges); 

% making probability labels for the segmented image
%initializing secure points inside function make_prob_image
prob_labels = make_prob_image(number_of_segments, pix_in_segm);
imshow(segm2image(image,prob_labels,pix_in_segm));

figure(4);
max_iter=1000
precision=10^(-6)
prob_labeled_segments = relaxation_labeling_from_image(segm_colors,prob_labels, max_iter, edges, comp, precision, weights);

prob_image=segm2image(image,prob_labeled_segments,pix_in_segm);
imshow(prob_image);
figure(5);
hy = fspecial('sobel');
hx = hy';
Iy = imfilter(prob_image, hy, 'replicate');
Ix = imfilter(prob_image, hx, 'replicate');
gradmag = sqrt(Ix.^2 + Iy.^2);
image(:,:,1)=image(:,:,1)+gradmag;
image(:,:,2)=image(:,:,2)+gradmag;
image(:,:,3)=image(:,:,3)+gradmag;
imshow(image);



