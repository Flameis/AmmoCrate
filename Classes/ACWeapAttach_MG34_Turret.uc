//=============================================================================
// ROWeapAttach_MG34_LMG_Turret
//=============================================================================
// 3rd person Weapon attachment class for the MG34 LMG
//=============================================================================
// Red Orchestra Source
// Copyright (C) 2008 Tripwire Interactive LLC
// - Dayle "Xienen" Flowers
//=============================================================================
class ACWeapAttach_MG34_Turret extends ROWeaponAttachment;

/** Turrets have their own third person mesh */
simulated function AttachTo(Pawn OwnerPawn, bool bVisible, optional bool bCarry = false)
{
	if ( ROTurret(OwnerPawn) != None )
	{
		if ( OwnerPawn.Mesh != None )
		{
			Mesh = OwnerPawn.Mesh;
		}

		Super.AttachTo(OwnerPawn, bVisible);
	}
}

simulated function CheckToForceRefPose()
{
	ClearTimer('CheckToForceRefPose');
}

defaultproperties
{
	TriggerHoldDuration=0.2

	IKProfileName=Turret

	// Weapon SkeletalMesh
	Begin Object Name=SkeletalMeshComponent0
	End Object

	MuzzleFlashSocket=MuzzleFlashSocket
	MuzzleFlashPSCTemplate=ParticleSystem'FX_VN_Weapons.MuzzleFlashes.FX_VN_MuzzleFlash_1stP_Rifles_round'
	MuzzleFlashDuration=0.33
	MuzzleFlashLightClass=class'ROGame.RORifleMuzzleFlashLight'

	// Shell eject FX
	ShellEjectSocket=ShellEjectSocket
	ShellEjectPSCTemplate=ParticleSystem'FX_VN_Weapons_Two.ShellEjects.FX_Wep_ShellEject_M1919'
	
	WeaponClass=class'ACWeap_MG34_Tripod'

	// Tracers
	TracerClass=class'DShKBulletTracer'
	TracerFrequency=10

	// Player animations - Weapon Actions
	ReloadAnims(0)=Tripod_ReloadEmpty
	ReloadAnims(1)=Tripod_ReloadHalf

	// ROPawn weapon specific animations
	//CHR_AnimSet=AnimSet'CHR_Playeranim_Master.Weapons.CHR_K98'

	// Firing animations
	FireAnim=Shoot
	FireLastAnim=Shoot_Last
	IdleAnim=Idle
	IdleEmptyAnim=Idle_Empty
}
