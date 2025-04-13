%% 添加水平面轨迹

t = 0.01:0.01:0.5;
t = t';
x = 5*sin(t);
y = 7*sin(2*t);
z = zeros(50,1);
yaw = 5*cos(t);

target_pose = [x,y,z];


set_param('ROVSim_dp/Kinematics','x0',num2str( target_pose(1,1),'%.2f'),...
         'y0',num2str(target_pose(1,2),'%.2f'),...
         'z0',num2str(target_pose(1,3),'%.2f'),...
         'yaw0',num2str(yaw(1),'%.2f'));%设置初始位姿

time = [];
v_output = [];
pose_output = [];
tau_output = [];
for i=2:length(target_pose)
    i
    % set target position
    
    set_param('ROVSim_dp','SimulationMode','accelerator');
    set_param('ROVSim_dp/Cmd Yaw 0-360 [Deg]','Value',num2str(yaw(i)));
    set_param('ROVSim_dp/Cmd Position X Y Z [m]','Value',sprintf('[%d %d %d]',...
        target_pose(i,1),target_pose(i,2),target_pose(i,3)));

    % start simulation
    sim('ROVSim_dp');
    
    v_output = [v_output;readVelData(logsout)];
    pose_output = [pose_output;readPoseData(logsout)];
    tau_output = [tau_output;readForceData(logsout)];
    time = [time;logsout{1}.Values.Time];
    % set initial position
    set_param('ROVSim_dp/Kinematics','x0',num2str( pose_output(end,1),'%.2f'),...
         'y0',num2str(pose_output(end,2),'%.2f'),...
         'z0',num2str(pose_output(end,3),'%.2f'),...
         'yaw0',num2str(pose_output(end,6),'%.2f'));%设置初始位姿
end

csvwrite("output\pose_data.csv", [pose_output(1:3000,:), v_output(1:3000,:)]);
csvwrite("output\thrust_data.csv", tau_output(1:3000,:));
