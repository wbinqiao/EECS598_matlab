clear;

A = imread('kobi.png');


W_1 = [0,-1,0;
     -1,5,-1;
     0,-1,0];

W_2 = [1/16,2/16,1/16;
       2/16,4/16,2/16;
       1/16,2/16,1/16
       ];
W_3 = [-1,-1,-1;
        -1,8,-1;
        -1,-1,-1];
    
A_R=A(:,:,1);
A_G=A(:,:,2);
A_B=A(:,:,3);

div = 8;
[r,c] = size(A_R);
A_R_p = zeros(r,c+2);
A_R_p(:,2:c+1) = A_R;
[r,c] = size(A_R_p);
column_div = c/div;
for i=1:8
A_R_div{i} = A_R_p(:,1+(i-1)*column_div:i*column_div);
end

%convolution 2d

for i=1:8
    C{i}=con2d(A_R_div{i},W_1);
end

C_all = zeros(r,c);
for i=1:8
    C_all(:,1+(i-1)*column_div:i*column_div) = C{i};
end
C_all(C_all<0) = 0;
imshow(C_all);