function G = assoluta( X, Y )


% Calcolo i centroidi
centroide_Xi = mean(X);
centroide_Yi = mean(Y);

% Calcolo gli insiemi centralizzati
x = X(:,1) - centroide_Xi(1).* ones(size(X,1),1);
y = X(:,2) - centroide_Xi(2).* ones(size(X,1),1);
z = X(:,3) - centroide_Xi(3).* ones(size(X,1),1);
X_centralizzato = [x y z];

x = Y(:,1) - centroide_Yi(1).* ones(size(Y,1),1);
y = Y(:,2) - centroide_Yi(2).* ones(size(Y,1),1);
z = Y(:,3) - centroide_Yi(3).* ones(size(Y,1),1);
Y_centralizzato = [x y z];

% Sottraggo i centroidi
Yb = rigid([0,0,0, -centroide_Yi]',Y);
Xb  = rigid([0,0,0, -centroide_Xi]',X);

% Calcolo l'SVD
[U,D,V] = svd(Xb' * Yb);
S = diag([1,1,det(U*V')]); %scala
R = U*S*V'; %rotazione
t = centroide_Xi' - R * centroide_Yi'; % traslazione

% Calcolo la posa
G =  [R, t
    0 0 0 1];

end

