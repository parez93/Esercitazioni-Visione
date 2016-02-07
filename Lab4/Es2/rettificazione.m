%% Esercizio sulla rettificazione epipolare

clear all;
close all;
clc;

% Carico i dati della calibrazione ottenuti dall'esercizio 1 e le due
% immagini delle scacchiere
stereo = load('Calib_Results_stereo.mat');
left = load('Calib_Results_left.mat');
right = load('Calib_Results_right.mat');

image1 = imread('left01.jpg');
image2 = imread('right01.jpg');

% Recupero i punti 3d iniziali e la MPPleft ( K[I|0] )
points3d=stereo.X_left_1;
PPMleft = stereo.KK_left*[1 0 0 0
                          0 1 0 0
                          0 0 1 0]*eye(4);

RcameraLeft = rodrigues(stereo.omc_left_1);
Gcamera = [RcameraLeft, stereo.Tc_left_1;0 0 0 1];
% coordinate omogenee dei punti 3d nel sistema camera 1
Xcamera = Gcamera * [points3d; ones(1,size(points3d,2))]; % Mc = G * Mw (coordinate omogenee dei punti 3d nel sistema camera 1)
Mleft=PPMleft*Xcamera;
xl=Mleft(1,:)./Mleft(3,:);
yl=Mleft(2,:)./Mleft(3,:);
                
                      
% Ottengo i dati della 2 seconda camera ( MPPright = K[R|t] )
posaRight=[stereo.R stereo.T;0 0 0 1];
PPMright = stereo.KK_right*[1 0 0 0
                            0 1 0 0
                            0 0 1 0]*posaRight;
Mright=PPMright*Xcamera;
xr=Mright(1,:)./Mright(3,:);
yr=Mright(2,:)./Mright(3,:);


% Ricavo Q e q da MPP ( MPP = [Q|q] )
Q1=PPMleft(:,1:3);
Q2=PPMright(:,1:3);
q1=PPMleft(:,4);
q2=PPMright(:,4);

% Ricavo i punti di vista delle due camere ( C = -inv(Q1) * q )
Cleft = - inv(Q1)*q1;
Cright= - inv(Q2)*q2;

% Costruisco la matrice di rotazione R=[r1' r2' r3']'
% r1: nuovo asse X, dovrà essere parallelo alla baseline
r1 = (Cright - Cleft);
% Pongo un versore uguale alla vecchia asse Z
k = RcameraLeft(3,:);
% r2: nuovo asse Y, ortogonale all'asse X e al vecchio asse Z
r2 = cross(k',r1);
% r3: nuovo asse Z, ortogonale all'asse X e Y
r3 = cross(r1,r2);

% Creo R
R = [r1'/norm(r1); r2'/norm(r2); r3'/norm(r3)];

% Definisco le nuove MPP con K (matrice dei parametri intrinseci) uguale a quella della camera 1
PPMn1 = stereo.KK_left * [R -(R*Cleft) ];
PPMn2 = stereo.KK_left * [R -(R*Cright) ];

% Ricavo l'omografia
omografia1=PPMn1(:,1:3)*inv(Q1);
omografia2=PPMn2(:,1:3)*inv(Q2);

% Calcolo le nuove proiezioni dei punti rettificati
XleftNew = omografia1 * Mleft;
XrightNew = omografia2 * Mright;

% Converto da omogenee a coordinate cartesiane
Xleft(1,:)=XleftNew(1,:)./XleftNew(3,:);
Xleft(2,:)=XleftNew(2,:)./XleftNew(3,:);
Xright(1,:)=XrightNew(1,:)./XrightNew(3,:);
Xright(2,:)=XrightNew(2,:)./XrightNew(3,:);

% Applico l'omografia alle immagini
img1Rettificata = imwarp(image1,omografia1);
img2Rettificata = imwarp(image2,omografia2);


% plot
figure(1);
subplot(221);
imshow(image1);

hold on
scatter(xl,yl,'b*');
subplot(222);
imshow(image2);

hold on
scatter(xr,yr,'r*');

subplot(223);
imshow(uint8(img1Rettificata));
hold on
scatter(Xleft(1,:),Xleft(2,:),'b*');
subplot(224);
imshow(uint8(img2Rettificata));
hold on
scatter(Xright(1,:),Xright(2,:),'r*');





% Calcolo l'epipolo
e = PPMn2*[-inv(PPMn1(:,1:3))*PPMn1(:,4);1];

% Calcolo la matrice fondamentale
F = [0 -e(3) e(2); e(3) 0 -e(1);-e(2) e(1) 0];
F = F*PPMn2(:,1:3)*inv(PPMn1(:,1:3));

% Calcolo le rette epipolari da F*m ( au+bv+c=0 )
point=[18 22 27 34];
figure(2);
subplot(121); imshow(uint8(img1Rettificata)); hold on
scatter(Xleft(1,point),Xleft(2,point),'r*');
subplot(122); imshow(uint8(img2Rettificata)); hold on

x=1:size(img2Rettificata,2);
for i=point    
    m = F*XleftNew(:,i); %coefficiente della retta
    y = -x*(m(1)/m(2))-m(3)/m(2);
    % plotto la retta
    scatter(Xright(1,i),Xright(2,i),'r*');
    plot(x,y);
end




