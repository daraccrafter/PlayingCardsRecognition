projectlocation = ""; %set the rootfolder
rawdata = ""; %set the raw images folder
augmenteddata = "\Dataset"; %set the dataset folder for augmented images
augmentation(projectlocation,rawdata,augmenteddata) %calling the augmentation function


% We used 10 different augmentation settings from https://nl.mathworks.com/help/deeplearning/ug/image-augmentation-using-image-processing-toolbox.html

function augmentation(rootfolder,rawdata,augmenteddata)


     
     images = dir(fullfile(rawdata,'*.jpg'));  %gets all the filenames from folder into array
     numberofimages = numel(images); %counts how many images are in the folder  
     name = convertCharsToStrings({images.name});  %converts the variable images to string array
        
   
    for i = 1:numberofimages %loop through all the images
        
        
        name(1,i) %prints out the current file 
        path = toFolder(name(1,i)); %returns the folder the current image should go to
        newpath = rootfolder + augmenteddata;
        path = newpath+path; %edits the path 
        realimg(name(1,i),path,rawdata); %adds the current image to the dataset folder
        scale(name(1,i),path,rawdata);   %augments the raw image scaling it and puts it in the dataset folder
        reflection(name(1,i),path,rawdata); %augments the raw image with reflection and puts it in the dataset folder
        shear(name(1,i),path,rawdata); %augments the raw image with shear and puts it into the dataset folder
        angle(name(1,i),path,rawdata); %augments the raw image with a different angle and puts it into the dataset folder
        huejittered(name(1,i),path,rawdata); %augments the raw image with hue jitter and puts it into the dataset folder
        saturation(name(1,i),path,rawdata); %augments the raw image with saturation and puts it into the dataset folder
        brightness(name(1,i),path,rawdata); %augments the raw image changing its brightness and puts it into the dataset folder
        saltandpepernoise(name(1,i),path,rawdata); %augments the raw image adding salt and pepper noise and puts it into the dataset folder
        gaussiannoise(name(1,i),path,rawdata); %augments the raw image with gaussian noise and puts it into dataset folder
        blurr(name(1,i),path,rawdata); %augments the current image blurring it and puts it into dataset folder

        
    end
        
    

end

