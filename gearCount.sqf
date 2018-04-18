Fn_Gear_CompatibleMagazines = {
	private _cls = configFile >> "CfgWeapons" >> _this;
	private _res = [];
	{_res pushBack (if (_x == "this")
		then {getArray(_cls >> "magazines")}
		else {getArray(_cls >> _x >> "magazines")});
	} forEach getArray(_cls >> "muzzles");

	_res
};

private _myMan = player;
private _mags = magazines player;


{
	if (count _x > 0) then {
		while {count _x > 0} do {
			{
			    if (count _x > 0) then
			    	{
					_myMan removeMagazine (_x select 0) //Removes Magazines... Does Work.
				}
			} foreach (_x call Fn_Gear_CompatibleMagazines)
		}
	}


} forEach [primaryWeapon _myMan, secondaryWeapon _myMan, handgunWeapon _myMan];



//WORKING CODE BELOW

/*
{	if (count _x > 0) then {
		{
			if (count _x > 0) then
			{
				_myMan addMagazines [(_x select 0), 3]
			}
		} foreach (_x call Fn_Gear_CompatibleMagazines)
	}
} forEach [primaryWeapon _myMan, secondaryWeapon _myMan, handgunWeapon _myMan];

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------


{
	if (count _x > 0) then {
		while {count _x > 0} do {
			{
			    if (count _x > 0) then
			    	{
					_myMan removeMagazine (_x select 0) //Removes Magazines... Does Work.
				}
			} foreach (_x call Fn_Gear_CompatibleMagazines)
		}
	}


} forEach [primaryWeapon _myMan, secondaryWeapon _myMan, handgunWeapon _myMan];
