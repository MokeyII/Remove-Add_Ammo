


private _var = player;

Fn_Gear_CompatibleMagazines =
{
	private _cls = configFile >> "CfgWeapons" >> _this;
	private _res = [];
	{
		_res pushBack (if (_x == "this")
		then {getArray(_cls >> "magazines")}
		else {getArray(_cls >> _x >> "magazines")});
	} forEach getArray(_cls >> "muzzles");

	_res
};

{
	if (count _x > 0) then
	{
		while {count _x > 0} do {
			{
			    if (count _x > 0) then
			    	{
					_var removeMagazine (_x select 0)
				}
			} foreach (_x call Fn_Gear_CompatibleMagazines)
		}
	}

} forEach [primaryWeapon _var, secondaryWeapon _var, handgunWeapon _var];

{
	if (count _x > 0) then
	{
		{
			if (count _x > 0) then
			{
				_var addMagazines [(_x select 0), 3]
			}
		} foreach (_x call Fn_Gear_CompatibleMagazines)
	}
} forEach [primaryWeapon _var, secondaryWeapon _var, handgunWeapon _var];
