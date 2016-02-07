close all;
clear all;

cali = load('calib_data.mat');
camera = load('Calib_Results.mat');

ImageIN = imread('Image10.tif');

X = cali.X_10;

figure(1);
plot3(X(1,:), X(2,:), X(3,:), 'r*');

KK = camera.KK;

R = camera.Rc_10;
T = camera.Tc_10;
G = [R T; 0 0 0 1];


ppm = KK * [1 0 0 0
            0 1 0 0
            0 0 1 0] *G;
        
[u,v] = proj(ppm, X');
figure(2);
image(ImageIN);
hold on
plot(u, v, 'b+');




om = camera.omc_10;
T = camera.Tc_10;
f = camera.fc;
c = camera.cc;
k = camera.kc;




        
        