%% Color-Based Segmentation
%  Modified from an example at http://www.mathworks.com/help/images/examples/color-based-segmentation-using-k-means-clustering.html?prodcode=IP&language=en

%% Step 1: Read and convert image to L*a*b* color space.
sat = imread('satellite.png');
imshow(sat);
cform = makecform('srgb2lab');
lab_sat = applycform(sat, cform);

%% Step 2: Classify the colors w/ K-Means.
ab = double(lab_sat(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);

nColors = 5;
% repeat the clustering 3 times to avoid local minima
[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                      'Replicates',3);


%% Step 3: Label Every Pixel in the Image Using the Results from KMEANS
pixel_labels = reshape(cluster_idx,nrows,ncols);
imshow(pixel_labels,[]);

%% Step 4: Create Images that Segment the H&E Image by Color.
segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);

for k = 1:nColors
    color = sat;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
    figure, imshow(segmented_images{k});
end
