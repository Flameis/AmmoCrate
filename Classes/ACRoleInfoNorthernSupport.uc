
class ACRoleInfoNorthernSupport extends RORoleInfoNorthernRadioman;

DefaultProperties
{
	RoleType=RORIT_Radioman
	ClassTier=3
	ClassIndex=`ROCI_RADIOMAN // 7
	bIsRadioman=true

	Items[RORIGM_Default]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_AK47_AssaultRifle',class'ROGame.ROWeap_SKS_Rifle'),
					// Other items
					OtherItems=(class'ROGame.ROWeap_RDG1_Smoke',class'AmmoCrate.ROItem_VCAmmoCrate'),
		)}
	Items[RORIGM_Campaign_Early]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_AK47_AssaultRifle_NLF',class'ROGame.ROWeap_SKS_Rifle'),
					// Other items
					OtherItems=(class'ROGame.ROWeap_RDG1_Smoke',class'AmmoCrate.ROItem_VCAmmoCrate'),
		)}
	Items[RORIGM_Campaign_Mid]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_AK47_AssaultRifle',class'ROGame.ROWeap_SKS_Rifle'),
					// Other items
					OtherItems=(class'ROGame.ROWeap_RDG1_Smoke',class'AmmoCrate.ROItem_VCAmmoCrate'),
		)}
	Items[RORIGM_Campaign_Late]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_AK47_AssaultRifle',class'ROGame.ROWeap_PPSH41_SMG'),
					// Other items
					OtherItems=(class'ROGame.ROWeap_RDG1_Smoke',class'AmmoCrate.ROItem_VCAmmoCrate'),
		)}

	bAllowPistolsInRealism=false

	ClassIcon=Texture2D'VN_UI_Textures.menu.class_icon_radioman'
	ClassIconLarge=Texture2D'VN_UI_Textures.menu.ProfileStats.class_icon_large_radioman'
}