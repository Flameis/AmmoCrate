
class ACRoleInfoNorthernSupport extends RORoleInfoNorthernInfantry;

DefaultProperties
{
	RoleType=RORIT_Radioman
	ClassTier=3
	ClassIndex=`ROCI_RADIOMAN // 7
	bIsRadioman=true

	Items[RORIGM_Default]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_SKS_Rifle',class'ROGame.ROWeap_MAS49_Rifle'),
					// Other items
					OtherItems=(class'ROGame.ROWeap_RDG1_Smoke',class'AmmoCrate.ACItem_VCAmmoCrate',class'ROGame.ROItem_Binoculars'),
					OtherItemsStartIndexForPrimary=(0, 0),
					NumOtherItemsForPrimary=(0, 0)
		)}
	Items[RORIGM_Campaign_Early]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_SKS_Rifle',class'ROGame.ROWeap_MAS49_Rifle'),
					// Other items
					OtherItems=(class'ROGame.ROWeap_RDG1_Smoke',class'AmmoCrate.ACItem_VCAmmoCrate',class'ROGame.ROItem_Binoculars'),
					OtherItemsStartIndexForPrimary=(0, 0),
					NumOtherItemsForPrimary=(0, 0)
		)}
	Items[RORIGM_Campaign_Mid]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_SKS_Rifle',class'ROGame.ROWeap_MAS49_Rifle'),
					// Other items
					OtherItems=(class'ROGame.ROWeap_RDG1_Smoke',class'AmmoCrate.ACItem_VCAmmoCrate',class'ROGame.ROItem_Binoculars'),
					OtherItemsStartIndexForPrimary=(0, 0),
					NumOtherItemsForPrimary=(0, 0)
		)}
	Items[RORIGM_Campaign_Late]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_SKS_Rifle',class'ROGame.ROWeap_MAS49_Rifle'),
					// Other items
					OtherItems=(class'ROGame.ROWeap_RDG1_Smoke',class'AmmoCrate.ACItem_VCAmmoCrate',class'ROGame.ROItem_Binoculars'),
					OtherItemsStartIndexForPrimary=(0, 0),
					NumOtherItemsForPrimary=(0, 0)
		)}

	bAllowPistolsInRealism=false

	ClassIcon=Texture2D'VN_UI_Textures.menu.class_icon_radioman'
	ClassIconLarge=Texture2D'VN_UI_Textures.menu.ProfileStats.class_icon_large_radioman'
}