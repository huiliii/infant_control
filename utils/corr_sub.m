function [r_sub,p_sub] = corr_sub(meas1_group,meas2_group)
% input group_level measure1 and measure2: num_regions x num_subs
% do correlation on individual level 
% output r_sub, p_sub: num_sub x1

% [num_region,num_sub] = size(meas1_group);
% for s = 1:num_sub
%     [r_sub(s,1),p_sub(s,1)] = corr(meas1_group(:,s),meas2_group(:,s));
% end

[r,p] = corr(meas1_group,meas2_group);
r_sub = diag(r);
p_sub = diag(p);


