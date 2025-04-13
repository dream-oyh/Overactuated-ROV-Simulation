function outVel = readPoseData(logsout)
%READDATA 此处显示有关此函数的摘要
%   此处显示详细说明
    X = logsout{26}.Values.Data;
    Y = logsout{27}.Values.Data;
    Z = logsout{28}.Values.Data;
    P = logsout{1}.Values.Data;
    Q = logsout{2}.Values.Data;
    R = logsout{3}.Values.Data;
    outVel = [X Y Z P Q R];
end
