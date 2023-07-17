clear
% add optim_fun.m in the 'control_energy' path
addpath '/control_energy'
addpath '/utils'

% load structural connectome and demo data

% A_subn = indivdiual_structural_connectome
[node_num,~,sub_num] = size(A_subn); 


%% calculate optim control energy to activate the target network from baseline brain state
% load network_state 

net_num = size(network_name,1);
control_energy = zeros(node_num,net_num,sub_num);
for n = 1:sub_num
    [~,~,control_energy(:,:,n)] = optim_sys(A_subn(:,:,n),1,network_state);
end


%% compare the energy consumption between preterm and term infant group

% whole-brain level
[h,p,~,stst] = ttest2(mean(control_energy_term(:,network_num,:)),mean(control_energy_preterm2(:,network_num,:)));
