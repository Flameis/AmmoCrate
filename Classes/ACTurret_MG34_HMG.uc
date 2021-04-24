//=============================================================================
// ROTurret_DShK_HMG
//=============================================================================
// DShK Heavy Machine Gun deployed on a Tripod
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACTurret_MG34_HMG extends ROTurret
	placeable;

/** Limit, in rotator units, of how far from center the turret can rotate down while ducking */
var() float DuckedAimPitchMin;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();

	EntryActor.SetRelativeLocation( vect(-25, 0, 20) );
}

simulated function UnHideBulletsNotify()
{
	ROWeap_DShK_HMG_Tripod(MyWeapon).UnHideBulletsNotify();
}

simulated function TurretClampPitch(out int out_Pitch)
{
	local int	DeltaFromCenter, PitchAdj, UsedPitchMin;

	UsedPitchMin = bIsDriverDucking ? DuckedAimPitchMin : PitchLimit.X;
	// UsedPitchMin = PitchLimit.X;

	DeltaFromCenter = NormalizeRotAxis(out_Pitch - Rotation.Pitch);

	if ( DeltaFromCenter > PitchLimit.Y )
	{
		PitchAdj = PitchLimit.Y - DeltaFromCenter;
	}
	else if ( DeltaFromCenter < UsedPitchMin )
	{
		PitchAdj = -(DeltaFromCenter - UsedPitchMin);
	}

	out_Pitch += PitchAdj;
}

defaultproperties
{
	OwningTeam=`AXIS_TEAM_INDEX

	bCollideActors=false
	
	// limits
	DuckedAimPitchMin=-0

	CameraLagTime=0.1 //0.10
	CameraLagIronSightsTime=0.05 //0.03
	WeaponInterpSpeed=10.f//2.f //7.f

	// limits
	bhasYawLimit=true
	YawLimit=(X=-6000,Y=6000)
	PitchLimit=(X=-1024,Y=2000)

	Begin Object Name=WeaponSkeletalMeshComponent
		SkeletalMesh=SkeletalMesh'WP_Ger_MG34_Tripod.Mesh.MG34_Tripod_3rd_Master'
		AnimTreeTemplate=AnimTree'WP_Ger_MG34_Tripod.animation.MG34TurretAnimtree'
		AnimSets(0)=AnimSet'WP_Ger_MG34_Tripod.animation.Tripod_3rd_anim'
		PhysicsAsset=PhysicsAsset'WP_VN_3rd_Master.Phy.DShK_HMG_3rd_Master_Physics'
	End Object

	Begin Object Name=CollisionCylinder
		CollisionHeight=35.000000
		CollisionRadius=25.000000 // Adjusting this makes the Use area larger, but also blocks pawns from getting close to it(tough balance)
		Translation=(X=32,Z=-26)
	End Object

	WeaponFireCorrection=(Pitch=-155)

	DefaultInventoryContentClass(0)="AmmoCrate.ACWeap_MG34_Tripod_Content"

	RootBoneName=ROOTBONE
	PivotBoneName=Tripod_Brace_Yaw
	AttachSocketName=AttachSocket
	PlayerRefSocketName=PlayerRef
	CameraSocketName=PlayerCam
	CamPivotSocketName=PlayerCamPivot
	IronSightsCameraSocketName=PlayerCamIS
	IronSightsCamPivotSocketName=PlayerCamPivotIS
	DuckedCameraSocketName=PlayerCamDuck
	LeftHandBoneHandleName=LefthandHand01
	RightHandBoneHandleName=RightHand
	ChestIKSocketName=ChestIKStand
	DuckedChestSocketName=ChestIKDuck
	MuzzleFlashSocket=MuzzleFlashSocket

	// Player animations - These are found in the player mesh animsets. Specifically, CHR_Tripod_Anim or similar
	MoveToAnim=Tripod_goto_MG34
	DismountAnim=Tripod_getoff_MG34
	StandingAnim=Tripod_idle_MG34
	DuckingAnim=Tripod_Duck_Idle_MG34
}
