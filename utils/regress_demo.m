function new_brain_meas = regress_demo(brain_meas, demos)

b = fitglm(demos, brain_meas);

new_brain_meas = brain_meas - table2array(b.Fitted(:,1));
end
