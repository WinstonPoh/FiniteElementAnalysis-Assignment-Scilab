function elmt_stiff_global = global_bar(elmt_stiff_local, angle)
    c = cosd(angle);// In degrees
    s = sind(angle);
    transform_mat = [c s 0 0; 0 0 c s];
    elmt_stiff_global = transform_mat' * elmt_stiff_local * transform_mat
endfunction
