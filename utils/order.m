function ranking_order = order(arr)
% descending: 1=min
    [~,i] = sort(arr);
    r = 1:length(arr);
    r(i) = r;
    ranking_order = r';
end

