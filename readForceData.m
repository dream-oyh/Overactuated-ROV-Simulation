function outVel = readForceData(logsout)
%READDATA 此处显示有关此函数的摘要
%   此处显示详细说明
    X = logsout{16}.Values.Data;
    Y = logsout{19}.Values.Data;
    Z = logsout{11}.Values.Data;
    K = logsout{14}.Values.Data;
    M = logsout{13}.Values.Data;
    N = logsout{10}.Values.Data;
    outVel = [X Y Z K M N];
end
