function new_brain_meas = regress_demos_node(brain_meas,demos)

num_node = size(brain_meas,1);
new_brain_meas = zeros(size(brain_meas));

for n = 1:num_node
    new_brain_meas(n,:) = regress_demo(brain_meas(n,:)',demos);
end