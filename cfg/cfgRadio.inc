class CfgRadio
{
	sounds[] = {};
	//Dropped Cargo too far away
	class cargoDropped_1
	{
		name	= "cargoDropped_1";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Damn, I think we dropped the slingload.";
	};
	class cargoDropped_2
	{
		name	= "cargoDropped_2";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Whoops, we dropped the slingload too early.";
	};
	class cargoDropped_3
	{
		name	= "cargoDropped_3";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Err... captain? Thats not close enough to our guys.";
	};

	//cargo dead or under water
	class cargoLost_1
	{
		name	= "cargoLost_1";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Fuck. That cargo is a goner.";
	};
	class cargoLost_2
	{
		name	= "cargoLost_2";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Shit, we just wrecked that thing.";
	};
	class cargoLost_3
	{
		name	= "cargoLost_3";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "God dammit. That cargo is lost. If anyone asks: that was totally not my fault.";
	};

	//cargo slingloaded
	class cargohooked_1
	{
		name	= "CargoHooked_1";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Cargo hooked, ready to go.";
	};
	class cargohooked_2
	{
		name	= "CargoHooked_2";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Got it on the hook, let's go.";
	};
	class cargohooked_3
	{
		name	= "CargoHooked_3";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "We got it on the sling. Let's head to the delivery point.";
	};
	class cargohooked_4
	{
		name	= "CargoHooked_4";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Ropes are attached and ready to lift.";
	};
	class cargohooked_5
	{
		name	= "CargoHooked_5";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Slingload is on the hook. One delivery coming in, hot and steamy.";
	};
	class cargohooked_6
	{
		name	= "CargoHooked_6";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "One sec... got it. Ready for lifting.";
	};

	//player got in
	class playerInHeli
	{
		name	= "playerInHeli";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Welcome on board captain. All systems checked. Ready for final items checklist?";
	};
	class Checklist_N
	{
		name	= "Checklist_N";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "TEXTGOESHERE";
	};
	class Checklist_1
	{
		name	= "Checklist_1";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Shoulder harnesses — Fastened.";
	};
	class Checklist_2
	{
		name	= "Checklist_2";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Doors and windows — Locked.";
	};
	class Checklist_3
	{
		name	= "Checklist_3";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Mixture — Full rich.";
	};
	class Checklist_4
	{
		name	= "Checklist_4";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Lights — Collision Lights on.";
	};
	class Checklist_5
	{
		name	= "Checklist_5";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Action — Engine instruments checked.";
	};
	class Checklist_6
	{
		name	= "Checklist_6";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Ready for takeoff.";
	};
	class Checklist_reminder
	{
		name	= "Checklist_reminder";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Captain? Collision lights? Will you turn them on?";
	};
	class Checklist_gearDown
	{
		name	= "Checklist_gearDown";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Landing gear - Down.";
	};
	class Checklist_gearDown_reminder
	{
		name	= "Checklist_gearDown_reminder";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Check landing gear, captain.";
	};
	
	//next cargo
	class nextcargo_1
	{
		name	= "nextcargo_1";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "All right. Let's get the next one.";
	};
	class nextcargo_2
	{
		name	= "nextcargo_2";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "One less, more to go.";
	};
	class nextcargo_3
	{
		name	= "nextcargo_3";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "There are still some we must get.";
	};
	class nextcargo_4
	{
		name	= "nextcargo_4";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Well, time to get the next one.";
	};
	class nextcargo_5
	{
		name	= "nextcargo_5";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "We mustn't waste time, so let's get the next one off the ship.";
	};
	class nextcargo_6
	{
		name	= "nextcargo_6";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "There are more on the ship. Let's sling them up.";
	};

	//head home
	class goHome_all
	{
		name	= "goHome_all";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "All units, this is Base. All cargo secured. Well done! Head on home. Base out.";
	};
	class goHome_some
	{
		name	= "goHome_some";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "All units, this is Base. We secured as much of the cargo as we can. Return to base. Base out.";
	};
	class goHome_none
	{
		name	= "goHome_none";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "All units, this is Base. No cargo secured, but there's nothing we can do about it. Return to base for debrief. Base out.";
	};

    //drowning
	class drowning_dead
	{
		name	= "drowning_dead";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Echo, boat team report a sinking body. There's nothing we can do anymore. Continue to sling loading of the cargo on the trawler.";
	};
	class drowning_waves
	{
		name	= "drowning_waves";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Echo, boat team has to pull back, the waves are getting to severe. There's only a slim survival chance with these waves. Proceed to sling load the cargo on the ship.";
	};
	class drowning_found
	{
		name	= "drowning_found";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "Man over board found and rescued! Well done Echo! Proceed to lift the cargo off the ship.";
	};

    //weather
	class weather_cancel
	{
		name	= "weather_cancel";
		sound[]	= { "", db - 100, 1.0 }; // .wss implied
		title	= "The weather is getting too dangerous to continue the mission. All units return to base!";
	};
};