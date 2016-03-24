%% Coded by
% Mohamed Mohamed El-Sayed Atyya
% mohamed.atyya94@eng-st.cu.edu.eg




% Mean anomaly of elliptical orbits
close all; clear all; clc;
%% inputs
theta=linspace(0,2*pi,100);  % True anomaly
E=linspace(0,2*pi,100);  % anomaly
e=0:0.2:0.9; % eccentricity
%% calculations
for n=1:length(e)
    Me1(n,1:length(theta))=2*atan(sqrt((1-e(n))/(1+e(n)))*tan(theta/2))-e(n)*sqrt(1-e(n)^2).*sin(theta)./(1+e(n)*cos(theta));
    Me2(n,1:length(E))=E-e(n)*sin(E);
end
for nn=1:length(e)
    for mm=1:length(theta)
        if theta(mm) >= pi
            Me1(nn,mm)=Me1(nn,mm)+2*pi;
        end
    end
end
%% plotting
%---------------------------------------------------------------------------------------------------------------------------------------------------------
figure(1);
hold all;
set(gcf,'color','w');
for n=1:length(e)
    plot(theta,Me1(n,:),'linewidth',2);
    legendInfo1{n} = ['e = ' num2str(e(n))]; 
end
grid on;
xlim([0,2*pi]);
ylim([0,2*pi]);
xlabel('\theta','fontsize',18);
ylabel('M_e','fontsize',18);
title('Mean anomaly vs True anomaly','fontsize',18);
legend(legendInfo1,'location','northwest')
%---------------------------------------------------------------------------------------------------------------------------------------------------------
figure(2);
hold all;
set(gcf,'color','w');
for n=1:length(e)
    plot(E,Me2(n,:),'linewidth',2);
    legendInfo{n} = ['e = ' num2str(e(n))]; 
end
grid on;
xlim([0,2*pi]);
ylim([0,2*pi]);
xlabel('E','fontsize',18);
ylabel('M_e','fontsize',18);
title('Mean anomaly vs Eccentric anomaly','fontsize',18);
legend(legendInfo,'location','northwest')


