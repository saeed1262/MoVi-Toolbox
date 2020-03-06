function [data, header] = imu_filter(move_struct, data_type, joint_name)
%IMU_FILTER - outputs the the IMU data specified by the data type and
%joint names
%
% Syntax:  data = function_name(move_struct, data_type, joint_name)
%
% Inputs:
%    move_struct - MoVi style IMU struct
%    data_type - an array of strings containing needed data types. Possible data types 
%    are described in the dataTypes and dataTypeDescription fileds of the
%    motion struct. [] if all data types are chosen
%    joint_name - an array of strings containing needed joints names. Possible joint
%    names are described in the jointNames field of the motion struct. 
%    [] if all data types are chosen.
%    IMPORTANT: array of strings should be written with double quotation
%       
% Outputs:
%    d - Filtered data
%
% Example: 
%    d = imu_filter(S1, ["X"], [])
%    d = imu_filter(S1, ["X","V"], ['Hip','RightUpLeg'])
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2

% Author: Saeed Ghorbani, Ph.D.
% York University, Dept. of Electrical Engineering and Computer Science 
% email address: saeed@eecs.yorku.ca, saeed.ghorbani1262@gmail.com
% Website: https://www.biomotionlab.ca/
% August 2019; Last revision: 02-August-2019

%------------- BEGIN CODE --------------

if ~isempty(data_type)
    data_type_mask = contains(move_struct.dataHeader,data_type);
else
    data_type_mask = logical(ones(size(move_struct.dataHeader)));
end
if ~isempty(joint_name)
    joint_mask = contains(move_struct.jointNames,joint_name);
    joint_number = move_struct.jointNumbers(joint_mask);
    joint_name_mask = contains(move_struct.dataHeader,joint_number);
else
    joint_name_mask = logical(ones(size(move_struct.dataHeader)));
end 

mask = joint_name_mask & data_type_mask;
data = move_struct.data(:,mask);
header = move_struct.dataHeader(mask);

%------------- END OF CODE --------------
