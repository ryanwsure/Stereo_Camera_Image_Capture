
% Script for capturing, separating and saving images from USB stereo
% cameras.
% Originally designed and programmed by WSure at BYD Auto Inc.
% Version 1.0. July 15th, 2024.

% "MATLAB Support Package for USB Webcams" is required!

clear; clc; 

cam1 = webcam(1);
camhandle = preview(cam1);

shot_count = 0;
mkdir left_capture; % 如果文件夹已存在，会有警告，但不影响运行
mkdir right_capture;

while ishandle(waitforbuttonpress)

    shot_count = shot_count + 1;

    frame = snapshot(cam1); % 获取帧
    % figure(2); imshow(frame);
    [leftimg, rightimg] = stereo_sepration(frame);

    subplot(1,2,1);
    imshow(leftimg);
    title("Left Sight");
    left_filename = strcat('left_capture/', 'leftimg_', num2str(shot_count), '.png');
    imwrite(leftimg, left_filename);

    subplot(1,2,2);
    imshow(rightimg);
    title("Right Sight");
    right_filename = strcat('right_capture/', 'rightimg_', num2str(shot_count), '.png');
    imwrite(rightimg, right_filename);
    
end


