function imagePoints = worldToVideo(mdData, cameraParams, rotationMatrix, translationVector)
% The function takes the MoCap data and returns the projection of 3-D world points into the video given camera parameters
Markers = mdData(1:4:end,:,:);
imagePoints = zeros(size(Markers,1),size(Markers,2),2);
for i = 1:size(Markers, 2)
    worldPoints = squeeze(Markers(:,i,:));
    imagePoints(:,i,:) = reshape(worldToImage(cameraParams,rotationMatrix,translationVector,worldPoints, 'ApplyDistortion',true),[size(Markers,1),1,2]);
end