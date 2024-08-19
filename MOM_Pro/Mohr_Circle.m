clc
clear 
close all

sigma_x=input('sigma_x=');
sigma_y=input('sigma_y=');
tau_xy=input('tau_xy,+if counterclockwise =');


%calculation of theeta p
theeta_p=(0.5*atan(2*tau_xy/((sigma_x-sigma_y)))*180/(pi));
%calculation of theeta s
theeta_s=(0.5*atan((sigma_y-sigma_x)/(2*tau_xy)))*180/pi;
%calculation of sigma average
sigma_avg=(sigma_x+sigma_y)/2;

%calculating radius of mohr circle
R=(((sigma_x-sigma_y)/2)^2+tau_xy^2)^0.5;
%calculating sigma max and sigma min
sigma_max=sigma_avg+R;
sigma_min=sigma_avg-R;
%circle description
x0=sigma_avg;
y0=0;
phi=0:pi/100:2*pi;
x=x0+R*cos(phi);
y=y0+R*sin(phi);
figure;
plot(x,y,'b',sigma_avg,0,'+',sigma_x,-tau_xy,'+',sigma_y,+tau_xy,'+',LineWidth=2);
line([sigma_x sigma_y],[-tau_xy tau_xy],linewidth=2);
axis tight;

xlabel('sigma axis');
ylabel('tau axis(clockwise) above x-axis');
title('Mohr circle');
grid minor;
axis on;

disp(['sigma_avg= ',num2str(sigma_avg)]);
disp(['R= ',num2str(R)]);
disp(['tau_max= ',num2str(R)]);
disp(['The value of normal stress when shear stress is max is ',num2str(sigma_avg)]);
disp(['sigma_max(principal stress)= ',num2str(sigma_max)]);
disp(['sigma_min(principal stress)= ',num2str(sigma_min)]);
disp(['x-coordinate of centre= ',num2str(x0)]);
disp(['y-coordinate of centre= ',num2str(y0)]);
disp(['angle at which shear stress vanishes(principal plane)= ',num2str(theeta_p),' and ',num2str(90+theeta_p)]);
disp(['angle at which shear stress is max= ',num2str(theeta_s),' and ',num2str(90+theeta_s)]);

theeta=input('Enter the angle:');
theeta2=theeta*pi/180;
%%calculating sigmax,y and tauxy dash
sigma_xdash=(sigma_avg+((sigma_x-sigma_y)*0.5)*cos(2*theeta2)+tau_xy*sin(2*theeta2));
sigma_ydash=(sigma_avg-((sigma_x-sigma_y)*0.5)*cos(2*theeta2)-tau_xy*sin(2*theeta2));
tau_xydash=(-((sigma_x-sigma_y)*0.5)*sin(2*theeta2)+tau_xy*cos(2*theeta2));
disp(['sigma_xdash= ',num2str(sigma_xdash)]);
disp(['sigma_ydash= ',num2str(sigma_ydash)]);
disp(['tau_xydash= ',num2str(tau_xydash)]);