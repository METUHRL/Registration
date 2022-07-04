function [imgParameters] = plot3dMaps(imgParameters)

% imgParameters.geom: geom.node and geom.face - REQUIRED!
%
% The following are optional:
%
% imgParameters.data: should be a vector. If it is not provided, only the
% geometry is shown.
%
% imgParameters.EdgeAlpha
% imgParameters.FaceLighting
% imgParameters.nBins
% imgParameters.FntSz
% imgParameters.titleTxt
% imgParameters.unitCBar 
% imgParameters.markerFlg 1, if you want to mark nodes (eg. pacing node)
%   * The following are only used if markerFlg is 1:
%   imgParameters.markerCoord: (1x3) for the moment put a single marker. Later,
%       modify it to mark multiple coordinates.
%   imgParameters.markerSz 
%   imgParameters.markerColor


if ~isfield(imgParameters, 'EdgeAlpha')
    imgParameters.EdgeAlpha = 0;
end
if ~isfield(imgParameters, 'FaceLighting')
    imgParameters.FaceLighting = 'gouraud';
end
if ~isfield(imgParameters, 'nBins')
    imgParameters.nBins = 30;
end
if ~isfield(imgParameters, 'FntSz')
    imgParameters.FntSz = 14;
end
if ~isfield(imgParameters, 'markerFlg')
    imgParameters.markerFlg = 0;
end
if imgParameters.markerFlg
    % imgParameters.markerCoord should be defined as input. [x, y, z] coordinate
    % imgParameters.markerCoord = ATallBtsGND{1}.pacingNode2; [x, y, z] coordinate
    if ~isfield(imgParameters, 'markerSz')
        imgParameters.markerSz = 6;
    end
    if ~isfield(imgParameters, 'markerColor')
        imgParameters.markerColor = 'm';
    end
end
if ~isfield(imgParameters, 'titleTxt')
    imgParameters.titleTxt = '';
end
if ~isfield(imgParameters, 'unitCBar')
    imgParameters.unitCBar = '';
end
if ~isfield(imgParameters, 'Limits')
    imgParameters.Limits = [];
end
if ~isfield(imgParameters, 'viewAng')
    imgParameters.viewAng = [-70 -90]; 
end
if (isfield(imgParameters, 'data') && isempty(imgParameters.data))
    imgParameters = rmfield(imgParameters, 'data');
end
if ~isfield(imgParameters, 'ColorInv')
    imgParameters.ColorInv = 0;
end

if isfield(imgParameters, 'data')
    h=patch('Vertices',imgParameters.geom.node,'Faces',imgParameters.geom.face, ...
    'FaceVertexCData',imgParameters.data,'FaceColor','interp');
    h.EdgeAlpha = imgParameters.EdgeAlpha; %0.2;
    h.FaceLighting = imgParameters.FaceLighting; %'gouraud';
    if imgParameters.markerFlg % execute if equals 1
        hold on
        h2 = plot3(imgParameters.markerCoord(1,1),imgParameters.markerCoord(1,2),imgParameters.markerCoord(1,3));
        set(h2,'Marker','o','MarkerSize',imgParameters.markerSz,'MarkerFaceColor',imgParameters.markerColor,'LineStyle','none');
        hold off
    end
    if imgParameters.ColorInv % if equals 1
        map = flipud(jet(imgParameters.nBins));
    else
        map = jet(imgParameters.nBins);
    end
    colormap(map);
    cbar = colorbar(gca);
    cbar.Label.String = imgParameters.unitCBar;
    cbar.FontSize = imgParameters.FntSz;
    cbar.Color = 'k'; % can be an input parameter also.
    if isempty(imgParameters.Limits)
        imgParameters.Limits = cbar.Limits;
    else
        cbar.Limits = imgParameters.Limits;
    end
else
    h=patch('Vertices',imgParameters.geom.node,'Faces',imgParameters.geom.face);
    h.EdgeAlpha = imgParameters.EdgeAlpha; %0.2;
    h.FaceAlpha = 0.1;
end

%imgParameters.Limits
view(imgParameters.viewAng);
title(imgParameters.titleTxt);
axis tight
axis off
axis vis3d
