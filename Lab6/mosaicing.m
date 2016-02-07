%% Esercizio sul mosaicing
clear all;
close all;
clc;

% Carico le immagini e le converto in scala di grigio
img1 = imread('./panorama_image1_big.jpg');
img1 = rgb2gray(img1);
img2 = imread('./panorama_image2_big.jpg');
img2 = rgb2gray(img2);

numberPoints = 10;

figure(1);
imshow(img1);
figure(2)
imshow(img2);

point1 = [];
point2 = [];

% ottengo i punti corrispondenti delle 2 immagini
for cont = 1:numberPoints
    figure(1);
    hold on,
    [x1, y1]=ginput(1);
    plot(x1,y1,'g*');
    point1=[point1; x1, y1];
    %
    %
    figure(2);
    hold on
    [x2, y2]=ginput(1);
    plot(x2,y2,'b*');
    point2=[point2; x2, y2];
    
end

point1=point1';
point2=point2';

% Calcolo matrice di omografia
A=[];
for i=1:size(point1,2)
    % omo2: coordinate omogenee del punto nella seconda immagine
    omo2=[point2(:,i);1];
    % calcolo del prodotto esterno
    prod_esterno=[0 -omo2(3) omo2(2);
               omo2(3) 0 -omo2(1);
               -omo2(2) omo2(1) 0];
    % mi_1: coordinate omogenee del punto nella prima immagine
    omo2=[point1(:,i);1];
    omo2t=omo2';
    % prodotto di kronecker
    kronecker=kron(omo2t, prod_esterno);
    % Prendo le prime due righe linearmente indipendenti
    A=[A; kronecker(1,:);kronecker(2,:)];
end

% Calcolo di H con l'SVD
h = ns(A);

H = reshape(h,3,3);
% H=H./H(3,3);

% Applico l'omografia all'immagine
[img_wrap_mos, bb, alpha] =imwarp(img1,H, 'linear', 'valid');
img1 = img_wrap_mos;





% Calcolo l'offset per le 2 immagini
minx=min([bb(1),0]);
miny=min([bb(2),0]);
maxx=max([bb(3),size(img2,2)]);
maxy=max([bb(4),size(img2,1)]);
minx=minx(1);
maxx=maxx(1);
miny=miny(1);
maxy=maxy(1);

ofsx2=-minx; 
ofsy2=-miny;

if minx<0
    ofsx1=0;
else
    ofsx1=bb(1);
end

if minx<0 
    ofsy1=0;
else
    ofsy1=bb(2);
end

img1=uint8(img1);
figure;
img2=rgb2gray(imread('./panorama_image2_big.jpg'));

% Inizializzo il mosaico a 0 con le coordinate che ho trovato
mosaicingImg=zeros(maxy-miny,maxx-minx);

% Calcolo il contributo delle 2 immagini
for riga=1:size(img1,1)
    for colonna=1:size(img1,2)
        mosaicingImg(riga+ofsy1,colonna+ofsx1)=img1(riga,colonna)*0.5;
    end
end
for riga=1:size(img2,1)
    for colonna=1:size(img2,2)
        mosaicingImg(riga+ofsy2,colonna+ofsx2)=mosaicingImg(riga+ofsy2,colonna+ofsx2)+img2(riga,colonna)*0.5;
    end
end
imshow(mosaicingImg,[]);

