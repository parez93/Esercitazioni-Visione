%% Esercizio sulle rette epipolari 
clear all;
close all;
clc;

image1 = imread('Image1.jpg');
image2 = imread('Image2.jpg');

imshow(image1);

%% Calibrazione (per maggiori informazioni si veda l'esercizio sulla calibrazione)

puntiImmagine1 = [];

for cont = 1:6
    [u1,v1] = ginput(1);
    hold on
    plot(u1,v1,'x','color','red');
    puntiImmagine1 = [puntiImmagine1; round([u1,v1]) 1]; 
end

puntiImmagine1 = puntiImmagine1';

ppm1 = ppmCameraFunz(puntiImmagine1);

figure
imshow(image2);
puntiImmagine2 = [];

for cont = 1:6
    [u2,v2] = ginput(1);
    hold on
    plot(u2,v2,'x','color','red');
    puntiImmagine2 = [puntiImmagine2; round([u2,v2]) 1]; 
end

puntiImmagine2 = puntiImmagine2';

ppm2 = ppmCameraFunz(puntiImmagine2);

%% Calcolo della retta epipolare

% Calcolo Q1 della ppm1
Q1 = ppm1(:,1:3);
% Calcolo Q2 della ppm2
Q2 = ppm2(:,1:3);


% Calcolo q1 della ppm1
q1 = ppm1(:,4);
% Calcolo q2 della ppm2
q2 = ppm2(:,4);


% Calcolo e
e = q2 - Q2 * inv(Q1) * q1;


% Rimostri le immagini
close all;
imshow(image1);
figure;
imshow(image2);


% Ottengo il punto m
figure(1);
[u1,v1] = ginput(1);
m1 = [u1; v1; 1];

% Calcolo il prodotto esterno di e
   a=e(:,1);
   prodottoEsterno = [          0              -a(3,1)                   a(2,1);
                                a(3,1)               0                   -a(1,1);
                             -a(2,1)         a(1,1)                0   
                      ];
                  
% Calcolo la matrice fondamentale F            
F = prodottoEsterno * Q2 * inv(Q1);
F = F./norm(F);

finale = F * m1;

% Coefficienti della retta
a = finale(1,1)
b = finale(2,1)
c = finale(3,1)

[tempx,tempy, zinutile] = size(image2);

% Retta di equazione: au + bv +c = 0 -> v = (-au - c)) / b
x=[0 : tempy];
y=(-a * x - c) / b ;
figure(2);
hold on 
plot(x,y);

