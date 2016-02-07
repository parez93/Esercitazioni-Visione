%% Esercizio sull'algoritmo ICP
% Carico i dati
punti_fissi = load('a4000001.cnn'); % X
punti_mobili = load('a4000007.cnn');% Y

% Plotto le 2 nuvole di punti
figure(1);
plot3(punti_mobili(:,1), punti_mobili(:,2), punti_mobili(:,3), 'b.');
hold on
plot3(punti_fissi(:,1), punti_fissi(:,2), punti_fissi(:,3), 'r.');

% Inizializzo un po' di variabili
soglia_errore = 0.1;
errore = 1;
finestra = 2;
cont = 0;

% Eseguo il ciclo. Metto come max iterazioni 10 per evitare computazioni
% troppo lunghe
while(errore > soglia_errore && cont < 10)
    errore = 0;
    cont = cont + 1;
    punti_vicini_Y = [];
    min_points_of_x = [];
    
    % Per ogni punto appartenente a Y, calcolo il punto con distanza minima
    % in X
    for punto_di_y=1:size(punti_mobili,1)
        dist = 1000000000000000000;
        for punto_di_x = 1:size(punti_fissi,1)
            distanza = sqrt((punti_mobili(punto_di_y,1) - punti_fissi(punto_di_x, 1)).^2 + (punti_mobili(punto_di_y,2) - punti_fissi(punto_di_x,2)).^2 +(punti_mobili(punto_di_y,3) - punti_fissi(punto_di_x,3)).^2);
            if (distanza < dist)
                dist = distanza;
                x = punti_fissi(punto_di_x, 1);
                y = punti_fissi(punto_di_x, 2);
                z = punti_fissi(punto_di_x, 3);
            end
       end
        min_points_of_x = [min_points_of_x; x y z];        
    end
    
    % Calcolo la posa assoluta e applico la trasformazione
    G_out = assoluta(punti_mobili, min_points_of_x);
    data_out = rigid(G_out,punti_mobili);
    
    % Plotto le nuvole di punti per vedere il risultato
    figure(finestra);
    finestra = finestra + 1;
    plot3(punti_mobili(:,1), punti_mobili(:,2), punti_mobili(:,3), 'b.');
    hold on
    plot3(data_out(:,1), data_out(:,2), data_out(:,3), 'r.');

    % Calcolo l'errore
    for points=1:size(data_out,1)
        errore = errore + norm(data_out(points,:)' - (G_out(1:3, 1:3) * punti_mobili(points, :)' + G_out(4,1:3)')).^2;
    end
    punti_fissi = data_out;
end



