//=============================================================================
// RORoleInfoNorthernMachineGunnerNLF
//=============================================================================
// Default settings for the Vietnamese Machine Gunner role, NLF specifically.
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2016 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACRoleInfoNorthernMachineGunnerNLF extends RORoleInfoNorthernMachineGunner;

DefaultProperties
{
	Items[RORIGM_Default]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_RPD_LMG',class'ROGame.ROWeap_DP28_LMG',class'ROGame.ROWeap_M1918_BAR',class'ACWeap_MG34_LMG'),
		)}
	Items[RORIGM_Campaign_Early]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_DP28_LMG',class'ROGame.ROWeap_M1919A6_LMG',class'ROGame.ROWeap_M1918_BAR',class'ACWeap_MG34_LMG'),
					// Other items
					OtherItems=(class'ROGame.ROWeap_Type67_GrenadeSingle',class'ROGame.ROWeap_PunjiTrap'),
		)}
	Items[RORIGM_Campaign_Mid]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_RPD_LMG_NLF',class'ROGame.ROWeap_DP28_LMG',class'ROGame.ROWeap_M1918_BAR',class'ACWeap_MG34_LMG'),
					// Other items
					OtherItems=(class'ROGame.ROWeap_Type67_GrenadeSingle',class'ROGame.ROWeap_PunjiTrap'),
		)}
	Items[RORIGM_Campaign_Late]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_RPD_LMG_NLF',class'ROGame.ROWeap_DP28_LMG',class'ACWeap_MG34_LMG'),
					// Other items
					OtherItems=(class'ROGame.ROWeap_Type67_GrenadeSingle',class'ROGame.ROWeap_PunjiTrap'),
		)}
}
