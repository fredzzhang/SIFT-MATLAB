%% ------------------------------------------------------------------------
% Implement an image match algorithm
% -------------------------------------------------------------------------
% Institute: Australian National University
% Author: Zhen Zhang
% Last modified: 26 Jun. 2018
%% ------------------------------------------------------------------------
close all;
clear;
clc;

num = 15;       % Number of matches to be found

% Ready source image
str0 = char('images/img1.jpg');
str1 = char('images/img2.jpg');

% Perfrom SIFT
[dstImg0, descpt0, locs0] = sift(str0);
[dstImg1, descpt1, locs1] = sift(str1);

% Display the features
showkeys(dstImg0, locs0);
showkeys(dstImg1, locs1);

% Match the SIFT descriptor accross two images
[index1, index2] = SIFTmatch(descpt0, descpt1, num);

% Draw the matched features
figure;
showMatchedFeatures(dstImg0, dstImg1, ...
    locs0(index1, [2 1]), locs1(index2, [2 1]), 'montage');

%% ------------------------------------------------------------------------