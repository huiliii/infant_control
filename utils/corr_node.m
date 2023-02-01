function [r_node,p_node] = corr_node(controls, scores)

[node_num,~] = size(controls);
r_node = zeros(node_num,1);
p_node = zeros(node_num,1);


for n = 1:node_num
    [r_node(n,1), p_node(n,1)] = ...
        corr(controls(n,:)',scores);
end
% p_node = mafdr(p_node,'BHFDR',true);
r_node(p_node>0.05)=0;
