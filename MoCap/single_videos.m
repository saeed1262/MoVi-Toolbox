function single_videos(main_video, main_rub)
% SINGLE_VIDEOS - Extract the single video motions using "flags' field from
% the corresponding rub file. All the 
%
% Syntax:  single_videos(main_video, main_rub, move_num)
%
% Inputs:
%    main_video - The full name of the main video file which contains all motions
%    mainrub - corresponding rub style struct
%
% Outputs:
%    There is no outputs. All the single video files are save in the same
%    directory as the main video file. The saving format is "Uncompressed
%    AVI"
%
% Example: 
%    single_videos('F_PG1_Subject_1.avi', Subject_1_F)
%
% If you use this code in a research publication please consider citing the following:
%
% MoVi: A Large Multipurpose Motion and Video Dataset <https://arxiv.org/abs/2003.01888>
% Author: Saeed Ghorbani, Ph.D.
%
% York University, Dept. of Electrical Engineering and Computer Science 
% email address: saeed@eecs.yorku.ca, saeed.ghorbani1262@gmail.com
% Website: https://www.biomotionlab.ca/
% October 2019; Last revision: 29-October-2019

%------------- BEGIN CODE --------------

move_num = 1;
video_obj = VideoReader(main_video);
NumFrames = video_obj.NumFrames;

[filepath,name,ext] = fileparts(main_video);

main_move = main_rub.move{1,move_num};
motions_list = main_move.motions_list;
num_motions = length(motions_list);
flags30 = main_move.flags30;

% Reading the frames one by one and saving the videos
% Might not be the best idea but in MATLAB we cannot read frames by index
counter = 1;
for f = 1:NumFrames
    frame = readFrame(video_obj);
    if f >= flags30(counter,1) && f <= flags30(counter,2)
        if f == flags30(counter,1)
            output_videofilename = fullfile(filepath,strcat(name, num2str(counter), '.avi'));
            outputVideo = VideoWriter(output_videofilename, 'Uncompressed AVI');
            outputVideo.FrameRate = 30;
            open(outputVideo)
        end
        writeVideo(outputVideo, frame)
        if f == flags30(counter,2)
            counter = counter + 1;
            close(outputVideo)
            if counter > num_motions
                break
            end
        end
    end
end

%------------- END OF CODE --------------
        
