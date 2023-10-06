# Image_Analysis_Unsupervised_Learning
In this project,we perform image analysis of 3D microscopic image data to quantify the levels of F-Actin in the sample by using image analysis and unsupervised learning techniques such as K-Means Clustering and DBSCAN and compare the techniques for the specific application.

The following methodology is followed:

Optimum Noise Reduction with threshold optimisation.
Dimension reduction using PCA
Using intensity based K-Means clustering with K=2( one each for dark and fluorescence area).
Using DBSCAN for clustering with epsilon and minpts value optimization. 
Unsupervised learning framework for fluorescence quantification


Clustering techniques like K-means, DBSCAN,HDBSCAN can be used to cluster data and identify objects and organisation.
Since we have the image data, we use DBSCAN.
Intensity based K-Means clustering is performed to cluster fluorescence and background by taking  K=2.

