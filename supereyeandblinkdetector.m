
clear all
close all
clc
plo=1;
BBold=0;
BB1old=0;
mov = VideoReader('doze.mp4'); % give the path to the video here
nF = mov.NumberOfFrames; 
faceDetector = vision.CascadeObjectDetector;
FDetect = vision.CascadeObjectDetector('RightEye');
F1Detect = vision.CascadeObjectDetector('LeftEye');
for k=1:nF
k
%To detect Face
co=int2str(k);
%Iorg=capturecode;
movie(k).cdata = read(mov,k);
Iorg=movie(k).cdata;

%imwrite(Iorg,strcat(co,'.jpg'));

Iorg=rgb2gray(Iorg);
bb = step(faceDetector, Iorg);

try
bbnorg=bb(1,:);   % change 1  if there are multiple number of faces

bbn(1)=bbnorg(1);
bbn(2)=bbnorg(2)+(bbnorg(4)/5);
bbn(4)=(1.5.*bbnorg(4))/5;
bbn(3)=(bbnorg(3))/2;

bbn1(1)=bbnorg(1)+(bbnorg(3)/2);
bbn1(2)=bbnorg(2)+(bbnorg(4)/5);
bbn1(4)=(1.5.*bbnorg(4))/5;
bbn1(3)=(bbnorg(3))/2;

I=imcrop(Iorg,bbn(1,:));
I1=imcrop(Iorg,bbn1(1,:));



%Returns Bounding Box values based on number of objects
BB = step(FDetect,I);
BB1 = step(F1Detect,I1);

if(numel(BB)~=0 && numel(BB1)~=0)
    BBold=BB;
    BB1old=BB1;
else
    BB=BBold;
    BB1=BB1old;
end


left=imcrop(I,BB(1,:));
right=imcrop(I1,BB1(1,:));

left=imresize(left,[24 24]);
right=imresize(right,[24 24]);

m(k)=mean2(left);

%example(right);

[word,l,r,f]=blink(left,right);

plo=[plo;f];

figure(1),subplot(2,3,[1,2,4,5]),imshow(Iorg);title(word);
figure(1),subplot(2,3,3),imshow(left);title(l);
figure(1),subplot(2,3,6),imshow(right);title(r);
%pause(1);
%input('press');
catch ME
end
end
figure,plot(plo);