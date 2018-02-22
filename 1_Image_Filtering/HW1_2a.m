clear all; clc; close all;

I = [200 198 196 196 196 196;
199 197 195 195 195 195;
197 195 194 193 194 195;
196 194 192 192 193 194;
195 193 191 191 191 193;
196 193 191 190 191 192];

n = 8;
M = size(I,1);
N = size(I,2);
min_level = min(min(I));
max_level = max(max(I));

h = zeros(max_level-min_level+1,1);
for i = 1:M
    for j = 1:N
        h(I(i,j)-min_level+1) = h(I(i,j)-min_level+1) + 1;
    end
end

cdf = h;
for i = 2:length(h)
   cdf(i) = cdf(i-1)+h(i);
end

q = (2^n-1)/(M*N).*cdf;
q_round = round(q);