function  compatibility  = compute_compatibility( center, neighbor )
%COMPUTE_COMPATIBILITY Summary of this function goes here
%   Detailed explanation goes here
    if size(center,2)>1,
        compatibility=sqrt(sum((center-neighbor).^2));
    else
        compatibility=sqrt((center-neighbor).^2);
    end
    %magic weight for compatibility coef
    weight=1.1;
    %compatibility=2*exp(-compatibility*weight) -1
    compatibility=exp(-compatibility*weight);
    %sigma=1;
    %compatibility=normpdf(compatibility,0,sigma);
end

