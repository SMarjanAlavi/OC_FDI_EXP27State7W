clc;
close all;
clear all;
%Read saved data from sensors
load('Q1OCF.mat');
% Initialize model parameters
Initialize;
% Draw Voltage Space Patterns
DrawVSP;
% Calculate Diagnosis time
FDI_Time_OCF_Q1=Diagnosis_Time(length(Diagnosis_Time));
sprintf('OCF in Q1 was diagnosed in %.0f microseconds',FDI_Time_OCF_Q1)
