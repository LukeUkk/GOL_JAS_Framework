if (hasInterface) then {
	
    	_condition = {player in [w1a,w1a1,w1b1,w1c1,e1a,e1a1,e1b1,e1c1,i1a,i1a1,i1b1,i1c1]}; //<only works MP_condition = {leader (group player) isEqualTo (leader player)};
   	_code = {openMap true;[player, systemChat "Pilot: Awaiting coordinates"] onMapSingleClick {[blufor,"","drop",    ["spawn",_pos,"despawn"],"Scripts\NEKY_supply\Supply Box Templates\Resupply.sqf",false] execVM "Scripts\NEKY_supply\NEKY_SupplyMapClick.sqf"}};
	_landcode = {openMap true;[player, systemChat "Pilot: Awaiting coordinates"] onMapSingleClick {[blufor,"","unload",    ["spawn",_pos,"despawn"],"Scripts\NEKY_supply\Supply Box Templates\Resupply.sqf",false] execVM "Scripts\NEKY_supply\NEKY_SupplyMapClick.sqf"}};
    
	_action = ["Resupply", "Resupply","", {}, _condition] call ace_interact_menu_fnc_createAction;
	_drop = ["Air Drop", "Air Drop","", _code, _condition] call ace_interact_menu_fnc_createAction;
	_unload = ["Land and Unload", "Land and Unload","", _landcode, _condition] call ace_interact_menu_fnc_createAction;
	
	[typeOf player, 1, ["ACE_SelfActions","ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToClass;
	[typeOf player, 1, ["ACE_SelfActions","ACE_Equipment","Resupply"], _drop] call ace_interact_menu_fnc_addActionToClass;
	[typeOf player, 1, ["ACE_SelfActions","ACE_Equipment","Resupply"], _unload] call ace_interact_menu_fnc_addActionToClass;
};

// Thanks to Neko & Guzzman for the scripts and helping fixing errors.
// Here I have made nekos scripts and functions compatabile to the ace UI, 
//only thing you can edit really is [blufor,"","drop",["spawn",_pos,"despawn"] so this means/ change side,"","unload or drop", ["markername","mouse click","markername"]
// By Luke.
