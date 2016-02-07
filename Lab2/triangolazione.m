%% Esercizio sulla triangolazione
clear all;
close all;
clc;

% Carico le immagini
image1 = imread('Image1.jpg');
image2 = imread('Image2.jpg');


%% Effettuo calibrazione (per maggiori informazioni si veda l'esercizio precedente)

imshow(image1);
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

close all;




%% acquisizione dei punti e calcolo triangolazione
% Punti dell'immagine 1
figure;
imshow(image1);
[firstPoint1X firstPoint1Y]=ginput(1);
hold on;
plot(firstPoint1X,firstPoint1Y,'x','color' ,'red');
[firstPoint2X firstPoint2Y]=ginput(1);
hold on
plot(firstPoint2X,firstPoint2Y,'x','color' ,'red');
retta1=[firstPoint1X firstPoint2X; firstPoint1Y firstPoint2Y];

hold on;
plot(retta1(1,:),retta1(2,:),'g');

% Punti dell'immagine 2
figure;
imshow(image2);
[secondPoint1X secondPoint1Y]=ginput(1);
hold on;
plot(secondPoint1X,secondPoint1Y,'x','color' ,'red');
[secondPoint2X secondPoint2Y]=ginput(1);
hold on;
plot(secondPoint2X,secondPoint2Y,'x','color' ,'red');
retta2=[secondPoint1X secondPoint2X; secondPoint1Y secondPoint2Y];

hold on;
plot(retta2(1,:),retta2(2,:),'g');

% Creo un insieme di punti immagine corrispondenti.
m(:,:,1)=retta1;
m(:,:,2)=retta2;
% Creo un insieme di matrici di proiezione prospettica
PPM(:,:,1)=ppm1;
PPM(:,:,2)=ppm2;

M=intersect_base(PPM,m);

%% Calcolo la distanza tra i punti selezioni
close all
imshow(image1);

dist = sqrt(sum((M(:,1) - M(:,2)).^2))
hold on, plot(retta1(1,:),retta1(2,:),'g*')
hold on, plot(retta1(1,:),retta1(2,:),'g')
hold on, text(retta1(1,1),retta1(2,1),num2str(dist),'color','r')
