/*
	Author: GuzzenVonLidl
	Gives players another chance to continue playing the mission

	Usage:
	[wpl] call GW_Respawn_Fnc_Revive;	// Respawn a specific player
	["all"] call GW_Respawn_Fnc_Revive;	// Respawn all players spectating and give 1 extra life to alive players
	["allDead"] call GW_Respawn_Fnc_Revive;	// Respawn all players spectating

	Arguments:
	0: Unit <OBJECT || STRING>

	Return Value: YES <NUMBER>

	Public: No
*/
#include "..\scriptComponent.hpp"

params [
	["_unit", objNull, [objNull,""]]
];

if (_unit isEqualTo "all") then {
	{
		[QGVAR(secondChanceServer), [_x]] call CBA_fnc_serverEvent;
	} forEach allPlayers;
} else {
	if (_unit isEqualTo "allDead") then {
		{
			if (_x getVariable [QGVAR(isSpectating), false]) then {
				[QGVAR(secondChanceServer), [_x]] call CBA_fnc_serverEvent;
			};
		} forEach allPlayers;
	} else {
		[QGVAR(secondChanceServer), [_unit]] call CBA_fnc_serverEvent;
	};
};
