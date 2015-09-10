function element_stiffness = local_bar(E, A, L)
    // Function takes in Elasticity(Young's Modulus,E), Area, A, and Length L 
    // and returns the stiffness matrix of the element in local coordinates.
    element_stiffness_local = ((E*A)/L).* [1 -1; -1 1];
endfunction
