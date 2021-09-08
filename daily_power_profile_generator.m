clear;
close all;
clc;
day_dem = [];
    %initializing demand values
    lightsr1 = 0;
    lightsr2 = 0;
    lightsr3 = 0;
    demAC1 = 0;
    demAC2 = 0;
    demAC3 = 0; 
    demmach1 =0;
    demmach2 =0;
    demmach3 =0;
    %setting demand for low demand night time 00:00 - 5:30
for i = 1:22
    f = @(dem)(dem(1) + dem(2) + dem(3) + dem(4)+ dem(4)+ dem(5)+ dem(6)+ dem(7)+ dem(8)+ dem(9)+ dem(10));  %define function for minimization
    lb = [12*((0.8-0.6)*rand+0.6), 12*((0.8-0.6)*rand+0.6), 12*((0.8-0.6)*rand+0.6), 10*((0.8-0.6)*rand+0.6), 10*((0.8-0.6)*rand+0.6), 10*((0.8-0.6)*rand+0.6), 0,0,0,30*((0.8-0.6)*rand+0.6)]; %lower bound
    ub = [12*((1-0.8)*rand+0.8), 12*((1-0.8)*rand+0.8), 12*((1-0.8)*rand+0.8), 10*((1-0.8)*rand+0.8), 10*((1-0.8)*rand+0.8), 10*((1-0.8)*rand+0.8), 0,0,0,30*((1-0.8)*rand+0.8)];  %upper bound
    A = []; %coefficients for linear inequality constraints
    b = []; %constants for linear inequality constraints
    Aeq = []; %coefficients for linear equality constraints
    beq = [];  %constants for linear equality constraints
    dem0 = [9.6,9.6,9.6,8,8,8,0,0,0,24];  %initial guess
    [dem,fval] = fmincon(f,dem0,A,b,Aeq,beq,lb,ub);   %fmincon function to perform constrained optimization
    lightsr1 = dem(1);
    lightsr2 = dem(2);
    lightsr3 = dem(3);
    demAC1 = dem(4);
    demAC2 = dem(5);
    demAC3 = dem(6);
    demmach1 =dem(7);
    demmach2 =dem(8);
    demmach3 =dem(9);
    demmisc = dem(10);
    totaldem = lightsr1+lightsr2+lightsr3+demAC1+demAC2+demAC3+demmach1+demmach2+demmach3;
    day_dem = [day_dem totaldem];
end
    %setting demand for daytime part-peak period 5:30 -10:30
for i = 0:22
    f = @(dem)(dem(1) + dem(2) + dem(3) + dem(4)+ dem(4)+ dem(5)+ dem(6)+ dem(7)+ dem(8)+ dem(9)+ dem(10));  %define function for minimization
    lb = [12*((0.8-0.6)*rand+0.6), 12*((0.8-0.6)*rand+0.6), 12*((0.8-0.6)*rand+0.6), 10*((0.8-0.6)*rand+0.6), 10*((0.8-0.6)*rand+0.6), 10*((0.8-0.6)*rand+0.6), (30+3*i)*((1-0.8)*rand+0.8) ,(40+3*i)*((1-0.8)*rand+0.8), (30+3*i)*((1-0.8)*rand+0.8),30*((0.8-0.6)*rand+0.6)]; %lower bound
    ub = [12*((1-0.8)*rand+0.8), 12*((1-0.8)*rand+0.8), 12*((1-0.8)*rand+0.8), 10*((1-0.8)*rand+0.8), 10*((1-0.8)*rand+0.8), 10*((1-0.8)*rand+0.8), (30+3*i)*((1-0.8)*rand+0.8) ,(40+3*i)*((1-0.8)*rand+0.8), (30+3*i)*((1-0.8)*rand+0.8),30*((1-0.8)*rand+0.8)];  %upper bound
    A = []; %coefficients for linear inequality constraints
    b = []; %constants for linear inequality constraints
    Aeq = []; %coefficients for linear equality constraints
    beq = [];  %constants for linear equality constraints
    dem0 = [9.6,9.6,9.6,8,8,8,30+3*i ,40+3*i, 30+3*i,24];  %initial guess
    [dem,fval] = fmincon(f,dem0,A,b,Aeq,beq,lb,ub);   %fmincon function to perform constrained optimization
    lightsr1 = dem(1);
    lightsr2 = dem(2);
    lightsr3 = dem(3);
    demAC1 = dem(4);
    demAC2 = dem(5);
    demAC3 = dem(6);
    demmach1 =dem(7);
    demmach2 =dem(8);
    demmach3 =dem(9);
    demmisc = dem(10);
    totaldem = lightsr1+lightsr2+lightsr3+demAC1+demAC2+demAC3+demmach1+demmach2+demmach3;
    day_dem = [day_dem totaldem];