function str = toFolder(name) %returns a string of folder location
n = name;
switch 1
    case contains(n,"2c") %if the image contains 2c in the name it is a 2 of clubs
        str ="\2 of clubs"; 
    case contains(n,"2s") %if the image contains 2s in the name it is a 2 of spades
        str ="\2 of spades";
    case contains(n,"2h")
        str ="\2 of hearts"; %if the image contains 2h in the name it is a 2 of hearts
    case contains(n,"2d") %if the image contains 2d in the name it is a 2 of diamonds
        str ="\2 of diamonds"; 
    case contains(n,"3c")  %if the image contains 3c in the name it is a 3 of clubs
        str ="\3 of clubs"; 
    case contains(n,"3s")  %if the image contains 3s in the name it is a 3 of spades
        str ="\3 of spades"; 
    case contains(n,"3h")  %if the image contains 3h in the name it is a 3 of hearts
        str ="\3 of hearts";
    case contains(n,'3d')  %if the image contains 3d in the name it is a 3 of diamonds
        str ="\3 of diamonds";
    case contains(n,"4c")  %if the image contains 4c in the name it is a 4 of clubs
        str ="\4 of clubs";
    case contains(n,"4s")  %if the image contains 4s in the name it is a 4 of spades
        str ="\4 of spades";
    case contains(n,"4h")  %if the image contains 4h in the name it is a 4 of hearts
        str ="\4 of hearts";
    case contains(n,"4d")  %if the image contains 4d in the name it is a 4 of diamonds
        str ="\4 of diamonds";
    case contains(n,"5c")  %if the image contains 5c in the name it is a 5 of clubs
        str ="\5 of clubs";
    case contains(n,"5s")  %if the image contains 5s in the name it is a 5 of spades
        str ="\5 of spades";
    case contains(n,"5h")  %if the image contains 5h in the name it is a 5 of hearts
        str ="\5 of hearts";
    case contains(n,"5d")  %if the image contains 5d in the name it is a 5 of diamonds
        str ="\5 of diamonds";
    case contains(n,"6c")  %if the image contains 6c in the name it is a 6 of clubs
        str ="\6 of clubs";
    case contains(n,"6s")  %if the image contains 6s in the name it is a 6 of spade
        str ="\6 of spades";
    case contains(n,"6h")  %if the image contains 6h in the name it is a 6 of hearts
        str ="\6 of hearts";
    case contains(n,"6d")  %if the image contains 6d in the name it is a 6 of diamonds
        str ="\6 of diamonds";
    case contains(n,"7c")  %if the image contains 7c in the name it is a 7 of clubs
        str ="\7 of clubs";
    case contains(n,"7s")  %if the image contains 7s in the name it is a 7 of spades
        str ="\7 of spades";
    case contains(n,"7h")  %if the image contains 7h in the name it is a 7 of hearts
        str ="\7 of hearts";
    case contains(n,"7d")  %if the image contains 7d in the name it is a 7 of diamonds
        str ="\7 of diamonds";
    case contains(n,"8c")  %if the image contains 8c in the name it is a 8 of clubs
        str ="\8 of clubs";
    case contains(n,"8s")  %if the image contains 8s in the name it is a 8 of spades
        str ="\8 of spades";
    case contains(n,"8h")  %if the image contains 8h in the name it is a 8 of hearts
        str ="\8 of hearts";
    case contains(n,"8d")  %if the image contains 8d in the name it is a 8 of diamonds
        str ="\8 of diamonds";
    case contains(n,"9c")  %if the image contains 9c in the name it is a 9 of clubs
        str ="\9 of clubs";
    case contains(n,"9s")  %if the image contains 9s in the name it is a 9 of spades
        str ="\9 of spades";
    case contains(n,"9h")  %if the image contains 9h in the name it is a 9 of hearts
        str ="\9 of hearts";
    case contains(n,"9d")  %if the image contains 9d in the name it is a 9 of diamonds
        str ="\9 of diamonds";
    case contains(n,"10c") %if the image contains 10c in the name it is a 10 of clubs
        str ="\10 of clubs";
    case contains(n,"10s") %if the image contains 10s in the name it is a 10 of spades
        str ="\10 of spades";
    case contains(n,"10h") %if the image contains 10h in the name it is a 10 of hearts
        str ="\10 of hearts";
    case contains(n,"10d") %if the image contains 10d in the name it is a 10 of diamonds
        str ="\10 of diamonds";
    case contains(n,"jc")  %if the image contains jc in the name it is a joker of clubs
        str ="\joker of clubs";
    case contains(n,"js")  %if the image contains js in the name it is a joker of spades
        str ="\joker of spades";
    case contains(n,"jh")  %if the image contains jh in the name it is a joker of hearts
        str ="\joker of hearts";
    case contains(n,"jd")  %if the image contains jd in the name it is a joker of diamonds
        str ="\joker of diamonds";
    case contains(n,"ac")  %if the image contains ac in the name it is a ace of clubs
        str ="\ace of clubs";
    case contains(n,"as")  %if the image contains as in the name it is a ace of spades
        str ="\ace of spades";
    case contains(n,"ah")  %if the image contains ah in the name it is a ace of hearts
        str ="\ace of hearts";
    case contains(n,"ad")  %if the image contains ad in the name it is a ace of diamonds
        str ="\ace of diamonds";
    case contains(n,"qc")  %if the image contains qc in the name it is a queen of clubs
        str ="\queen of clubs";
    case contains(n,"qs")  %if the image contains qs in the name it is a queen of spades
        str ="\queen of spades";
    case contains(n,"qh")  %if the image contains qh in the name it is a queen of hearts
        str ="\queen of hearts";
    case contains(n,"qd")  %if the image contains qd in the name it is a queen of diamonds
        str ="\queen of diamonds";
    case contains(n,"kc")  %if the image contains kc in the name it is a king of clubs
        str ="\king of clubs";
    case contains(n,"ks")  %if the image contains ks in the name it is a king of spades
        str ="\king of spades";
    case contains(n,"kh")  %if the image contains kh in the name it is a king of hearts
        str ="\king of hearts";
    case contains(n,"kd")  %if the image contains kd in the name it is a king of diamonds
        str ="\king of diamonds";


end




end

