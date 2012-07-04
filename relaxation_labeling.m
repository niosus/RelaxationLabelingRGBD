
function [p,converged] =  relaxation_labeling( edges, prob_labels, C,max_iter,convergence_thresh, weights)
disp('relaxation labeling');
    converged = false;
    p = prob_labels;
    num_vertices = size(prob_labels,2);
    num_vertices
    tic
    for iteration = 1:max_iter, % iterate
        iteration;
        pp = p; % working copy of probabilities  
        changed=[];
        for i = 1:num_vertices % all vertices           
            M = length(edges{i});
            edge=edges{i};
            comp_coef=C{i};
            c=weights{i}; % weight c(i,j)
            % q(i,l)
            qi=0;
            qi_t=0;
            R=ComputeRi(p(i),comp_coef,1);
            R_t=ComputeRi(1-p(i), comp_coef,0);
            for en=1:M,  
                qi=qi+c(en)*p(edge(en))*comp_coef(en); %same labels of pixels
                qi=qi+c(en)*(1-p(edge(en)))*((-1)*comp_coef(en)); %different labels of pixels
                
                qi_t=qi_t+c(en)*p(edge(en))*((-1)*comp_coef(en)); %different labels of pixels
                qi_t=qi_t+c(en)*(1-p(edge(en)))*comp_coef(en); %same labels of pixels
            
%                  qi=qi+c(en)*p(edge(en))*R(en); %same labels of pixels
%                  qi=qi+c(en)*(1-p(edge(en)))*(R_t(en)); %different labels of pixels
% 
%                  qi_t=qi_t+c(en)*p(edge(en))*(R_t(en)); %different labels of pixels
%                  qi_t=qi_t+c(en)*(1-p(edge(en)))*R(en); %same labels of pixels
            
            end     
            val1 = p(i) * (1+qi);
            val2 = (1-p(i))*(1+qi_t);
            pp(i) = val1/(val1+val2); % normalize
            if (pp(i)==p(i)),
                continue;
            else
                changed=[changed i];
            end
        end
        abs_delta = abs(p(changed) - pp(changed));
        mean_abs_delta = mean(abs_delta(:));
        %max_abs_delta = max(abs_delta(:));
        p = pp; % store probabilities 
        t = toc;
        if mean_abs_delta < convergence_thresh
            iteration
            mean_abs_delta
            converged = true;
            break;
        end
    end
end
