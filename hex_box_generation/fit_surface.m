function [modelRANSAC] = fit_surface(p)
x=p(:,1);
y=p(:,2);
z=p(:,3);

sampleSize = 2; % number of points to sample per trial
maxDistance = 2; % max allowable distance for inliers

fitLineFcn = @(points) fit([x,y],z); % fit function using polyfit
evalLineFcn = ...   % distance evaluation function
  @(model, p) sum((z - polyval(model, x,y)).^2,2);

[modelRANSAC, inlierIdx] = ransac(p,fitLineFcn,evalLineFcn,sampleSize,maxDistance);
end

