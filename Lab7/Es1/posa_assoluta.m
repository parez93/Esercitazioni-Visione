%% Esercizio sulla posa assoluta

clear all
close all
clc

load Corr3D.mat

X = model_i;
Y = data_i;

% Calcolo la posa assoluta
G = assoluta(model_i, data_i);

data_out = rigid(G,data_i);

% Plotto le nuvole di punti di partenza
figure(1);
plot3(model_i(:,1), model_i(:,2), model_i(:,3), 'b.');
hold on
plot3(data_i(:,1), data_i(:,2), data_i(:,3), 'r.');
grid on
axis equal

% Plotto le nuvole di punti dopo aver risolto il problema della posa
% assoluta
figure(2);
plot3(model_i(:,1), model_i(:,2), model_i(:,3), 'b.');
hold on
plot3(data_out(:,1), data_out(:,2), data_out(:,3), 'r.');
grid on
axis equal

