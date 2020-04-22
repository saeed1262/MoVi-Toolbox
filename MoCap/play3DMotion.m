function play3DMotion(vals, parents, frameLength, saveVideo, saveVideoName)
%PLAY3DMOTION - Plays the motion which is presented in the 3D format
%
% Syntax: play3DMotion(vals, parents, frameLength, saveVideo)
%
% Inputs:
%    vals - 3D joints location
%    parents - parents connections vector
%    frameLength - length of each frame
%    saveVideo - whether to save the video
%    saveVideoName - the name of the video file to be saved
% Example: 
%    amass --> play3DMotion(Subject_1_F_amass.move{1, 1}.jointsLocation_amass, Subject_1_F_amass.move{1, 1}.jointsParent )
%    v3d --> play3DMotion(Subject_1_F.move{1, 1}.virtualMarkerLocation  , Subject_1_F.move{1, 1}.virtualMarkerParent )
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% If you use this code in a research publication please consider citing the following:
%
% MoVi: A Large Multipurpose Motion and Video Dataset <https://arxiv.org/abs/2003.01888>
%
% Author: Saeed Ghorbani, Ph.D.
% York University, Dept. of Electrical Engineering and Computer Science 
% email address: saeed@eecs.yorku.ca, saeed.ghorbani1262@gmail.com
% Website: https://www.biomotionlab.ca/
% August 2019; Last revision: 02-August-2019

% The code is borrowed partially from http://www.cs.toronto.edu/~gwtaylor/publications/nips2006mhmublv.
% Read below
%
% Permission is granted for anyone to copy, use, modify, or distribute this
% program and accompanying programs and documents for any purpose, provided
% this copyright notice is retained and prominently displayed, along with
% a note saying that the original programs are available from our
% web page.
% The programs and documents are distributed without any warranty, express or
% implied.  As the programs were written for research purposes only, they have
% not been tested to the degree that would be advisable in any important
% application.  All use of these programs is entirely at the user's own risk.
% This code is partially adapted (and inspired) from 
% For more information, see:
%     http://www.cs.toronto.edu/~gwtaylor/publications/nips2006mhmublv

%------------- BEGIN CODE --------------
if nargin < 3
    frameLength = 1/120;
    saveVideo = false;
    saveVideoName = 'generated.avi';
elseif nargin < 4
    saveVideo = false;
    saveVideoName = 'generated.avi';
elseif nargin < 5
    saveVideoName = 'generated.avi';
end

% Checking both MHIP and Pelvic are using. If so removing MHIP
[s1, s2, s3] = size(vals);
if s2 == 20
    vals(:,2,:) = [];
end

handle(1) = plot3(vals(1,:, 1), vals(1, :, 2), vals(1, :, 3), '.');
hold on
parents(2,:) = 1:length(parents);
parents(:, parents(1,:)==0)=[];

for i = 1:size(parents,2)
    handle(i+1) = line(...
        [vals(1, parents(1,i), 1) vals(1, parents(2,i), 1)], ...
        [vals(1, parents(1,i), 2) vals(1, parents(2,i), 2)], ...
        [vals(1, parents(1,i), 3) vals(1, parents(2,i), 3)]);
end

set(handle(1), 'markersize', 20);
set(handle(1), 'MarkerFaceColor',[1,0,0])
grid on
axis equal
xlabel('x')
ylabel('z')
zlabel('y')
axis on
view(45,30)

maxs = squeeze(max(vals,[],[1,2]));
mins = squeeze(min(vals,[],[1,2]));
xlim = [mins(1),maxs(1)];
ylim = [mins(2),maxs(2)];
zlim = [mins(3),maxs(3)];

set(gca, 'xlim', xlim, 'ylim', ylim, 'zlim', zlim);

ax = gca;
ax.XLimMode = 'manual';
ax.YLimMode = 'manual';
ax.ZLimMode = 'manual';
set(gca,'LineWidth',3,'XTickLabel',[],'YTickLabel',[],'ZTickLabel',[],'XLabel',[],'YLabel',[],'ZLabel',[]);
set(handle,'color','g');
set(handle(2:end),'LineWidth',3);

% Saving it as a video in avi format
if saveVideo
    writerObj = VideoWriter(saveVideoName);
    writerObj.FrameRate = 120.0;
    open(writerObj);
end

% Update plot
for frame_num = 1:size(vals, 1)
    set(handle(1),'MarkerSize',20);
    set(handle(2:end),'LineWidth',3);
    if  frame_num > 100
        set(handle,'color','b')
    end
    set(handle(1), 'color',[1,0,0])
    title(num2str(frame_num));

    seens = any(vals(frame_num, :, :),3);
    set(handle(1), 'Xdata', vals(frame_num, seens, 1), 'Ydata', vals(frame_num, seens, 2), 'Zdata', ...
        vals(frame_num, seens, 3));
    
    for i = 1:size(parents,2)
        if any(vals(frame_num, parents(1,i), :)) && any(vals(frame_num, parents(2,i), :)) 
             set(handle(i+1), ...
                 'Xdata', [vals(frame_num, parents(1,i), 1) vals(frame_num, parents(2,i), 1)], ...
                 'Ydata', [vals(frame_num, parents(1,i), 2) vals(frame_num, parents(2,i), 2)], ...
                 'Zdata', [vals(frame_num, parents(1,i), 3) vals(frame_num, parents(2,i), 3)]);
        else
             set(handle(i+1), 'Xdata', [], ...
            'Ydata', [], ...
            'Zdata', []);
        end
    end
    hold off
    if saveVideo
        writeVideo(writerObj, getframe(gcf));
    end
    pause(frameLength);
end
if saveVideo
    close(writerObj);
end
close all;
%------------- END OF CODE --------------
