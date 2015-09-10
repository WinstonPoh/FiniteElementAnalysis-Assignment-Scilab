//ENME302_asmt_program_test case

E     = 200e9   //[Pa]
Area  = 6.362e-3//[m^2]
I     = 1.47e-5 //[m^4]
Len1     = 5    //[m]
Len2     = 5    //[m]
Len3     = 5    //[m]
Len4     = 5    //[m]
Len5     = 3    //[m]
Len6     = 3    //[m]
Len7     = 6    //[m]
Len8     = 6    //[m]
Len9     = 4    //[m]

theta1  =  atand(4/3) ;    //[deg]
theta2  =  -atand(4/3);    //[deg]
theta3  =  atand(4/3) ;    //[deg]
theta4  =  -atand(4/3);    //[deg]
theta5  =  0   ;    //[deg]
theta6  =  0   ;    //[deg]
theta7  =  0   ;    //[deg]
theta8  =  0   ;    //[deg]
theta9  =  -90 ;    //[deg]

NEGLIGIBLE_DEFLECTION = 1e-9; // deflections that are small enough to ignore

// Assembly matrices
A1 = [ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       1 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 1 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 1 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
        ]'
        
A2 = [ 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 1 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 1 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 1 0 0 0 0 0;
        ]'
        
A3 = [ 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 1 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 1 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 1 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 1 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
        ]'
        
A4 = [ 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 1 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
        ]'
        
A5 = [ 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 1 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
       0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 1 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 1 0 0 0 0 0 0 0 0;
        ]'
        
A6 = [ 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 1 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 1 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 1 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 1 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
        ]'
        
A7 = [ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       1 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 1 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 1 0 0 0 0 0;
        ]'
        
A8 = [ 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 1 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 1 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
        ]'
        
A9 = [ 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 1 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 1 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 1 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 1 0 0 0 0 0;
        ]'

//
[klocal1, khat1] = getKeHat_frame(E,Area,I,Len1, theta1);
[klocal2, khat2] = getKeHat_frame(E,Area,I,Len2, theta2);
[klocal3, khat3] = getKeHat_frame(E,Area,I,Len3, theta3);
[klocal4, khat4] = getKeHat_frame(E,Area,I,Len4, theta4);
[klocal5, khat5] = getKeHat_frame(E,Area,I,Len5, theta5);
[klocal6, khat6] = getKeHat_frame(E,Area,I,Len6, theta6);
[klocal7, khat7] = getKeHat_frame(E,Area,I,Len7, theta7);
[klocal8, khat8] = getKeHat_frame(E,Area,I,Len8, theta8);
[klocal9, khat9] = getKeHat_frame(E,Area,I,Len9, theta9);

kg1 = A1*khat1*A1'
kg2 = A2*khat2*A2'
kg3 = A3*khat3*A3'
kg4 = A4*khat4*A4'
kg5 = A5*khat5*A5'
kg6 = A6*khat6*A6'
kg7 = A7*khat7*A7'
kg8 = A8*khat8*A8'
kg9 = A9*khat9*A9'

KG = kg1+kg2+kg3+kg4+kg5+kg6+kg7+kg8+kg9
Q = [0 0 0 0 0 0 0 0 -100000 0 0 0 0 0 0]'
q = inv(KG)*Q ;


//to display q nicely (Get rid of tiny deflections that are basically zero)
for i = 1:length(q)
    if(abs(q(i)) < NEGLIGIBLE_DEFLECTION) then
        q(i) = 0;
    end
end

printf("q is in [m]\n")
format('e',10)
disp(q)
