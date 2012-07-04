function segm_image = segm2image( image, segm_prob, pix_in_segm )
    disp('segmentation to image');
    num_of_segm=size(pix_in_segm,1)
    %initialize segm_image with size of image
    segm_image=zeros(size(image(:,:,1)));
    for current_segm=1:num_of_segm
        num_pix=size(pix_in_segm{current_segm},2);
        for pix=1:num_pix
            x=pix_in_segm{current_segm}(1,pix);
            y=pix_in_segm{current_segm}(2,pix);
            segm_image(x,y)=segm_prob(current_segm); 
        end
    end
end

