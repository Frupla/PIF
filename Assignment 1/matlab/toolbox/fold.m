function s = fold(x, h)
N = length(x) + length(h) - 1;
t = 1:N;
h = zero_pad(h,t);
x = zero_pad(x,t);

hf = fliplr(h);

s = 1:N;

for k = 1:N
    s(k) = sum(x(1:k).*hf(N-k+1:end));  
end

end