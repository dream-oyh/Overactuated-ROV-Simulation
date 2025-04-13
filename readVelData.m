function outVel = readVelData(logsout)
%READDATA 此处显示有关此函数的摘要
%   此处显示详细说明
    u = logsout{4}.Values.Data;
    v = logsout{5}.Values.Data;
    w = logsout{6}.Values.Data;
    p = logsout{23}.Values.Data;
    q = logsout{25}.Values.Data;
    r = logsout{24}.Values.Data;
    outVel = [u v w p q r];
end

