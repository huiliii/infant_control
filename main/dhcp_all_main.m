clear

% add ave_control.m, modal_control.m in current path
addpath '/utils'

% load structural connectome and demo data
% A_subn = individual structural connectome


[node_num,~,sub_num] = size(A_subn); 

A = A_subn(:,:,1)

%% controllability
aver_cons = zeros(node_num,sub_num);

for s = 1:sub_num
    aver_cons(:,s) = ave_control(A_subn(:,:,s));
end

modal_cons = zeros(node_num,sub_num);

for s = 1:sub_num
    modal_cons(:,s) = modal_control(A_subn(:,:,s));
end
%% aver vs modal

% across subjects
[rs,ps] = corr(mean(aver_cons)',mean(modal_cons)')
% across region
[rr,pr] = corr(mean(aver_cons,2),mean(modal_cons,2))


%% control for sex, brain volume, 

demos = [sex volume motion];

aver_cons_cont = regress_demos_node(aver_cons,demos);
modal_cons_cont = regress_demos_node(modal_cons,demos);
node_degree_cont = regress_demos_node(node_degree,demos);

%% whole-brain controllability ~ age (PMA/GA)

[r_avercons_ga,p_avercons_ga] = corr(mean(aver_cons_cont)',ga);
[r_avercons_pma,p_avercons_pma] = corr(mean(aver_cons_cont)',pma);
[r_modalcons_ga,p_modalcons_ga] = corr(mean(modal_cons_cont)',ga);
[r_modalcons_pma,p_modalcons_pma] = corr(mean(modal_cons_cont)',pma);

%% node-level controllability ~ age (PMA/GA)
[r_avercons_ga_node,p_avercons_ga_node] = corr_node(aver_cons_cont,ga);
[r_avercons_pma_node,p_avercons_pma_node] = corr_node(aver_cons_cont,pma);
[r_modalcons_ga_node,p_modalcons_ga_node] = corr_node(modal_cons_cont,ga);
[r_modalcons_pma_node,p_modalcons_pma_node] = corr_node(modal_cons_cont,pma);

%% network-level controllability ~ age

[r_avercons_ga_net,p_avercons_ga_net] = corr_node(net_divid(aver_cons_cont,net_index'),ga);
[r_avercons_pma_net,p_avercons_pma_net] = corr_node(net_divid(aver_cons_cont,net_index'),pma);
[r_modalcons_ga_net,p_modalcons_ga_net] = corr_node(net_divid(modal_cons_cont,net_index'),ga);
[r_modalcons_pma_net,p_modalcons_pma_net] = corr_node(net_divid(modal_cons_cont,net_index'),pma);



%% super controller development

r_ac = zeros(90,1);
p_ac = zeros(90,1);

r_mc = zeros(90,1);
p_mc = zeros(90,1);


for n = 1:90
    [r_ac(n),p_ac(n)] = corr(aver_cons(n,:)',pma);
    
    [r_mc(n),p_mc(n)] = corr(modal_cons(n,:)',pma);

end
p_ac_FDR = mafdr(p_ac,'BHFDR',true);
p_mc_FDR = mafdr(p_mc,'BHFDR',true);

r_ac(p_ac_FDR>0.05)=0;
r_mc(p_mc_FDR>0.05)=0;


[r_de_ac,p_de_ac] = corr(mean(aver_cons(r_ac~=0,:),2),r_ac(r_ac~=0))


[r_de_mc,p_de_mc] = corr(mean(modal_cons(r_mc~=0,:),2),r_mc(r_mc~=0))

