% -------------------------------------------------------------------
%  MATLAB file generated by Simulink.saveVars on 26-Jul-2013 19:09:58
%  MATLAB version: 8.0.0.783 (R2012b)
% -------------------------------------------------------------------Clear FDI_Result;                            
Cs = 1E-6;
% VSI input DC Voltage
E = 400;
% Initially, there is no fault in any of the six swtches
F1 = 0;
F2 = 0;
F3 = 0;
F4 = 0;
F5 = 0;
F6 = 0;

FT = 0.040196;
% Load Inductance
L = 0.0055555555555555558;
% Sinusoidal Pulse Width Mudulation (PWM) depth
M = 0.8;
% Load Resistance
R = 1;

Rfault = 0.001;
Rho = 1E-8;
% Resistance of healthy switch in off state
Roff = 100000;
% Resistance of healthy switch in on state
Ron = 0.001;

Rs = 5000;

S_Previouse = 0;

% We need to calculate max sampling time based on the circuit parameters.
%Tc = Tr./10;
m1=2;
m2=12*2;
% Sensor Sampling Time
Ts = 4.6296e-4;
% SPWM Carrier period
Tc=2*Ts*m2;
% SPWM reference period
Tr = 3*m1*Tc;
% SPWM Refrence frequency
Fr=1./Tr;
% SPWM Carrier Frequency
Fc=1./Tc;
% Modulation depth
M=0.8;
max_sample_time=(1-M)*Tc./4;
Zeta = 0.5;

epsilon_m = 0.2;

n1 = 111;

StopTime=Ts*1188;