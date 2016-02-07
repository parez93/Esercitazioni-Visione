close all;

load_data = load('Calib_Results_stereo');

PPM0 = KK_left * [R,T];
PPMn = KK_right * [R,T];

H = PPMn(:,1:3) * inv(PPM0(:,1:3));

image0 = imread('Lab4/Es1/stereo_example/left01.jpg');
imageN = imread('Lab4/Es1/stereo_example/right01.jpg');

figure
imshow(image0);

[u1,v1] = ginput(1);
m0 = [u1; v1; 1];

[tempx,tempy, zinutile] = size(image0);

%figure(2)
%imshow(imageN);
for 1:tempx
    for 1:tempy

        mn = H * [tempx; tempy,1];

        hold on 
        plot(mn(1),mn(2),'x','color','red');
    end
end


