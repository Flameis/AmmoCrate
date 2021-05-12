//=============================================================================
// RORoleInfoNorthernGuerilla
//=============================================================================
// Default settings for the Vietnamese Guerilla (Rifleman) role.
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2016 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
// - Edited for the 29th by Reimer, published by Scovel
//=============================================================================
class ACRoleInfoRiflemanNLF extends RORoleInfoNorthernRifleman
	HideDropDown;

defaultproperties
{
	Items[RORIGM_Default]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROWeap_AK47_AssaultRifle_NLF',class'ROWeap_SKS_Rifle',class'ROWeap_M1_Carbine',class'ROWeap_MN9130_Rifle',class'WWWeapon_MN27',class'WWWeapon_MN38',class'ROGame.ROWeap_MAS49_Rifle',class'GOMWeapon_Kar98k',class'WWWeapon_AVS36',class'WWWeapon_SVT38'),
					SecondaryWeapons=(class'ROWeap_TT33_Pistol',class'ROWeap_PM_Pistol',class'GOMWeapon_NagantRevolver',class'WWWeapon_Luger'),
					OtherItems=(class'ROWeap_Type67_Grenade',class'ROWeap_PunjiTrap',class'ROItem_Binoculars'),
		)}
	Items[RORIGM_Campaign_Early]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_SKS_Rifle',class'ROGame.ROWeap_M1_Carbine',class'ROGame.ROWeap_MN9130_Rifle',class'ROGame.ROWeap_MAS49_Rifle'),
		)}
	Items[RORIGM_Campaign_Mid]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_AK47_AssaultRifle_NLF',class'ROGame.ROWeap_SKS_Rifle',class'ROGame.ROWeap_M1_Carbine',class'ROGame.ROWeap_MN9130_Rifle',class'ROGame.ROWeap_MAS49_Rifle'),
		)}
	Items[RORIGM_Campaign_Late]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_AK47_AssaultRifle',class'ROGame.ROWeap_SKS_Rifle',class'ROGame.ROWeap_M1_Carbine',class'ROGame.ROWeap_MN9130_Rifle',class'ROGame.ROWeap_MAS49_Rifle'),
		)}

}
