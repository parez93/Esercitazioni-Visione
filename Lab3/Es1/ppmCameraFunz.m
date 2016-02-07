function [ ppm ] = ppmCameraFunz( puntiImmagine)
%PPMCAMERAFUNZ Summary of this function goes here
%   Detailed explanation goes here

puntiMondo = [5 0 5 1
              5 5 5 1
              0 5 5 1
              0 5 0 1
              5 5 0 1
              5 0 0 1];
puntiMondo = puntiMondo';


%Calcolo il prodotto esterno ed eseguo Kronecker
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

%Calcolo la la matrice di proiezione prospettica.
[u, s, v] = svd(kronecker);
ppm=reshape(v(:,size(v,2)),4,3);
ppm = ppm';

end

