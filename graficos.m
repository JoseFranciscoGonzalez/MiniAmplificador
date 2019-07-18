 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dispositivos Semiconductores
% FIUBA - Universidad de Buenos Aires
% Trabajo Práctico 1
% Cálculos Análisis de pequeña señal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all, close all;
graphics_toolkit gnuplot

% Importo la simulación de LTSpice.
SIM1=dlmread('Simucon5mvout.txt','\t',1,0);
SIM2=dlmread('Simucon5mvvIN.txt','\t',1,0);

SIM3=dlmread('SImucon60mvparamedirROUTconRLde270.txt','\t',1,0);
SIM4=dlmread('Tensionde60mvsimuladaparacalculodeRIN.txt','\t',1,0);

SIM5=dlmread('Simucon60mvvout.txt','\t',1,0);
SIM6=dlmread('SImucon60mvvIN.txt','\t',1,0);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Gráficos

Hf = figure(1);

set(Hf,'PaperUnits','inches','PaperPosition',[0 0 3.5 2.5]);

Ha = axes;

set(Ha,'Box','on','FontName','Arial','FontSize',8,'GridLineStyle','--','LineWidth',1,'TickDir','in');
grid on;	
hold on;
grid minor;

plot(Ha,SIM1(2:1:end,1),((SIM1(2:1:end,2))-1.25)*1000,'-','linewidth',3,'markersize',2,'markerfacecolor','r');

plot(Ha,SIM2(2:1:end,1),(SIM2(2:1:end,2)-0.7+0.0081)*1000*20,'-r','linewidth',3,'markersize',2,'markerfacecolor','r');

%[haxes,hline1,hline2] = plotyy(SIM1(2:1:end/3,1),((SIM1(2:1:end/3,2))-1.25)*1000,SIM2(2:1:end/3,1),(SIM2(2:1:end/3,2)-0.7+0.008)*1000*20);

%set(haxes,{'ycolor'},{'k';'k'});
%ylabel(haxes(1), 'V_{out} [mV]');
%ylabel(haxes(2), 'V_{in} [mV]');

xlim([0,0.002])
ylim([-60,70])

%ylim([-0.4,0.2])
%axis()

ylabel('v_{out} [mV]');
xlabel('t [s]');


Hleg = legend(Ha,'SIM. V_{out}','SIM. V_{in}',"location",'southeast');
legend('boxon');
set(Hleg,'FontName','Arial','FontSize',6);

print('SIM_VOUT_VIN_VS5mV.png','-dpng','-r300');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Gráficos

Hf = figure(2);

set(Hf,'PaperUnits','inches','PaperPosition',[0 0 3.5 2.5]);

Ha = axes;

set(Ha,'Box','on','FontName','Arial','FontSize',8,'GridLineStyle','--','LineWidth',1,'TickDir','in');
grid on;	
hold on;
grid minor;

plot(Ha,SIM3(2:1:end,1),((SIM3(2:1:end,2)))*1000,'-','linewidth',3,'markersize',2,'markerfacecolor','r');
plot(Ha,SIM5(2:1:end,1),((SIM5(2:1:end,2))-1.25)*1000,'r','linewidth',3,'markersize',2,'markerfacecolor','r');
%plot(Ha,SIM2(2:1:end,1),(SIM2(2:1:end,2)-0.7+0.0081)*1000*20,'-r','linewidth',3,'markersize',2,'markerfacecolor','r');

%[haxes,hline1,hline2] = plotyy(SIM1(2:1:end/3,1),((SIM1(2:1:end/3,2))-1.25)*1000,SIM2(2:1:end/3,1),(SIM2(2:1:end/3,2)-0.7+0.008)*1000*20);

%set(haxes,{'ycolor'},{'k';'k'});
%ylabel(haxes(1), 'V_{out} [mV]');
%ylabel(haxes(2), 'V_{in} [mV]');

xlim([0,0.002])
ylim([-1000,900])

%ylim([-0.4,0.2])
%axis()

ylabel('v_{out} [mV]');
xlabel('t [s]');


Hleg = legend(Ha,'SIM. v_{out} con carga de 270 Ohm','SIM. v_{out} sin carga',"location",'southeast');
legend('boxon');
set(Hleg,'FontName','Arial','FontSize',6);

print('SIM_ROUT_VS60mV.png','-dpng','-r300');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Gráficos

Hf = figure(3);

set(Hf,'PaperUnits','inches','PaperPosition',[0 0 3.5 2.5]);

Ha = axes;

set(Ha,'Box','on','FontName','Arial','FontSize',8,'GridLineStyle','--','LineWidth',1,'TickDir','in');
grid on;	
hold on;
grid minor;

plot(Ha,SIM4(2:1:end,1),((SIM4(2:1:end,2)))*1000,'-','linewidth',3,'markersize',2,'markerfacecolor','r');
plot(Ha,SIM6(2:1:end,1),((SIM6(2:1:end,2))-0.7+0.009)*1000,'r','linewidth',3,'markersize',2,'markerfacecolor','r');
%plot(Ha,SIM2(2:1:end,1),(SIM2(2:1:end,2)-0.7+0.0081)*1000*20,'-r','linewidth',3,'markersize',2,'markerfacecolor','r');

%[haxes,hline1,hline2] = plotyy(SIM1(2:1:end/3,1),((SIM1(2:1:end/3,2))-1.25)*1000,SIM2(2:1:end/3,1),(SIM2(2:1:end/3,2)-0.7+0.008)*1000*20);

%set(haxes,{'ycolor'},{'k';'k'});
%ylabel(haxes(1), 'V_{out} [mV]');
%ylabel(haxes(2), 'V_{in} [mV]');

xlim([0,0.002])
%ylim([-1000,900])

%ylim([-0.4,0.2])
%axis()

ylabel('v_{s}, v_{in} [mV]');
xlabel('t [s]');


Hleg = legend(Ha,'SIM. v_{s} ','SIM. v_{in}',"location",'southwest');
legend('boxon');
set(Hleg,'FontName','Arial','FontSize',6);

print('SIM_RIN_VS60mV.png','-dpng','-r300');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%