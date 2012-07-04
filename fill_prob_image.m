function prob_segments = fill_prob_image( pixel_num, value, pix_in_segm, prob_segments )
    size_px=size(pix_in_segm,1);
    pixel_num
    for i=1:size_px
        pixels = pix_in_segm{i};
%         if ~isempty(find(all(ismember(pixels,pixel_num)==1), 1))
%                 % then in one column -> there exists such point in this label
%                 prob_segments(i) = value;
%         end
        a=ismember(pixels,pixel_num(1));
        b=ismember(pixels,pixel_num(2));
        a=a(1,:);
        b=b(2,:);
        a_f=find(a);
        b_f=find(b);
        found=find(ismember(a_f,b_f), 1);
        if ~isempty(found)
            prob_segments(i) = value;
        end
    end
end

