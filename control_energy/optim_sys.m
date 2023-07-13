function [X_optn,U_optn,CE_subn] = optim_sys(A,T,Network_state)

% T = 1;
node_num = size(A,1);
time_num = size(0:0.001:T,2);
state_num = size(Network_state,2);
X_optn = zeros(time_num,node_num*2,3);
U_optn = zeros(time_num,node_num,3);
CE_subn = zeros(node_num,3);

x0 = zeros(node_num,1);
for n = 1:state_num
    [X_optn(:,:,n),U_optn(:,:,n)] = optim_fun(A,T,x0,Network_state(:,n),1);
    ce = trapz(U_optn(:,:,n).^2);
    CE_subn(:,n) = ce';
end



