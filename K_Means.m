% Load image data
%The images from 1:4 are for CoCl2 case while from 5:8 are Control cases
for i=1:8
name=[num2str(i) '.tif'];
Image_data = imread(name);

% Convert to grayscale
img_gray = rgb2gray(Image_data);
% Reshape data to 1D vector
data = img_gray(:);
% Set number of clusters
K = 2;
% Perform K-means clustering with intensity values
[idx, centers] = kmeans(data, K);
% Determine which cluster represents color and which represents no color
if centers(1) > centers(2)
    color_cluster = 1;
    no_color_cluster = 2;
else
    color_cluster = 2;
    no_color_cluster = 1;
end
% Create binary mask of color pixels
color_mask = reshape(idx == color_cluster, size(img_gray));
% Display original image and color mask
figure;
subplot(1,2,1);
imshow(Image_data);
title('Original Image');
subplot(1,2,2);
imshow(color_mask);
title('Color Mask');
end
% end