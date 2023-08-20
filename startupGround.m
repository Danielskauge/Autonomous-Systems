%% open sesame
close_system('sl_groundvehicleDynamics',0);
 
homedir = pwd; 

addpath( genpath(strcat(homedir,[filesep,'toolboxes'])));

cd('toolboxes/MRTB');
startMobileRoboticsSimulationToolbox;

cd(homedir);

open_system('sl_groundvehicleDynamics_screwy2'); %differential robot

cd(homedir);

%%
% try and get transfer function in here. 
        % define some test waypoint (x,y) data
        W   = [  0, 0;
                 1, 0;
                 1, 0.5;
                 0, 0.5;
                 0, 1;
                 1, 1;
               ];

        % create an instance of the ARENA class.
        OBJ = bh_ddr_arena_CLS( W(:,1), W(:,2) )  ;

        % plot the arena
        figure(1)
        OBJ.plot_arena()

        % get axes handle and path height for drawing vehicles
        hax = OBJ.get_ax();
        z   = OBJ.get_path_height();  

    OBJ = bh_ddr_vehicle_CLS('init_xytheta',    [1,2,-pi/4], ...
                             'scale_factor',    0.5, ...
                             'color',           [0,1,0], ...
                             'road_z',          1, ...
                             'veh_ID_str',      'BRADS_CAR', ...
                             'tgt_tag_ax_name', 'TAG_AX_ARENA');

    OBJ.plot_init()

    % animate the vehicle
    xx_list = linspace(1,5,20);
    th_list = linspace(0,2*pi,20);

    for kk=1:length(xx_list)
        xx = xx_list(kk);
        tt = th_list(kk);

        OBJ.plot(xx,2,tt)

        pause(0.1);
        fprintf('\n ... xx=%6.2f',xx);
    end

