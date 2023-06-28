
%===================================================================================================================================%
%                                                     initial_main_data                                                             %                                         
%===================================================================================================================================%
clc

global s2d m2d rad 

m2d    = 1/60;
s2d    = 1/3600;
rad    = pi/180;


%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% Satellite Main Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


global J ric sa la ms LEN W H 

g      = 9.80665;                                    % Acceleration constant  ,m/sec2

J      = [5     0   0                        % satellite inertia tensor [ Jxx  -Jxy  -Jxz
          0     5    0                        %                           -Jyz   Jyy  -Jyz
          0     0    5];                     %                           -Jzx  -Jzy   Jzz ] , kg.m2
       
ric    = -[-.00162 -.02795 -.36544]';                % vector between satellite COM and origin of DCS ,m
sa     = .755;                                       % characterstic Area ,m2
la     = .722;                                       % characterstic length ,m2
ms      = 160;                                       % total satellite mass, kg                                                                       

LEN=.75;                                              % Satellite Length,m
W=.75;                                              % Satellite Width,m
H=.8;                                                % Satellite Height,m

%===================================================================================================================================%
%                                                    Constant parameters                                                            %                                         
%===================================================================================================================================%
global Rs Re km mu R we g AU eE wea qs rad h


mu     = 3.98600441800*10^5 ;                        % Earth Gravitational constant  km3.s-2
Re     = 6378.1363 ;                                 % Earth mean equatorial radius km
R      = 6.371e3;                                    % average radius of the Earth ,km 
km     = 1;                                          % Parameter used for solving the problem of indexing (0,0)
rad    = pi/180 ;                                    % degree to radian
we     = 7.2921158553e-5;                            % Earth rotation rad/sec included siderial time tranformation
g      = 9.80665;                                    % Acceleration constant  ,m/sec2
AU     = 149597870;                                  % Asrtonomical units,km
eE     = .081819221456;                              % Earth eccentricity
wea    = 755.5e-7;                                   % sum of angular velocities of the Earth and air rotation ,rad/sec
qs     = 2.36e-7*g;                                  % light presure ,N/m2
Rs     = 6.9599e5;                                   % Sun mean equatorial radius km
h      = 10;                                         % Time Step, sec
%===================================================================================================================================%
%                                              Initial data of simulation (GPS DATA)                                                           %                                         
%===================================================================================================================================%
global  lamdao T t

T= [2015 06 01 00 00 00];                              % Starting Date.
lamdao   = GST(T);                                     % Greenwich sidereal time at epoch,rad
t        = 0;
Euler =[30 30 30];
Angularv=[2,2,2];

global Q wbi ri_r vi_r Md Md_r Bi rho rs Tig QBI
QBI    =[0,0,0,1]';
Eul_in = Euler*rad;
Q      = E2Q(Eul_in(1),Eul_in(2),Eul_in(3));
% Q    = [0,0,0,1]';                         
wbi    = Angularv'*rad;
ri_r   = [-2540.616815    -6606.458173       -0.000000]';
vi_r   = [-0.998128       0.383846       7.427699]';




