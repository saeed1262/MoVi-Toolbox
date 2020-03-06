function display_overlay(jointsLocation, videoName, cameraParams, rotationMatrix, translationVector, verts)
% DISPLAY_OVERLAY - Displays joints and mesh overlaid on video
% 
%
% Syntax:  display_overlay(jointsLocation, videoName, cameraParams, rotationMatrix, %translationVector, verts)
%
% Inputs:
%    jointsLocation - jointsLocation in amass file
%    videoName - corresponding video full address
%    cameraParams - intrinsic Camera parameters
%    rotationMatrix - extrinsic rotation matrix
%    translationVector - extrinsic translation matrix
%    verts - Vertices computed from amass data
%	
%
%
% If you use this code in a research publication please consider citing the following:
%
% MoVi: A Large Multipurpose Motion and Video Dataset <https://arxiv.org/abs/2003.01888>
%
% Author: Saeed Ghorbani, Ph.D.
% York University, Dept. of Electrical Engineering and Computer Science 
% email address: saeed@eecs.yorku.ca, saeed.ghorbani1262@gmail.com
% Website: https://www.biomotionlab.ca/
% October 2019; Last revision: 29-October-2019

%------------- BEGIN CODE --------------

close all
imagePoints_joints = worldToVideo(jointsLocation, cameraParams, rotationMatrix, translationVector);
if exist('verts')
    imagePoints_verts = worldToVideo(verts, cameraParams, rotationMatrix, translationVector);
    disp_projections(imagePoints_joints, videoName, faces, imagePoints_verts)
else
    disp_projections(imagePoints_joints, videoName)
end

function disp_projections(imagePoints, videoName, faces, imagePoints_2)
% The function takes 2D projected points and displays it over the corresponding
% video
vidObj = VideoReader(videoName);
currAxes = axes;

counter = 1;
while hasFrame(vidObj)
    
    vidFrame = readFrame(vidObj);
    image(vidFrame, 'Parent', currAxes);
    currAxes.Visible = 'off';
    set(gca,'position',[0 0 1 1],'units','normalized')
    image(vidFrame, 'Parent', currAxes);
    hold on
    imagePoints = double(imagePoints);
    plot(imagePoints(counter,:,1),imagePoints(counter,:,2),'go','MarkerSize',5,'LineWidth',1,'MarkerFaceColor',[0, 255, 0]/255)
    if exist('verts')
        TR = triangulation(faces+1,squeeze(imagePoints_2(counter,:,:)));
        triplot(TR,'Color',[0.8500 0.3250 0.0980], 'LineWidth', 0.1);
    end
    hold off
    pause(1/vidObj.FrameRate);
    counter = counter + 1;
end
% close(v);
