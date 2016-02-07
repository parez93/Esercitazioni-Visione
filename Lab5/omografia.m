close all;
clear all;
clc;

image1 = imread('venezia.jpg');
image2 = imrotate(image1, 45,'bilinear', 'crop');


puntiImmagine1 = [];
puntiImmagine2 = [];

for i=1:6
    figure
    imshow(image1);
    [u1,v1] = ginput(1);
    puntiImmagine1 = [puntiImmagine1; round([u1,v1]) 1]; 

    figure
    imshow(image2);
    [u2,v2] = ginput(1);
    puntiImmagine2 = [puntiImmagine2; round([u2,v2]) 1]; 

end

close all;

puntiImmagine1 = puntiImmagine1';
puntiImmagine2 = puntiImmagine2';


kronecker = [];
for cont = 1:6
   a=puntiImmagine2(:,cont);

   prodottoEsterno = [          0              -a(3,1)                   a(2,1);
                              a(3,1)               0                   -a(1,1);
                             -a(2,1)            a(1,1)                     0   
                      ];
                  
   kroneckerParziale = kron(puntiImmagine1(:,cont)', prodottoEsterno);
   kronecker = [kronecker; kroneckerParziale(1:2,:)];                
end

[u, s, v] = svd(kronecker);
omografiaImg=reshape(v(:,size(v,2)),3,3);

figure
imshow(image1);
b = imwarp(image1, omografiaImg);
figure
imshow(uint8(b));








