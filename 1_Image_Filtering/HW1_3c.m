clear all; clc; close all;

I = imread('salt_pep_checker.jpg');

sigma = [1,2,5];
mask_size = 3*sigma*2 + 1;
L = floor(mask_size/2);
for k = 1:length(sigma)    
    for m = 1:mask_size(k)
        for n = 1:mask_size(k)
            G(m,n,k) = 1/(2*pi*sigma(k).^2)*exp(-((m-L(k)-1).^2+(n-L(k)-1).^2)/(2*sigma(k).^2));
        end
    end
end

M = size(I,1);
N = size(I,2);

for k = 1:size(G,3)
    II = [zeros(L(k),N+2*L(k)); zeros(M,L(k)) I zeros(M,L(k)); zeros(L(k),N+2*L(k))];
    for i = 1:M
        for j = 1:N
            J(i,j,k) = uint8(sum(sum(G(1:mask_size(k),1:mask_size(k),k).*double(II(i:i+2*L(k),j:j+2*L(k))))));        
        end
    end
    clear II
end

%% Using MATLAB Built-IN command
for k = 1:size(G,3)
    B(:,:,k) = imfilter(I,fspecial('gaussian', mask_size(k), sigma(k)));
end

%% Plotting
subplot(3,3,2); imshow(I); title('Original Image');
subplot(3,3,4); imshow(J(:,:,1)); title('\sigma = 1');
subplot(3,3,5); imshow(J(:,:,2)); title('\sigma = 2');
subplot(3,3,6); imshow(J(:,:,3)); title('\sigma = 5');
subplot(3,3,7); imshow(B(:,:,1)); title('MATLAB Built-in Command \sigma = 1');
subplot(3,3,8); imshow(B(:,:,2)); title('MATLAB Built-in Command \sigma = 2');
subplot(3,3,9); imshow(B(:,:,3)); title('MATLAB Built-in Command \sigma = 5');