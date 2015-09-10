function Lambda_Mat = getLambda(theta)
    c = cosd(theta);
    s = sind(theta);
    
    lambda_mat = [c s 0; -s c 0; 0 0 1];
    Lambda_Mat = [lambda_mat, zeros(3,3); zeros(3,3), lambda_mat];
endfunction