end
%setting demand for daytime peak period 10:30 - 16:00
for i = 0:22
    f = @(dem)(dem(1) + dem(2) + dem(3) + dem(4)+ dem(4)+ dem(5)+ dem(6)+ dem(7)+ dem(8)+ dem(9)+ dem(10));  %define function for minimization
    lb = [12*((0.8-0.6)*rand+0.6), 12*((0.8-0.6)*rand+0.6), 12*((0.8-0.6)*rand+0.6), 10*((0.8-0.6)*rand+0.6), 10*((0.8-0.6)*rand+0.6), 10*((0.8-0.6)*rand+0.6), 90+0.25*i ,90+0.25*i, 90+0.25*i,30*((0.8-0.6)*rand+0.6)]; %lower bound
    ub = [12*((1-0.8)*rand+0.8), 12*((1-0.8)*rand+0.8), 12*((1-0.8)*rand+0.8), 10*((1-0.8)*rand+0.8), 10*((1-0.8)*rand+0.8), 10*((1-0.8)*rand+0.8), 90+0.25*i ,90+0.25*i, 90+0.25*i,30*((1-0.8)*rand+0.8)];  %upper bound
    A = []; %coefficients for linear inequality constraints
    b = []; %constants for linear inequality constraints
    Aeq = []; %coefficients for linear equality constraints
    beq = [];  %constants for linear equality constraints
    dem0 = [9.6,9.6,9.6,8,8,8,0,0,0,24];  %initial guess
    [dem,fval] = fmincon(f,dem0,A,b,Aeq,beq,lb,ub);   %fmincon function to perform constrained optimization
    lightsr1 = dem(1);
    lightsr2 = dem(2);
    lightsr3 = dem(3);
    demAC1 = dem(4);
    demAC2 = dem(5);
    demAC3 = dem(6);
    demmach1 =dem(7);
    demmach2 =dem(8);
    demmach3 =dem(9);
    demmisc = dem(10);
    totaldem = lightsr1+lightsr2+lightsr3+demAC1+demAC2+demAC3+demmach1+demmach2+demmach3;
    day_dem = [day_dem totaldem];
end
    %setting demand for low-demand end-of-day 16:00 - 00:00
for i = 1:28
    f = @(dem)(dem(1) + dem(2) + dem(3) + dem(4)+ dem(4)+ dem(5)+ dem(6)+ dem(7)+ dem(8)+ dem(9)+ dem(10));  %define function for minimization
    lb = [12*((0.8-0.6)*rand+0.6), 12*((0.8-0.6)*rand+0.6), 12*((0.8-0.6)*rand+0.6), 10*((0.8-0.6)*rand+0.6), 10*((0.8-0.6)*rand+0.6), 10*((0.8-0.6)*rand+0.6), 0,0,0,30*((0.8-0.6)*rand+0.6)]; %lower bound
    ub = [12*((1-0.8)*rand+0.8), 12*((1-0.8)*rand+0.8), 12*((1-0.8)*rand+0.8), 10*((1-0.8)*rand+0.8), 10*((1-0.8)*rand+0.8), 10*((1-0.8)*rand+0.8), 0,0,0,30*((1-0.8)*rand+0.8)];  %upper bound
    A = []; %coefficients for linear inequality constraints
    b = []; %constants for linear inequality constraints
    Aeq = []; %coefficients for linear equality constraints
    beq = [];  %constants for linear equality constraints
    dem0 = [9.6,9.6,9.6,8,8,8,0,0,0,24];  %initial guess
    [dem,fval] = fmincon(f,dem0,A,b,Aeq,beq,lb,ub);   %fmincon function to perform constrained optimization
    lightsr1 = dem(1);
    lightsr2 = dem(2);
    lightsr3 = dem(3);
    demAC1 = dem(4);
    demAC2 = dem(5);
    demAC3 = dem(6); 
    demmach1 =dem(7);
    demmach2 =dem(8);
    demmach3 =dem(9);
    demmisc = dem(10);
    totaldem = lightsr1+lightsr2+lightsr3+demAC1+demAC2+demAC3+demmach1+demmach2+demmach3;
    day_dem = [day_dem totaldem];
end