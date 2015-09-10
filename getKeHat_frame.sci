function [frame_stiff_local,frame_stiff_glob] = getKeHat_frame(E, Area, I, L, theta)
    alpha_bar = (E*I) / (L^3);
    beta_ = (Area * (L^2)) / I;
    c = cosd(theta);
    s = sind(theta);
    
    lambda_mat = [c s 0; -s c 0; 0 0 1];
    Lambda_Mat = [lambda_mat, zeros(3,3); zeros(3,3), lambda_mat];
    
    A = [beta_ 0 0; 0 12 (6*L); 0 (6*L) (4*(L^2))];
    B = [-beta_ 0 0; 0 -12 (6*L); 0 -(6*L) (2*(L^2))];
    C = [-beta_ 0 0; 0 -12 -(6*L); 0 (6*L) (2*(L^2))];
    D = [beta_ 0 0; 0 12 -(6*L); 0 (-6*L) (4*(L^2))];
    
    frame_stiff_local = alpha_bar * [A, B; C, D];
    frame_stiff_glob = Lambda_Mat' * frame_stiff_local * Lambda_Mat;
endfunction
