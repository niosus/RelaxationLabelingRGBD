function [ segment, pix_in_segm, segm_colors, super_image ] = over_segmentation(real_image)
    disp('starting to oversegment');
    image = real_image;
    image_bw=rgb2gray(image);
    %image_bw=im2double(image_bw);
    %find the gradient of image to compute accurate watershed
    hy = fspecial('sobel');
    hx = hy';
    Iy = imfilter(image_bw, hy, 'replicate');
    Ix = imfilter(image_bw, hx, 'replicate');
    gradmag = sqrt(Ix.^2 + Iy.^2);
    gradmag = imhmin(gradmag, 0.03);
    L=watershed(gradmag);
    %for now we have a segmentation with black border pixels

    %here is a method to assign those black points to any closest label
    bw=ones(size(L));
    border=find(L==0);
    bw(border)=0;
    [~, ind] = bwdist(bw);
    L(border)=L(ind(border));
    %now we have an over segmented image without black border pixels - exactly
    %what was needed.
    
    %compute a mean color value for every label.
   [pix_in_segm, segm_colors, super_image]=pixels_from_segmentation(image,L);
   segment = L;
   
end

