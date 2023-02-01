function net_cons = net_divid(cons,nets)

net_num = length(unique(nets));
sub_num = size(cons,2);

net_cons = zeros(net_num,sub_num);

for n = 1:net_num
    net_cons(n,:) = mean(cons(nets==n,:));
end
