//=============================================================================
// RORoleInfoNorthernMachineGunner
//=============================================================================
// Default settings for the Vietnamese Machine Gunner role.
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACRoleInfoNorthernMachineGunner extends RORoleInfoNorthernInfantry;

DefaultProperties
{
	RoleType=RORIT_MachineGunner
	ClassTier=2
	ClassIndex=`ROCI_MACHINEGUNNER // 2

	Items[RORIGM_Default]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_RPD_LMG',class'ROGame.ROWeap_RP46_LMG',class'ACWeap_MG34_LMG'),
					// Other items
					OtherItems=(class'ROGame.ROWeap_Type67_GrenadeSingle',class'ROGame.ROWeap_PunjiTrap'),
		)}
	Items[RORIGM_Campaign_Early]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_RPD_LMG',class'ROGame.ROWeap_RP46_LMG',class'ACWeap_MG34_LMG'),
					// Other items
					OtherItems=(class'ROGame.ROWeap_Type67_GrenadeSingle'),
		)}
	Items[RORIGM_Campaign_Mid]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_RPD_LMG',class'ROGame.ROWeap_RP46_LMG',class'ACWeap_MG34_LMG'),
					// Other items
					OtherItems=(class'ROGame.ROWeap_Type67_GrenadeSingle'),
		)}
	Items[RORIGM_Campaign_Late]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_RPD_LMG',class'ROGame.ROWeap_RP46_LMG',class'ACWeap_MG34_LMG'),
					// Other items
					OtherItems=(class'ROGame.ROWeap_Type67_GrenadeSingle'),
		)}

	bAllowPistolsInRealism=true

	ClassIcon=Texture2D'VN_UI_Textures.menu.class_icon_mg'
	ClassIconLarge=Texture2D'VN_UI_Textures.menu.ProfileStats.class_icon_large_mg'
}