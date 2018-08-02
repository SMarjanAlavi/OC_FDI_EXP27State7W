% Drawhelp re VSP (Voltage Space Patterns) from saved data. 
% We need to load Q2SCF.mat which is the data saved from experiment;
% SCF (Short Circuit Fault)
% OCF (Open Circuit Fault)
% Q2 (Location of the fault in the three-phase VSI circuit; 
% In this example,the 2nd semiconductor switch, Q2, is faulty) 
%------------------
%Pre-processing the experimental data:
% The experimental data is saved in FDIresult which is a 1x5 data structure.
% Time includes the time instants when the data is read by the sensor.
Time = FDIresult.time;
% Va is the voltage of phase 1 
Va = FDIresult.signals(:,1).values;
% Vb is the voltage of phase 2
Vb=FDIresult.signals(:,2).values;
% Vc is the voltage of phase 3 
Vc=FDIresult.signals(:,3).values;
% S is the state number (0  to 26 states for a two level three phase inverter concidering zero states)
S=FDIresult.signals(:,4).values;
J=FDIresult.signals(:,5).values;
%     Here, we want to find the data structure indexes for the time instants where the fault
%   was inserted and fault is cleared. We will use these indices to plot the faulty and 
%   healthy signals in different colors.
for i=1:length(Va)-1
    if(t_insertion(i)==t_insertion(i+1))
        break;
    end
end
T_d=i+1;%Fault_insertion_index
% Here we want to find the data structure index for 
for i=1:length(Va)-1
    if(t_clear(i)==t_clear(i+1))
        break;
    end
end
T_c=i;%Fault_clear_index
%------------------
%Plot voltage signals in voltage space a Time-free space.
figure('units','centimeters','position',[12 12 7 7])
set(gca,'FontSize', 8)
set(gca,'Units','centimeters')
set(gca,'Position',[1.5 1 5 5])
set(gca,'ActivePositionProperty','position')
LV=length(Va);
%Plot all three phase voltages in blue
plot3(Va(1:LV),Vb(1:LV),Vc(1:LV),'.-b','LineWidth',1); grid on;hold on;
%Change the color of the voltage signals into red for the duration of the fault.
plot3(Va(T_d:T_c),Vb(T_d:T_c),Vc(T_d:T_c),'r-O','LineWidth',2); grid on;hold on;
%The assumption of single fault exists, so the fault code would not change by the end of the experiment
title(sprintf('Q%d', J1(length(J1))));
axis([-6 6 -6 6 -6 6]);
view(-34,18)
xlabel('Va(V)');
ylabel('Vb(V)');
zlabel('Vc(V)');
legend('boxon');
%-----------------------------------------------
%Show the voltage signals in time domain 
figure;
subplot(5,1,1);
plot(Time,Va,'.b');hold on; plot(Time,Va,'b');hold on;
plot(Time(T_d:T_c),Va(T_d:T_c),'.r');hold on; plot(Time(T_d:T_c),Va(T_d:T_c),'r');hold on;
title(sprintf('Time domain results for FDI of Q%d', J1(length(J1))));
ylabel('v_A(V)');
subplot(5,1,2);
plot(Time,Vb,'.b');hold on; plot(Time,Vb,'b');hold on;
plot(Time(T_d:T_c),Vb(T_d:T_c),'.r');hold on; plot(Time(T_d:T_c),Vb(T_d:T_c),'r');hold on;
ylabel('v_B(V)');
subplot(5,1,3);
plot(Time,Vc,'.b');hold on; plot(Time,Vc,'b');hold on;
plot(Time(T_d:T_c),Vc(T_d:T_c),'.r');hold on; plot(Time(T_d:T_c),Vc(T_d:T_c),'r');hold on;
ylabel('v_C(V)');
subplot(5,1,4);
plot(Time,S,'.b');hold on; plot(Time,S,'b');hold on;
plot(Time(T_d:T_c),S(T_d:T_c),'.r');hold on; plot(Time(T_d:T_c),S(T_d:T_c),'r');hold on;
ylabel('s');
subplot(5,1,5);
plot(Time,J,'.b');hold on; plot(Time,J,'b');hold on;
plot(Time(T_d:T_c),J(T_d:T_c),'.r');hold on; plot(Time(T_d:T_c),J(T_d:T_c),'r');hold on;
ylabel('J');
xlabel('t(s)');