

rootFolder = fullfile('C:\Users\darko\Documents\MATLAB\PervasiveProject\Dataset'); %setting up the root folder of the dataset

cards = {'2 of clubs', '2 of diamonds', '2 of hearts', '2 of spades', '3 of clubs', '3 of diamonds', '3 of hearts', '3 of spades','4 of clubs', '4 of diamonds', '4 of hearts', '4 of spades',...
         '5 of clubs', '5 of diamonds', '5 of hearts', '5 of spades','6 of clubs', '6 of diamonds', '6 of hearts', '6 of spades','7 of clubs', '7 of diamonds', '7 of hearts', '7 of spades',...
         '8 of clubs', '8 of diamonds', '8 of hearts', '8 of spades','9 of clubs', '9 of diamonds', '9 of hearts', '9 of spades','10 of clubs', '10 of diamonds', '10 of hearts', '10 of spades',...
         'ace of clubs', 'ace of diamonds', 'ace of hearts', 'ace of spades','joker of clubs', 'joker of diamonds', 'joker of hearts', 'joker of spades','king of clubs', 'king of diamonds', 'king of hearts', 'king of spades',...
         'queen of clubs', 'queen of diamonds', 'queen of hearts', 'queen of spades',}; %creating a array of all the possible cards(labels)

imds = imageDatastore(fullfile(rootFolder,cards),'LabelSource','foldernames'); %loading in the dataset from folders and setting their labels

tbl = countEachLabel(imds); %count how many labels there are
minSetCount = min(tbl{:,2}); %find the smallest dataset of all the labels

imds = splitEachLabel(imds,minSetCount,'randomized');  %randomly split the labels
net = resnet50(); % load convolutional pretrained neural network resnet 50 (with 48 conv layers)

[imdsTrain, imdsTest] = splitEachLabel(imds,0.85,'randomized'); %split the data into training and testing data

imageSize = net.Layers(1).InputSize; % find the correct size of image the first layer accepts
augmentedTrain=augmentedImageDatastore(imageSize, imdsTrain, "ColorPreprocessing","gray2rgb"); %augment the training images so we can feed it to the network
augmentedTest=augmentedImageDatastore(imageSize, imdsTest, "ColorPreprocessing","gray2rgb"); %augment the testing images so we can feed it to the network


featureLayer = 'fc1000'; %set the fully connected layer of resnet50 (the last layer)

trainingFeautures = activations(net,augmentedTrain,featureLayer,'MiniBatchSize',64,'OutputAs','columns');%setting up training option
trainingLabels = imdsTrain.Labels; %saves the labels of the training data

classifier = fitcecoc(trainingFeautures,trainingLabels,'Learner','Linear','Coding','onevsall','ObservationsIn','columns'); %

testFeautures = activations(net,augmentedTest,featureLayer,'MiniBatchSize',64,'OutputAs','columns'); %settin up testing option
predictLabels = predict(classifier,testFeautures,'ObservationsIn','columns'); %predict network (test network) and store predicted labels
testLabels = imdsTest.Labels; %gets correct test labels of network





