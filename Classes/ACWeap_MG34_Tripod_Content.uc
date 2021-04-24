//=============================================================================
// ROWeap_DShK_HMG_Tripod_Content
//=============================================================================
// Content for DShK Heavy Machine Gun deployed on a Tripod
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACWeap_MG34_Tripod_Content extends ACWeap_MG34_Tripod;

DefaultProperties
{
	ArmsAnimSet=AnimSet'WP_Ger_MG34_Tripod.animation.WP_MG34Tripod_Hands'

	// Weapon SkeletalMesh
	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'WP_Ger_MG34_Tripod.Mesh.Ger_MG34_Tripod'
		AnimSets(0)=AnimSet'WP_Ger_MG34_Tripod.animation.WP_MG34Tripod_Hands'
		Animations=AnimTree'WP_Ger_MG34_Tripod.animation.MG34TurretAnimtree'
	End Object

	// Arms SkeletalMesh
	Begin Object Name=FirstPersonArmsMesh
		AnimSets(1)=AnimSet'WP_Ger_MG34_Tripod.animation.WP_MG34Tripod_Hands'
	End Object

	// Ammo belt SkeletalMesh
	Begin Object Name=AmmoBelt0
		SkeletalMesh=SkeletalMesh'WP_Ger_MG34_Tripod.Mesh.Ger_MG34_Tripod_Belt'
		PhysicsAsset=PhysicsAsset'WP_Ger_MG34_Tripod.Phy.Ger_MG34_Tripod_Belt_Physics'
		AnimSets(0)=AnimSet'WP_Ger_MG34_Tripod.animation.WP_MG34Tripod_Hands'
		DepthPriorityGroup=SDPG_Foreground
		bOnlyOwnerSee=false
		MaxAmmoShown=22
	End Object
	AmmoBeltMesh=AmmoBelt0

	AttachmentClass=class'AmmoCrate.ACWeapAttach_MG34_Turret'

	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_MG34.Play_WEP_MG34_Loop_3P', FirstPersonCue=AkEvent'WW_WEP_MG34.Play_WEP_MG34_Auto_LP')
    WeaponFireSnd(ALTERNATE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_Owen.Play_WEP_Owen_Single_3P', FirstPersonCue=AkEvent'WW_WEP_Owen.Play_WEP_Owen_Fire_Single')

    bLoopingFireSnd(DEFAULT_FIREMODE)=true
    WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_RPD.Play_WEP_RPD_Tail_3P', FirstPersonCue=AkEvent'WW_WEP_RPD.Play_WEP_RPD_Tail')
    bLoopHighROFSounds(DEFAULT_FIREMODE)=true
}
