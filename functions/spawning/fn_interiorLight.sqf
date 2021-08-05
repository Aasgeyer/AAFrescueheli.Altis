params ["_vehicle","_mode"];

switch (tolower _mode) do
{
    case "init": {
        //create light and attach it
        private _light1 = "#lightpoint" createVehicleLocal [0,0,0]; 
        _light1 setLightBrightness 0.0; //0.1
        _light1 setLightAmbient [0.2,0.2,0.2]; 
        _light1 setLightColor [1,0.2,0.2]; 
        _light1 attachTo [_vehicle,[0.036,6.13,-0.804]]; //mohawk
        _vehicle setVariable ["AAS_interiorLightPoint",_light1];
        _vehicle setVariable ["AAS_interiorLightOn", false];

        //add actions for on
        private _codeAction = {
            params ["_target", "_caller", "_actionId", "_arguments"];
            [_target,"on"] call AAS_fnc_interiorLight;
        };
        private _conditionAction = "!(_target getvariable 'AAS_interiorLightOn') && _this in _target";
        private _textAction = "<t color='#FFFFFF00'>Interior Light On</t>";
        _vehicle addAction [_textAction, _codeAction, [], 0, false, true, "", _conditionAction, 50];
        //and off
        private _codeAction = {
            params ["_target", "_caller", "_actionId", "_arguments"];
            [_target,"off"] call AAS_fnc_interiorLight;
        };
        private _conditionAction = "(_target getvariable 'AAS_interiorLightOn') && _this in _target";
        private _textAction = "<t color='#FFFFFF00'>Interior Light Off</t>";
        _vehicle addAction [_textAction, _codeAction, [], 0, false, true, "", _conditionAction, 50];
    };

    case "on": {
        //turn on
        private _lightPoint = _vehicle getVariable "AAS_interiorLightPoint";
        _lightPoint setLightBrightness 0.2;
        _vehicle setVariable ["AAS_interiorLightOn", true];
        
    };

    case "off": {
        //turn off
        private _lightPoint = _vehicle getVariable "AAS_interiorLightPoint";
        _lightPoint setLightBrightness 0.0;
        _vehicle setVariable ["AAS_interiorLightOn", false];
    };
};