clc
clear all
%%image analysis
%The images from 1:4 are for CoCl2 case while from 5:8 are Control cases.
for i=1:8    
name=[num2str(i) '.tif'];
Image_data = imread(name);
% Display the noisy image
subplot(1,2,1);
imshow(Image_data);
title('Noisy Image');
%Noise Reduction
denoised_img = medfilt3(Image_data,[5 5 3]);
 %Display the denoised image
subplot(1,2,2);
imshow(denoised_img);
title('Denoised Image');
image_data_sum = sum(Image_data, 3);
[x, y] = size(image_data_sum);
z = 1;
value = 150;
for a= 1:x
    for b = 1:y
        if image_data_sum(a, b) > value
            Feature_matrix(z, :) = [a, b, image_data_sum(a, b)];
            z = z + 1;
        end
    end
end
image = im2double(Image_data(:, :, 2));
Final_Matrix(:, :, 1) = image;
% figure(1)
% h = heatmap(image, 'Colormap', parula);
% h.GridVisible = 'off';
Final_PP = reshape(Final_Matrix,512*512,[]);
feat = pca(Final_PP);
afterpca = Final_PP*feat;
for j = 1:4
    Image_PP  = reshape(afterpca(:,1), 512, 512);
    if j == 1
        img1 = Image_PP;
    end
%  figure(10+j)
%  h = heatmap(Image_PP, 'colormap', parula);
%  h.GridVisible = 'off';
end
%Evaluating optimum no. of clusters
% eva = evalclusters(Feature_matrix, 'kmeans','DaviesBouldin','KList', 3:4);
% optimum_k = eva.OptimalK;
% 
% %%Clustering of the points using K-means algorithm 
% figure(2)
% idx = kmeans(Feature_matrix(:, 1:2), optimum_k);
% scatter(Feature_matrix(:, 1), Feature_matrix(:, 2), 4, idx, 'filled')
% title('K-Means Clustering')
%%Clustering of the points using DBScan algorithm 
figure(3)
idx = dbscan(Feature_matrix(:, 1:2), 9, 25, 'Distance', 'squaredeuclidean');
Search_radius = 3;
Minimum_points = 5;
idx = dbscan(Feature_matrix(:,1:2),Search_radius,Minimum_points);
outliers = find(idx<0);
idx(outliers) = []
Feature_matrix(outliers,:) = [];
scatter(Feature_matrix(:, 1), Feature_matrix(:, 2), 4, idx, 'filled')
title('DBScan-Clustering')

%Define colors for each cluster
colors = lines(max(idx));

%Plot the clusters
figure;
hold on;
for i = 1:max(idx)
    scatter(Feature_matrix(idx == i, 1), Feature_matrix(idx == i, 2), [], colors(i, :), 'filled');
end

end


