TrackCuePos = fopen('Track_Cue_Positions');
fgetl(TrackCuePos);
MapPos = fscanf(TrackCuePos, '%f', [7, inf])';

MapTyp = tdfread('Track_Cue_Types', '\t')



MapBBox = zeros (1900,2700);
maxX = zeros(size(MapPos,1),1);
minX = zeros(size(MapPos,1),1);
maxY = zeros(size(MapPos,1),1);
minY = zeros(size(MapPos,1),1);
for i=1:size(MapPos,1)
   maxX(i) = max(MapPos(i,2),MapPos(i, 4));
   minX(i) = min(MapPos(i,2),MapPos(i, 4));
   maxY(i) = max(MapPos(i,3),MapPos(i, 5));
   minY(i) = min(MapPos(i,3),MapPos(i, 5));
   
end


for i=1:size(MapPos,1)
    if (MapTyp.side(i) == 'l')
        MapBBox(minX(i)+900:maxX(i)+900,minY(i)+400:maxY(i)+400) = 1;
    else
        if (MapTyp.side(i) == 'r')
        MapBBox(minX(i)+900:maxX(i)+900,minY(i)+400:maxY(i)+400) = 3;    
        else 
        MapBBox(minX(i)+900:maxX(i)+900,minY(i)+400:maxY(i)+400) = 2;
        end
    end
end
imagesc (MapBBox)
size(MapBBox);


