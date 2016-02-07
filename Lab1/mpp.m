%% Esercizio: calcolare la matrice di proiezione prospettica per l'immagine 1.

clear all;
close all;
clc;

%% Carico i dati
cali = load('./calib_example/calib_data.mat');
camera = load('./calib_example/Calib_Results.mat');

%% Ottengo la matrice K dei parametri interni
K = camera.KK;

%% Ottengo la matrice G dei parametri esterni che codifica posizione e 
% orientamento. Aggiungo anche tanti 0 fino all'ultimo in cui metto un 1
% affinchè G sia in coordiate omogenee

G = [camera.Rc_1 camera.Tc_1; 0 0 0 1];

%% Applico la formula P = K * [I|0] * G
% In questo modo calcolo la matrice di proiezione prospettica.
ppm = K * [eye(3) [0 0 0]'] * G;

%% Carico i punti per scacchiera
points = cali.X_1;

%% Plotto i punti 3D
plot3(points(1,:), points(2,:), points(3,:), '+');
waitforbuttonpress;

%% trasformo i punti della scacchiera in punti in coordinate omogenee
n_points = size(points);
homog_points = [points; ones(1,n_points(2))];

%% Proietto i  punti omogenei sul piano immagine
h2d = ppm * homog_points;

%% Trovo le coordinate u e v del vettore [u v 1]'
u = h2d(1,:)./h2d(3,:);
v = h2d(2,:)./h2d(3,:);

close all
imshow('./calib_example/Image1.tif');
waitforbuttonpress
hold on
plot(u,v,'+','color','green');
waitforbuttonpress
close all


%% Piccola rielaborazione personale
imshow('./calib_example/Image1.tif');
for cont = 1:u(2)
    hold on
    plot(u(1,cont),v(1,cont),'x','color','red');
    waitforbuttonpress
end

