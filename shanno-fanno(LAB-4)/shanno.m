% This code is developed by Dhanhanjay Pachori
clear all;close all;clc;
symbols = {'A', 'B', 'C', 'D', 'E','F','G','H'};
frequencies = [2048, 2048, 2048, 2048, 819,819, 3277, 3277];
probabilities = [];
probabilities = [probabilities, frequencies/sum(frequencies)];
[probabilities, idx] = sort(probabilities, 'descend');
symbols = symbols(idx);
codes = cell(size(symbols));
code_lengths = zeros(size(symbols));
stack = {{symbols, probabilities, ''}};
while ~isempty(stack)
    data = stack{end}; stack(end) = [];
    s = data{1}; p = data{2}; pre = data{3};
    if length(s) == 1
        idx = strcmp(symbols, s{1});
        codes{idx} = pre;
        code_lengths(idx) = length(pre);
        continue;
    end
    split = find(cumsum(p) >= sum(p) / 2, 1);
    stack{end+1} = {s(1:split), p(1:split), strcat(pre, '0')};
    stack{end+1} = {s(split+1:end), p(split+1:end), strcat(pre, '1')};
end
fprintf('Symbol\tCode\tLength\n');
for i = 1:length(symbols)
    fprintf('%s\t%s\t%d\n', symbols{i}, codes{i}, code_lengths(i));
end
