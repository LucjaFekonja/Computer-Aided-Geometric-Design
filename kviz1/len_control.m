function l = len_control(B)

dB = diff(B).^2;
l = 0;

for i = 1 : length(B(:, 1))-1
    l = l + sqrt(sum(dB(i, :)));
end