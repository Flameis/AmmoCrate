
class ACRoleInfoSouthernSupport extends RORoleInfoSouthernRadioman;

DefaultProperties
{
	RoleType=RORIT_Radioman
	ClassTier=3
	ClassIndex=`ROCI_RADIOMAN // 7
	bIsRadioman=true

	Items[RORIGM_Default]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_M16A1_AssaultRifle_Late',class'ROGame.ROWeap_M2_Carbine'),
					// Other items
					OtherItems=(class'ROGame.ROWeap_M8_Smoke',class'AmmoCrate.ROItem_USAmmoCrate'),
		)}
	Items[RORIGM_Campaign_Early]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_M16A1_AssaultRifle_Late',class'ROGame.ROWeap_M2_Carbine'),
					// Other items
					OtherItems=(class'ROGame.ROWeap_M8_Smoke',class'AmmoCrate.ROItem_USAmmoCrate'),
		)}
	Items[RORIGM_Campaign_Mid]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_M16A1_AssaultRifle_Late',class'ROGame.ROWeap_M2_Carbine'),
					// Other items
					OtherItems=(class'ROGame.ROWeap_M8_Smoke',class'AmmoCrate.ROItem_USAmmoCrate'),
		)}
	Items[RORIGM_Campaign_Late]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_M16A1_AssaultRifle_Late',class'ROGame.ROWeap_M2_Carbine'),
					// Other items
					OtherItems=(class'ROGame.ROWeap_M8_Smoke',class'AmmoCrate.ROItem_USAmmoCrate'),
		)}

	bAllowPistolsInRealism=false

	ClassIcon=Texture2D'VN_UI_Textures.menu.class_icon_radioman'
	ClassIconLarge=Texture2D'VN_UI_Textures.menu.ProfileStats.class_icon_large_radioman'
}