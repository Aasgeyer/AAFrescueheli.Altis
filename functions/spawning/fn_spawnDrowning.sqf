//find suitable position near ship, in deep water
private _randomPos = [
    [[AAS_ship,2500]],
    ["ground",[AAS_ship,750]],
    {abs (getTerrainHeightASL _this) > 30}
] call BIS_fnc_randomPos;

//move and enable guy
C_drowning setpos _randomPos;
C_drowning enableSimulation true;
//hinder drowning
C_drowning swimInDepth 0;
C_drowning doMove (C_drowning getpos [10,random 360]);

//create a marker on the search area
private _searchRadius = 750;
private _areaMarkerPos = _randomPos getpos [random _searchRadius,random 360];
private _markerstr = createMarker ["marker_areaDrowning", _areaMarkerPos];
_markerstr setMarkerShape "ELLIPSE";
_markerstr setMarkerSize [_searchRadius, _searchRadius];
_markerstr setMarkerColor "ColorOrange";

//[player,"guiderescueBoat"] call BIS_fnc_addCommMenuItem;