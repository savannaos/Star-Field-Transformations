addpath ('../OpenPV/mlab/util/')
frame_index = 4;
  star_file = strcat('/nh/compneuro/scratch/starOut/starField_SPM_9X9X16_5_500/train17-18-17/Frame_',int2str(frame_index),'.pvp'); 
  out_file = strcat('/nh/compneuro/scratch/starOut/starField_SPM_9X9X16_5_500/train17-18-17/Frame_4ReconS1Muggle.pvp');

  disp("reading in files");
  [inputData, inputHdr] = readpvpfile(star_file);
  [reconData, reconHdr] = readpvpfile(out_file); 
  disp("files read!")

  inputImage = (permute(inputData{1}.values, [2,1,3]));
  reconImage = (permute(reconData{1}.values, [2,1,3]));

  disp("computing max")
  sepNum = max(max(inputImage(:)),max(reconImage(:))) + 10;
  seperation = ones(size(inputImage,1),1) * sepNum;
  concatenated = horzcat(seperation, inputImage, seperation, reconImage, seperation);
  border = ones(1,size(concatenated,2)) * sepNum;
  styled_image = vertcat(border, concatenated, border);
  disp("images concatenated")

  imwrite(styled_image, strcat('starOut/7-18-17/inputVSprediction.png'));
% Plot Images
% figure;
% imshow(concatenated);
