clc;
clear;
close all;

leaf=load('../data/Michelia leaf.txt');

minX=min(leaf(:,1));maxX=max(leaf(:,1));
minY=min(leaf(:,2));maxY=max(leaf(:,2));
minZ=min(leaf(:,3));maxZ=max(leaf(:,3));
leafX=formatPoint(leaf(:,1),minX);
leafY=formatPoint(leaf(:,2),minY);
leafZ=formatPoint(leaf(:,3),minZ);