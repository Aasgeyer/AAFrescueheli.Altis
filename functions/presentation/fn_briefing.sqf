[group player,"tsk_gear","",E_headset,"ASSIGNED",100,true,"default"] call BIS_fnc_taskCreate;
[group player,"tsk_getIn","",C_heli,"CREATED",99,true,"getIn"] call BIS_fnc_taskCreate;
[group player,"tsk_rescue","",markerpos "marker_areaDrowning","CREATED",98,true,"search"] call BIS_fnc_taskCreate;
[group player,"tsk_cargo","",AAS_ship,"CREATED",97,true,"slingload"] call BIS_fnc_taskCreate;



private _txtBriefing = "The weather will change over the next hour or so.
We expect heavy rain and storm with strong gusts. There may be lightning. 
Waves may become two meters high. We expect the survival chance of the survivor
 to decrease over time. The IDAP boat can not operate with waves this high,
 meaning at around 1940 hours the IDAP boat must pull back.
 If the weather gets too bad, we will have to abort the mission.
 We expect this to be around 2000 hours.
 ";
private _createdRecord = player createDiaryRecord ["Diary", ["Weather Forecast", _txtBriefing]];

private _txtBriefing = "Echo - Helicopter (you)<br/>
Base - Airbase coordinating the effort<br/>
Alpha - Trucks on the shore<br/>
Boat Team - IDAP rescue boat<br/>
";
private _createdRecord = player createDiaryRecord ["Diary", ["Signal", _txtBriefing]];

private _txtBriefing = "1. Grab your gear<br/>
2. Lift off after pre-flight check<br/>
3. Find the man overboard<br/>
4. Guide the IDAP boat to his position<br/>
5. Sling the cargo off the ship and get it within 25 m of the <marker name='marker_collectionPoint'>collection point</marker><br/>
6.Return to <marker name='marker_0'>base</marker> and land<br/>
";
private _createdRecord = player createDiaryRecord ["Diary", ["Execution", _txtBriefing]];

private _txtBriefing = "Find the man overboard and get the cargo off the ship!";
private _createdRecord = player createDiaryRecord ["Diary", ["Mission", _txtBriefing]];

//<marker name='respawn_west'>Respawn point</marker>
private _txtBriefing = "We received a distress call from a <marker name='marker_ship'>civilian ship</marker> off the coast of Altis.
 Most of the crew evacuated, but one person went overboard.
 Additionally the ship carries hazardous substances.
 The crew was able to gather that cargo on the deck ready to be slingloaded.<br/>
 The AAF is present with a heavy helicopter at the <marker name='marker_0'>Altis Air Field</marker>.
 We deployed <marker name='marker_collectionPoint'>trucks</marker> to the coast near the ship.
 An <marker name='marker_rescueBoat'>IDAP boat</marker> is on standby to take in the man that went overboard.
 (Use the communication menu by pressing 0-8-1)<br/>
 The weather is difficult as it is and is getting even worse.
 Strong winds, heavy rain and high waves hinder the rescue effort.
 The dwindling daylight makes the situation even worse.
 In case the conditions get to severe, we must abort the mission.<br/>
 Should you find yourself unable to continue the mission, we will abort the effort. (Press 0-0-1)";
private _createdRecord = player createDiaryRecord ["Diary", ["Situation", _txtBriefing]];