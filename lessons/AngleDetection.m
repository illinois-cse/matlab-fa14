RGB = imread('bridge.png');
imshow(RGB);

start_row = 60;
start_col = 140;

cropRGB = RGB(start_row:180, start_col:225, :);

imshow(cropRGB)

offsetX = start_col-1;
offsetY = start_row-1;

I = rgb2gray(cropRGB);
threshold = graythresh(I);
BW = im2bw(I,threshold);
BW = ~BW;  % complement the image (objects of interest must be white)
imshow(BW);

dim = size(BW);

% horizontal beam
col1 = 45;
row1 = find(BW(:,col1), 1);

% angled beam
row2 = 24;
col2 = find(BW(row2,:)==1);
col2 = col2(end);

boundary1 = bwtraceboundary(BW, [row1, col1], 'S', 8, 100, 'clockwise');

% set the search direction to counterclockwise, in order to trace downward.
%boundary2 = bwtraceboundary(BW, [row2, col2], 'W', 8, 28, 'clockwise');

imshow(RGB); hold on;

% apply offsets in order to draw in the original image
plot(offsetX+boundary1(:,2),offsetY+boundary1(:,1),'g','LineWidth',2);
%plot(offsetX+boundary2(:,2),offsetY+boundary2(:,1),'g','LineWidth',2);

ab1 = polyfit(boundary1(:,2), boundary1(:,1), 1);
ab2 = polyfit(boundary2(:,2), boundary2(:,1), 1);

vect1 = [1 ab1(1)]; % create a vector based on the line equation
vect2 = [1 ab2(1)];
dp = dot(vect1, vect2);

% compute vector lengths
length1 = sqrt(sum(vect1.^2));
length2 = sqrt(sum(vect2.^2));

% obtain the larger angle of intersection in degrees
angle = 180-acos(dp/(length1*length2))*180/pi

intersection = [1 ,-ab1(1); 1, -ab2(1)] \ [ab1(2); ab2(2)];
% apply offsets in order to compute the location in the original,
% i.e. not cropped, image.
intersection = intersection + [offsetY; offsetX]

inter_x = intersection(2);
inter_y = intersection(1);

% draw an "X" at the point of intersection
plot(inter_x,inter_y,'yx','LineWidth',2);

text(inter_x-60, inter_y-30, [sprintf('%1.3f',angle),'{\circ}'],...
     'Color','y','FontSize',14,'FontWeight','bold');

interString = sprintf('(%2.1f,%2.1f)', inter_x, inter_y);

text(inter_x-10, inter_y+20, interString,...
     'Color','y','FontSize',14,'FontWeight','bold');

displayEndOfDemoMessage(mfilename)
