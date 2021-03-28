// ROItem_VCPlaceableAmmoCrate
//=============================================================================
// A VC version of the placeable Ammo Crate.
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2018 Tripwire Interactive LLC
// - Nate Steger @ Antimatter Games LTD
//============================================================================

class ROItem_VCAmmoCrate extends ROItem_AmmoCrate;

DefaultProperties
{
	WeaponContentClass(0)="AmmoCrate.ROItem_VCAmmoCrate_Content"
	RoleSelectionImage(0)=Texture2D'VN_UI_Textures.WeaponTex.VN_Binocs' //TODO: Give me a proper one soon!

	ClassConstructorProxy=class'ROVCAmmoCreateConstructorProxy'
}