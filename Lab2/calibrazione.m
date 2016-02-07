%% Esercizio sulla calubrazione
clear all;
close all;
clc;

%% Carico l'immagine e la visualizzo
image = imread('Image1.jpg');
imshow(image);

%% Scelgo 6 punti mondo in coordinate omogenee --> possono essere più di 6
% l'importante è che siano almeno 6.
% Faccio la trasposta per costruzione.
%   \  |  /
%    \ | /
%     \|/
%   (0 0 0)   ---> punto più in basso a destra nell'immagine

puntiMondo = [5 0 5 1
              5 5 5 1
              0 5 5 1
              0 5 0 1
              5 5 0 1
              5 0 0 1];

puntiMondo = puntiMondo';

%% Richiedo i punti immagine in coordinate omogenee e li salvo. Mostro anche
% dove ho clickato.
% Faccio la trasposta per costruzione.

puntiImmagine = [];

for cont = 1:6
    [u,v] = ginput(1);
    hold on;
    plot(u,v,'x','color','red');
    puntiImmagine = [puntiImmagine; round([u,v]) 1];
end

puntiImmagine = puntiImmagine';

%% Calcolo il prodotto esterno ed eseguo Kronecker
kronecker = [];
for cont = 1:6
   a=puntiImmagine(:,cont);

   prodottoEsterno = [          0              -1                   a(2,1);
                                1               0                   -a(1,1);
                      -a(2,1)     a(1,1)                0   
                      ];
                  
   kroneckerParziale = kron(prodottoEsterno, puntiMondo(:,cont)');
   kronecker = [kronecker; kroneckerParziale(1:2,:)];
end

%% Calcolo la la matrice di proiezione prospettica.
[u, s, v] = svd(kronecker);
ppm=reshape(v(:,size(v,2)),4,3);
ppm = ppm';

%% Calcolo un nuovo punto e lo mostro.
hpoint = [0 0 0 1]';
h2d = ppm*hpoint;
p = round(h2d(1,:) ./ h2d(3,:));
q = round(h2d(2,:) ./ h2d(3,:));
hold on
plot(p,q,'o','color','red')