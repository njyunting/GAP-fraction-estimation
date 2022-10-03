clear;clc;close all;

a=zeros(10,10,10);

a(3,3,3)=1;
a(7,7,8)=1;
D=bwdist(a);
L=watershed(D);

[x,y,z] = meshgrid(1:10);

figure
isosurface(x,y,z,a,0.5), axis equal
figure
isosurface(x,y,z,D,0.5), axis equal
figure
isosurface(x,y,z,L,0.5), axis equal
