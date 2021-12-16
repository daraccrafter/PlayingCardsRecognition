

img = snapshot(webcam); %take picture from camera
imwrite(img,"C:\Users\darac\Documents\MATLAB\PervasiveProject\test.jpg"); %write it to folder

newImage = imread(fullfile('C:\Users\darac\Documents\MATLAB\PervasiveProject\test.jpg')); %read image
ds=augmentedImageDatastore(imageSize, newImage, "ColorPreprocessing","gray2rgb"); %augment image to fit NN
imageFeautures = activations(net,ds,featureLayer,'MiniBatchSize',64,'OutputAs','columns'); 
label = predict(classifier,imageFeautures,'ObservationsIn','columns');

%classify the image

sprintf('%s',label)
