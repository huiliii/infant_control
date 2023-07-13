clear
% add optim_fun.m in the current path
addpath '/control_energy'
addpath '/utils'

% load structural connectome and demo data

% A_subn = group_structural_connectome
[node_num,~,sub_num] = size(A_subn); 


%% optim
% load network_state 

net_num = size(network_name,1);
control_energy = zeros(node_num,net_num,sub_num);
for n = 1:sub_num
    [~,~,control_energy(:,:,n)] = optim_sys(A_subn(:,:,n),1,network_state);
end


%% term vs preterm analysis

% whole-brain level
[h,p,~,stst] = ttest2(mean(control_energy_term(:,network_num,:)),mean(control_energy_preterm2(:,network_num,:)));
