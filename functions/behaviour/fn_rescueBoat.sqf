params ["_caller", "_pos", "_target", "_is3D", "_id"];

//fixed: only convert position, if it actually interesects terrain, otherwise position [0,0,0] will be reported
If (terrainIntersectASL [eyePos _caller, _pos]) then {
    private _pos = AGLToASL _pos;
    private _intersectASL = terrainIntersectAtASL [eyepos _caller, _pos];
    //diag_log _pos;
    private _pos = ASLToAGL _intersectASL;
    //diag_log _pos;
};
If (_pos#0 == 0 OR _pos#1 == 0) exitWith {
    systemChat format ["Invalid Position at %1",mapGridPosition _pos];
};

_caller sidechat format ["Base, tell Boat Team to check the position at %1",mapGridPosition _pos];

//if position is on land exit
If !(surfaceIsWater _pos) exitWith {
    0 = [] spawn {
        sleep 3;
        [independent, "AirBase"] sideChat "Echo, the position you gave is on land. You must search the water.";
    };
};

private _rescueGroup = group driver C_rescueBoat;
private _leaderRescue = leader _rescueGroup;

//rescue boat moves to position
leader _rescueGroup doMove _pos;
0 = [] spawn {
    sleep 3;
    [independent, "AirBase"] sideChat "Echo, Boat Team is on the way.";
};

//create or move a marker on the reported position
If (getMarkerColor "marker_rescueMove" == "") then {
    private _marker = createMarker ["marker_rescueMove", _pos];
    _marker setMarkerType "mil_destroy";
    _marker setMarkerColor "ColorYellow";
} else {
    "marker_rescueMove" setmarkerpos _pos;
};