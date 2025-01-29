img = imread('test.jpg');
% Convert to grayscale if the image is not already grayscale
if size(img, 3) == 3
    img = rgb2gray(img);
end


% Initialize a figure for displaying the results
figure;
sgtitle('Bit Plane Slicing and Image Processing Results');

% Display the binary (black and white) version of the image
subplot(3, 4, 1);
imshow(img);
title('Grayscale Image');

% Perform bit-plane slicing
for i = 1:8
    % Extract the ith bit-plane
    bitPlane = bitget(img, i);
    
    % Display the bit-plane
    subplot(3, 4, i + 4); % Starting from the 5th position
    imshow(logical(bitPlane));
    title(['Bit Plane ', num2str(i)]);
end