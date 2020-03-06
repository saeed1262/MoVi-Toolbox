function augmented_motion = single_motions(main_motion)
% SINGLE_MOTIONS - Extracts single MoCap motions using "flags" fields and 
% add it to the trial motions as a new cell elements
% (v3d) Motion files might not have separated single motions by default.
% This function can be used to extract them
%
% Syntax:  augmented_trial = single_motions(trial)
%
% Inputs:
%    trial - rub style motion MATLAB struct
%
% Outputs:
%    augmented_trial - rub style motion MATLAB struct
%
% Example: 
%    Subject_1_F = single_motion(Subject_1_F)
%
% If you use this code in a research publication please consider citing the following:
%
% MoVi: A Large Multipurpose Motion and Video Dataset <https://arxiv.org/abs/2003.01888>
%
% Author: Saeed Ghorbani, Ph.D.
% York University, Dept. of Electrical Engineering and Computer Science 
% email address: saeed@eecs.yorku.ca, saeed.ghorbani1262@gmail.com
% Website: https://www.biomotionlab.ca/
% August 2019; Last revision: 29-October-2019

%------------- BEGIN CODE --------------
augmented_motion = main_motion;
for j=1:length(main_motion.move)
    main_move = main_motion.move{1,j};
    motions_list = main_move.motions_list;
    motions_num = length(motions_list);
    for i=1:motions_num
        cur_move = main_motion.move{1,j};
        assert(isfield(cur_move,'flags120'),'There is no "flags" field')
        cur_flags = cur_move.flags120(i,:);
    
        % Appending single moves
        cur_move.markerGaps = cur_move.markerGaps(cur_flags(1):cur_flags(2));
        cur_move.markerLocation = cur_move.markerLocation(cur_flags(1):cur_flags(2),:,:);
        cur_move.virtualMarkerLocation = cur_move.virtualMarkerLocation(cur_flags(1):cur_flags(2),:,:);
        cur_move = rmfield(cur_move,'flags30');
        cur_move = rmfield(cur_move,'flags120');
        cur_move.description = motions_list{i};
        
        if (isfield(cur_move, 'jointsAffine_v3d'))
            cur_move.jointsAffine_v3d = cur_move.jointsAffine_v3d(cur_flags(1):cur_flags(2),:,:,:);
            cur_move.jointsTranslation_v3d = cur_move.jointsTranslation_v3d(cur_flags(1):cur_flags(2),:,:);
            cur_move.jointsExpMaps_v3d = cur_move.jointsExpMaps_v3d(cur_flags(1):cur_flags(2),:,:);
            cur_move.jointsGaps_v3d = cur_move.jointsGaps_v3d(cur_flags(1):cur_flags(2),:,:);
            
            augmented_motion.move{i+1, j} = cur_move;
        else
            augmented_motion.move{i+1, j} = cur_move;
        end
    end
end
%------------- END OF CODE --------------
     