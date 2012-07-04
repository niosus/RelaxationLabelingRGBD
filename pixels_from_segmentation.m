function [pix_in_segm, segm_colors, super_image] = pixels_from_segmentation( image, segmentation )
    disp('getting pixels from segmentation');
    %super_image=zeros(size(image));
    super_image=image;
    super_image(:,:,:)=0;
    num_of_regions=max(max(segmentation))
    %allocate space for pix_in_segm
    pix_in_segm=cell(num_of_regions,1);
    %create empty segm_colors
    segm_colors=[];
    for current_region=1:num_of_regions,
        super_pixel_value=[0.0 0.0 0.0];
        pixel_coords=[];
        %loop over each pixel. 
        for i=1:size(image,1),
            for j=1:size(image,2),
                %Test if the point's label equals current_region label
                if segmentation(i,j)==current_region,
                    %add up color information
                    a=[image(i,j,1) image(i,j,2) image(i,j,3)];
                    super_pixel_value(1)=double(super_pixel_value(1)) + double(a(1));
                    super_pixel_value(2)=double(super_pixel_value(2)) + double(a(2));
                    super_pixel_value(3)=double(super_pixel_value(3)) + double(a(3));
                    %create an array of influenced pixel coordinates
                    pixel_coords=[pixel_coords, [i,j]'];
                end
                %if ended
            end
        end
        %for loop over pixels ended. 
        %write influenced pixels to the cell
        pix_in_segm{current_region}=pixel_coords;
        %Normalize the color information:
        n=double(size(pixel_coords,2));
        value=(super_pixel_value./n);
        %put the mean values to all pixels of the current region
        super_image(pixel_coords(1,:),pixel_coords(2,:),1)=value(1);
        super_image(pixel_coords(1,:),pixel_coords(2,:),2)=value(2);
        super_image(pixel_coords(1,:),pixel_coords(2,:),3)=value(3);
        %put the mean value to segm_colors
        segm_colors=[segm_colors value'];
    end
    % no more labels left
end

