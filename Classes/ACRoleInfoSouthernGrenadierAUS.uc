//=============================================================================
// RORoleInfoSouthernGrenadierAUS
//=============================================================================
// Default settings for the Australian Grenadier role.
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2017 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACRoleInfoSouthernGrenadierAUS extends RORoleInfoSouthernInfantry;
	
DefaultProperties
{
	RoleType=RORIT_Support
	ClassTier=2
	ClassIndex=`ROCI_HEAVY // 5

	Items[RORIGM_Default]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROWeap_M79_GrenadeLauncher',class'ACWeap_M79_GrenadeLauncher',class'ROGame.ROWeap_L1A1_Rifle'),
					// Secondary: DEFAULTS
					SecondaryWeapons=(class'ROGame.ROWeap_Owen_SMG'),
					DisableSecondaryForPrimary=(false,false,true),
					// Other Items
					OtherItems=(class'ROGame.ROWeap_M8_Smoke',class'ROGame.ROWeap_M61_GrenadeQuad'),
					OtherItemsStartIndexForPrimary=(0, 0, 1),
					NumOtherItemsForPrimary=(1, 1, 2),
		)}
	Items[RORIGM_Campaign_Early]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROWeap_M79_GrenadeLauncher',class'ACWeap_M79_GrenadeLauncher',class'ROGame.ROWeap_L1A1_Rifle'),
					// Secondary: DEFAULTS
					SecondaryWeapons=(class'ROGame.ROWeap_Owen_SMG'),
					DisableSecondaryForPrimary=(false,false,true),
					// Other Items
					OtherItems=(class'ROGame.ROWeap_M8_Smoke',class'ROGame.ROWeap_M61_GrenadeQuad'),
					OtherItemsStartIndexForPrimary=(0, 0, 1),
					NumOtherItemsForPrimary=(1, 1, 2),
		)}
	Items[RORIGM_Campaign_Mid]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROWeap_M79_GrenadeLauncher',class'ACWeap_M79_GrenadeLauncher',class'ROGame.ROWeap_L1A1_Rifle'),
					// Secondary: DEFAULTS
					SecondaryWeapons=(class'ROGame.ROWeap_Owen_SMG'),
					DisableSecondaryForPrimary=(false,false,true),
					// Other Items
					OtherItems=(class'ROGame.ROWeap_M8_Smoke',class'ROGame.ROWeap_M61_GrenadeQuad'),
					OtherItemsStartIndexForPrimary=(0, 0, 1),
					NumOtherItemsForPrimary=(1, 1, 2),
		)}
	Items[RORIGM_Campaign_Late]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROWeap_M79_GrenadeLauncher',class'ACWeap_M79_GrenadeLauncher',class'ROGame.ROWeap_L1A1_Rifle'),
					// Secondary: DEFAULTS
					SecondaryWeapons=(class'ROGame.ROWeap_Owen_SMG'),
					DisableSecondaryForPrimary=(false,false,true),
					// Other Items
					OtherItems=(class'ROGame.ROWeap_M8_Smoke',class'ROGame.ROWeap_M61_GrenadeQuad'),
					OtherItemsStartIndexForPrimary=(0, 0, 1),
					NumOtherItemsForPrimary=(1, 1, 2),
		)}

	// Secondary Weapons
	bAllowPistolsInRealism=true
	bUseRootSecondaryWeapsForSL=true

	ClassIcon=Texture2D'VN_UI_Textures.menu.class_icon_grenadier'
	ClassIconLarge=Texture2D'VN_UI_Textures.menu.ProfileStats.class_icon_large_grenadier'
}
