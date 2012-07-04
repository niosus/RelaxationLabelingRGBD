image=imread('sheep.ppm');
image_bw=rgb2gray(image);
imshow(image_bw);
% cut local optima so that we get less segmentation regions
image_bw = imhmin(image_bw,20);
L=watershed(image_bw);
%for now we have a segmentation with black border pixels

%here is a method to assign those black points to any closest label
bw=ones(size(L));
border=find(L==0);
bw(border)=0;
[D, ind] = bwdist(bw);
L(border)=L(ind(border));
%now we have an over segmented image without black border pixels - exactly
%what was needed.

%compute a mean color value for every label.
[~,~,res]=pixels_from_segmentation(image,L);
%show the over_segmented downsampled image
figure(2)
imshow(res)