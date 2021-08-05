//use whole map, only deep enough water and roads near
//update 05AUG2021: only marker with radius 11.000 m to reduce travel time
private _axis = worldSize / 2;
private _center = [_axis, _axis , 0];
private _radius = sqrt 2 / 2 * worldSize;
private _randomPos = [
    ["marker_ao"],//[[_center,_radius]],
    ["ground"],
    {abs (getTerrainHeightASL _this) > 30
    && !IsNull ([_this, 2000] call BIS_fnc_nearestRoad)}
] call BIS_fnc_randomPos;

//find the nearest road for collection point
private _nearestRoad = [_randomPos, 2000] call BIS_fnc_nearestRoad;

//create a marker on ship
private _shipmarker = createMarker ["marker_ship",_randomPos];
_shipmarker setMarkerType "c_ship";
_shipmarker setMarkerColor "colorCivilian";

//create the ship object
private _shipclass = "C_Boat_Civil_04_F";
private _cargoclass = "CargoNet_01_barrels_F";
private _lightclass = "Reflector_Cone_01_white_F";
private _ship = _shipclass createVehicle _randomPos;

//create and attach the floodlights
private _lightattachtopoints = [
    [[-2.678,11.95,3.831], [[-0.5,0.866,0],[0,0,1]]],
    [[-1.511,11.95,3.831], [[0,1,0],[0,0,1]]],
    [[1.129,11.95,3.83], [[0,1,0],[0,0,1]]],
    [[2.303,11.95,3.831], [[0.5,0.866,0],[0,0,1]]],
    [[-2.684,2.732,3.452], [[-0.5,-0.866,0],[0,0,1]]],
    [[-0.948,2.732,3.452],[[-0,-1,0],[0,0,1]]],
    [[0.509,2.732,3.452], [[-0,-1,0],[0,0,1]]],
    [[2.237,2.732,3.452], [[0.5,-0.866,0],[0,0,1]]]
];
{
    private _light = _lightclass createVehicle [0,0,0];
    _light attachTo [_ship,_x#0];
    _light setVectorDirAndUp _x#1;
} foreach _lightattachtopoints;

//create and attach the sling load cargo
private _cargoattachpoints = [
    [0.824,-5.562,-2.599],
    [-0.279,-7.606,-2.599],
    [1.576,-7.33,-2.599],
    [-1.213,-9.554,-2.599]//,[0.618,-9.324,-2.599]
];
_ship setDir random 360;
private _cargoArray = [];
{
    _cargo = _cargoclass createVehicle [0,0,0];
    _cargo attachTo [_ship,_x];
    _cargo setdir random 360;
    detach _cargo;
    _cargoArray pushBack _cargo;
} foreach _cargoattachpoints;

//mark collection point
private _roadmarker = createMarker ["marker_collectionPoint",_nearestRoad];
_roadmarker setMarkerType "mil_end";
_roadmarker setMarkerText "Collection Point";

//spawn two trucks with light on
private _connectedroad = roadsConnectedTo _nearestRoad select 0;
private _roaddir = _nearestRoad getdir _connectedroad;

_vehClass_1 = "I_Truck_02_covered_F";//"C_IDAP_Van_02_vehicle_F";
_vehClass_2 = "I_Truck_02_covered_F";//"C_IDAP_Offroad_01_F";

_vehArr_1 = [getpos _nearestRoad,_roaddir,_vehClass_1,civilian] call BIS_fnc_spawnVehicle;
_vehArr_1 params ["_veh_1","_crew_1","_group_1"];
_veh_1 setpos (_nearestRoad getPos [2,_roaddir + 90]);
//_veh_1 animateSource ["beacon_front_hide",0];
//_veh_1 animateSource ["beacon_rear_hide",0];
//_veh_1 animateSource ['lights_em_hide',1]; 
driver _veh_1 action ["LightOn", _veh_1];

_vehArr_2 = [getpos _connectedroad,_roaddir,_vehClass_2,_group_1] call BIS_fnc_spawnVehicle;
_vehArr_2 params ["_veh_2","_crew_2"];
_veh_2 setpos (_connectedroad getPos [2,_roaddir - 90]);
driver _veh_2 action ["LightOn", _veh_2];
//_veh_2 animate ["hideservices",0];
//_veh_2  animate ["BeaconsServicesStart",1];
doStop _crew_2;
{_x unassignItem "NVGoggles";_x removeItem "NVGoggles";} foreach (_crew_1+_crew_2);

//define global variables for outside this function
AAS_collectionPoint = getpos _nearestRoad;
AAS_cargoArray = _cargoArray;
AAS_ship = _ship;

//advanced hint hooking
private _trg = createTrigger ["EmptyDetector", _ship];
_trg setTriggerArea [50, 50, 20, false];
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", false];
_trg setTriggerStatements ["this", "[['Slingloading','CargoHook'], 15, '', 35, '', false, false, true, true] call BIS_fnc_advHint;", ""];

//advanced hint unhooking
trg_collectionPoint = createTrigger ["EmptyDetector", AAS_collectionPoint];
trg_collectionPoint setTriggerArea [25, 25, 25, false];
trg_collectionPoint setTriggerActivation ["ANYPLAYER", "PRESENT", true];
private _trg_activation = "[['Slingloading','CargoUnhook'], 15, '!(triggerActivated trg_collectionPoint)', 35, '', false, false, false, true] call BIS_fnc_advHint;";
trg_collectionPoint setTriggerStatements ["this", _trg_activation, ""];

//move rescue boat to position
private _randomPosBoat = [
    [[AAS_ship,500]],
    ["ground",[AAS_ship,150]],
    {abs (getTerrainHeightASL _this) > 5}
] call BIS_fnc_randomPos;

C_rescueBoat setPos _randomPosBoat;
C_rescueBoat setdir ((_randomPosBoat getdir _randomPos) + random [-90,0,90]);
C_rescueBoat enableSimulation true;
private _rescueBoatmarker = createMarker ["marker_rescueBoat", C_rescueBoat];
_rescueBoatmarker setMarkerType "flag_IDAP";
_rescueBoatmarker setMarkerText "Boat Team";

/*[["hithull","hitfuel","hitavionics","hitengine1","hitengine2","hitengine","hithrotor",
"hitvrotor","hitglass1","hitglass1a","hitglass1b","hitglass2","hitglass3","hitglass4",
"hitglass5","hitglass6","hitglass7","hitglass8","hitglass9","hitglass10","hitglass11",
"hitglass12","hitglass13","hitglass14","hitglass15","hitglass16","hitglass17","hitmissiles",
"hitrglass","hitlglass","hitengine3","hitwinch","hittransmission","hitlight",
"hithydraulics","hitgear","hithstabilizerl1","hithstabilizerr1","hitvstabilizer1",
"hittail","hitpitottube","hitstaticport","hitstarter1","hitstarter2","hitstarter3",
"hitturret","hitgun","#light_hitpoint"],
["hull_hit","fuel_hit","avionics_hit",
"engine_1_hit","engine_2_hit","engine_hit","main_rotor_hit","tail_rotor_hit",
"glass1","glass1","glass1","glass2","glass3","glass4","glass5","glass6","glass7",
"glass8","glass9","glass10","glass11","glass12","glass13","glass14","glass15",
"glass16","glass17","","","","","slingload0","transmission","","","gear","hstabilizerl1",
"hstabilizerr1","vstabilizer1","tail boom","pitot tube","static port","starter1",
"starter2","","","","light_hitpoint"]*/