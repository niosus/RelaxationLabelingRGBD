function ri = ComputeRi( p_i, cond_prob, equal_label_trigger)
%RI Produces the vector rij for given node i and all its neighbors j
%   as input it gets 
%   *p_i  - which is the probability of the point to be in particular label, cond_prob
%   *cond_prob - vector of conditional probabilities p(t|t')
%   *equal_label_trigger - binary trigger: 1 if we assume equal labels and
%   0 otherwise
    ri=[];
    num_of_neighbors=length(cond_prob);
    if (equal_label_trigger==1)%changed to 0. test
        for j=1:num_of_neighbors
            if p_i<cond_prob(j)
               ri=[ri (1/(1-p_i))*(1-(p_i)/cond_prob(j))];
            else
               ri=[ri (cond_prob(j)/(p_i+0.0001))-1];
            end
        end
    else
        for j=1:num_of_neighbors
            if p_i<(1-cond_prob(j))
               ri=[ri (1/(1-p_i))*(1-(p_i)/(1-cond_prob(j)))];
            else
               ri=[ri ((1-cond_prob(j))/(p_i+0.0001))-1];
            end
        end
    end
end

