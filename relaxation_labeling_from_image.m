function relaxed_img = relaxation_labeling_from_image(image, prob_img, max_iter, edges, C, convergence_thresh, weights)
    prob_labels = prob_img;
    likelihoods = relaxation_labeling( edges, prob_labels, C,max_iter,convergence_thresh, weights); 
    relaxed_img = likelihoods;
end