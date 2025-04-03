v_0 = [0,  0,  0, 0,  0, 0];
tau = importdata("data/tau.csv");
tau = tau.data;
euler = importdata("data/euler.csv");

euler_pred = zeros(length(euler),3);
v_pred = zeros(length(euler),6);
v_pred(1,:) = v_0;
euler_pred(1,:) = euler(1,1:3);
for i = 1:(length(tau)-1)
    euler_0 = euler_pred(i,:);
    % euler_0 = euler(i,1:3);
    v_0 = v_pred(i,:);
    tau_0 = tau(i,:);
    In = [v_0,euler_0(1:2),tau_0]';
    Out = AuvMathModel(In);
    v_pred(i+1,:) = v_0' + Out * 0.05;
    v_global = TMatrix([v_0(4:6),euler_0]');
    euler_pred(i+1,:) = euler_0 + v_global' * 0.05;
end

writematrix(v_pred, 'v_pred.csv');

figure(1)
for i = 1:6
subplot(6,1,i)
plot(v_pred(:,i))
end