function realimg(name,path,rawdata)
imOriginal = imread(rawdata+"\"+name); %reads the original image

imwrite(imOriginal,path+"\"+name); %stores image in dataset folder


end

function scale(name,path,rawdata)
imOriginal = imread(rawdata+"\"+name); %reads raw image
tform = randomAffine2d('Scale',[1.2,1.5]); %randomly pick a scale from 1.2 to 1.5
outputView = affineOutputView(size(imOriginal),tform); %apply the scale to raw image
imAugmented = imwarp(imOriginal,tform,'OutputView',outputView); %store the wrapped image in imAugmented variable

newname = erase(name,".jpg");
name = newname + "scale.jpg";  
%edit the current name

imwrite(imAugmented,path+"\"+name); %save the augmented image into the dataset folder


end

function reflection(name,path,rawdata)
imOriginal = imread(rawdata+"\"+name); %read raw image
tform = randomAffine2d('XReflection',true,'YReflection',true); %apply random x and y reflection
outputView = affineOutputView(size(imOriginal),tform); %change the raw image
imAugmented = imwarp(imOriginal,tform,'OutputView',outputView); %save the raw image into variable

newname = erase(name,".jpg");
name = newname + "reflection.jpg";
%edit name 
imwrite(imAugmented,path+"\"+name); %save the augmented image to dataset folder


end

function shear(name,path,rawdata)
imOriginal = imread(rawdata+"\"+name); %read the raw image
tform = randomAffine2d('XShear',[-30 30]); % create variable with random shear
outputView = affineOutputView(size(imOriginal),tform);  %apply the shear
imAugmented = imwarp(imOriginal,tform,'OutputView',outputView); %save the image into imAugmented variable

newname = erase(name,".jpg");
name = newname + "shear.jpg";
%edit name
imwrite(imAugmented,path+"\"+name); %save the augmented image into dataset folder


end

function angle(name,path,rawdata)
imOriginal = imread(rawdata+"\"+name); %read the raw image
angles = 0:90:270; %set the possible angles
tform = randomAffine2d('Rotation',@() angles(randi(4))); %select random angle
outputView = affineOutputView(size(imOriginal),tform);  %apply the angle change
imAugmented = imwarp(imOriginal,tform,'OutputView',outputView); %save augmented image into imAugmented variable

newname = erase(name,".jpg");
name = newname + "angle.jpg";
%edit name
imwrite(imAugmented,path+"\"+name); %save augmented image into dataset folder


end

function huejittered(name,path,rawdata)
imOriginal = imread(rawdata+"\"+name); %read raw image
imJittered = jitterColorHSV(imOriginal,'Hue',[0.05 0.15]); %apply hue jitter to image and save it into imJittered variable

newname = erase(name,".jpg");
name = newname + "jitter.jpg";
%edit name
imwrite(imJittered,path+"\"+name); %save augmented image into dataset folder


end

function saturation(name,path,rawdata)
imOriginal = imread(rawdata+"\"+name); %read raw image
imJittered = jitterColorHSV(imOriginal,'Saturation',[-0.4 -0.1]); %apply random saturation and save into imJittered variable

newname = erase(name,".jpg");
name = newname + "saturation.jpg";
%edit name 
imwrite(imJittered,path+"\"+name); %save augmented image into dataset folder


end

function brightness(name,path,rawdata)
imOriginal = imread(rawdata+"\"+name); %read raw image
imJittered = jitterColorHSV(imOriginal,'Brightness',[-0.3 -0.1]); %apply brightness changes to image and save as imJittered variable

newname = erase(name,".jpg");
name = newname + "brightness.jpg";
%edit name
imwrite(imJittered,path+"\"+name); %write augmented image into dataset folder


end

function saltandpepernoise(name,path,rawdata)
imOriginal = imread(rawdata+"\"+name); %read raw image
imSaltAndPepperNoise = imnoise(imOriginal,'salt & pepper',0.1); %apply salt and pepper noise and save it into variable


newname = erase(name,".jpg");
name = newname + "salt&peper.jpg";
%edit name
imwrite(imSaltAndPepperNoise,path+"\"+name); %save augmented image into dataset folder


end

function gaussiannoise(name,path,rawdata)
imOriginal = imread(rawdata+"\"+name); %read raw image
imGaussianNoise = imnoise(imOriginal,'gaussian'); %apply gaussian noise and save to variable

newname = erase(name,".jpg");
name = newname + "gauss.jpg";
%edit name
imwrite(imGaussianNoise,path+"\"+name); %save the augmented image into dataset folder


end

function blurr(name,path,rawdata)
imOriginal = imread(rawdata+"\"+name); %read raw image
sigma = 1+5*rand; %set random blurr multiplyer
imBlurred = imgaussfilt(imOriginal,sigma); %apply the blurr and save into variable

newname = erase(name,".jpg");
name = newname + "blurr.jpg";
%edit name
imwrite(imBlurred,path+"\"+name); %save augmented image into dataset folder


end




