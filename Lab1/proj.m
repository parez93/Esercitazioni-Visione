function [ u,v ] = proj( P, c3d )
%% PROJ: trasforma un vettore da coordinate omogenee a coordinate cartesiane

h3d = [c3d ones(size(c3d,1),1)]';
h2d = P*h3d;
c2d = h2d(1:2,:)./[h2d(3,:)' h2d(3,:)']';
u = round(c2d(1,:))';
v = round(c2d(2,:))';


end

