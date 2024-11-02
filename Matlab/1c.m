clc ;
clear;
close all;

syms C_alpha_r C_alpha_f a l m u I_z v gamma g r delta_f V_dot r_dot

% given parametrs 
C_alpha_f=2400;
C_alpha_r=2056;


l = 1.4; %m
a = 1.14; %m
m = 1000; %Kg
u = 20; %m/s
I_z = 1200; %Kg/m^2
g = 9.81; %m/s^2
gamma = -5*pi/180; %rad

v=0;
r=0;


A= [(-(C_alpha_f+C_alpha_r))/m/u (l*C_alpha_r-a*C_alpha_f)/m/u
    (l*C_alpha_r-a*C_alpha_f)/I_z/u -(l^2*C_alpha_r+a^2*C_alpha_f)/I_z/u]

B=[C_alpha_f/m +g
    a*C_alpha_f/I_z 0]

c=A*[v; r]+B*[delta_f ; gamma]



eq1=[c(1)==V_dot]
eq2=[c(2)==r_dot]

V_dot=0;
r_dot=0;

eq1=[c(1)==V_dot];
eq2=[c(2)==r_dot];

 delta_f_1 = vpasolve(eq1,[delta_f])
 delta_f_2 = vpasolve(eq2,[delta_f])

