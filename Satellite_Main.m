%===================================================================================================================================%
%                                                   Main function                                                      %                                         
%===================================================================================================================================% 
 
function [Sensor_Data]=Satellite_Main

% The object of this function is to simulate ADCS Estimation and control algorithms during simulation

% inputs  :
         % Sensor_Data : Sensor readings.         

global wbi Q
Initial_Data;
         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         %% Orbit Propagator  %%
         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         fun                  = @propagator;
         yv                   = [ri_r;vi_r];
         yv                   = RK4(fun,t,yv); 
         ri_r                 = yv(1:3);
         vi_r                 = yv(4:6);
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
         
         fun                  = @Dyn_M;
         yv                   = [wbi;Q];
         yv                   = RK4(fun,t,yv); 
         wbi                  = yv(1:3);
         Q                    = yv(4:7)/norm(yv(4:7));
         

         