//=============================================================================
// M18SmokeProjectilePurple
//=============================================================================
// M18 Purple Coloured Signal Smoke Grenade Projectile
// This smoke grenade marks artillery targets if used by the appropriate class
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACM79SignalProjectile extends ROFusedGrenadeProjectile;

var AkEvent				SmokeSound;
var AkComponent			SmokeSoundComponent;

var float 			SmokeSoundTime;
var ParticleSystemComponent SmokeEmitter;
var name 			SmokeSocketName;

var PointLightComponent FireLight;

var SkeletalMeshComponent	ProjectileMesh;

var ROVisionBlocker VisBlocker;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();

	ProjectileMesh.AttachComponentToSocket(SmokeEmitter, SmokeSocketName);
}

simulated function DoExplode()
{
	super.DoExplode();
	MarkArtyTarget();
}

simulated function MarkArtyTarget()
{
	local ROPlayerReplicationInfo ROPRI;
	local ROPlayerController ROPC;
	local ROAIController ROAIC;

	if( InstigatorController == none )
	{
		return;
	}

	ROPC = ROPlayerController(InstigatorController);
	ROPRI = ROPlayerReplicationInfo(ROPC.PlayerReplicationInfo);

	if( ROPC != none && ROPRI != none && ROPC.GetTeamNum() == `ALLIES_TEAM_INDEX )
	{
		ROPC.AttemptServerSaveArtilleryRequestPosition(Location, 128 + `MAX_SQUADS);

		// CLBIT-5980
		ROPC.ClientSetArtyMarkStatusBits(0);
	}
	else if (Role == ROLE_Authority)
	{
		ROAIC = ROAIController(InstigatorController);
		ROPRI = ROPlayerReplicationInfo(ROAIC.PlayerReplicationInfo);
		if (ROAIC != none && ROPRI != none)
		{
			ROAIC.AISaveSaveArtilleryRequestPosition(Location, ROPRI.SquadIndex);
		}
	}
}

defaultproperties
{
	bAlwaysRelevant=true

	BallisticCoefficient=1.0
	AccelRate = 1.0

	MomentumTransfer=1
	Speed=3800 // 76 M/S
	MaxSpeed=3800	// 76 M/S

	ImpactDamage=200//85
	MyImpactDamageType=class'RODmgType_M79Smoke'

	LifeSpan=60
	SmokeSoundTime=35.0

	FuseTime=4.5f

	//DampenFactor=0.4
	//DampenFactorParallel=0.5

	ProjExplosionTemplate=ParticleSystem'FX_VN_Smoke.FX_VN_SignalSmoke_Purple'
	WaterExplosionTemplate=ParticleSystem'FX_VN_Impacts.Water.FX_VN_40mm_Water'
	ExplosionSound=AkEvent'WW_WEP_M8_Smoke.Play_EXP_M8_Ignite'
	//AmbientSound=AkEvent'AUD_VN_EXP_Launcher_M79.Fire_3P.Launcher_M79_Projectile_Cue'
	SmokeSound=AkEvent'WW_WEP_M8_Smoke.Play_EXP_M8_Smoke_Release'

	ExplosionLightClass=none//class'ROGame.RORifleMuzzleFlashLight'

	/*Begin Object Class=StaticMeshComponent Name=ProjectileMesh
		StaticMesh=StaticMesh'WP_VN_3rd_Projectile.Mesh.M79_Projectile'
		MaxDrawDistance=5000
		CollideActors=true
		CastShadow=false
		LightEnvironment=MyLightEnvironment
		BlockActors=false
		BlockZeroExtent=true
		BlockNonZeroExtent=true
		BlockRigidBody=false // Must be false to avoid serious collision issues!
		Scale=1
	End Object
	Components.Add(ProjectileMesh)*/

	SmokeSocketName=smoke

	Begin Object Name=CollisionCylinder
		CollisionRadius=4
		CollisionHeight=4
		AlwaysLoadOnClient=True
		AlwaysLoadOnServer=True
		CollideActors=true
	End Object

	Begin Object class=SkeletalMeshComponent Name=ProjMesh
		SkeletalMesh=SkeletalMesh'WP_VN_3rd_Projectile.Mesh.M79_Smoke_Projectile'
		PhysicsAsset=PhysicsAsset'WP_VN_3rd_Projectile.Phy.M79_Projectile_Physics'
		RBChannel=RBCC_GameplayPhysics
		RBCollideWithChannels=(Default=TRUE,GameplayPhysics=TRUE,EffectPhysics=TRUE)
		LightEnvironment=MyLightEnvironment
		CastShadow=false
		CollideActors=true
		BlockActors=false
		BlockZeroExtent=true
		BlockNonZeroExtent=true
		BlockRigidBody=false
		bHasPhysicsAssetInstance=true
		PhysicsWeight=1.0
		bForceDiscardRootMotion=true
		bUseSingleBodyPhysics=1
		bSyncActorLocationToRootRigidBody=true
		bDisablePerObjectShadows=true
		MaxDrawDistance=2500
	End Object
	ProjectileMesh=ProjMesh
	Components.Add(ProjMesh)

	Begin Object Class=ParticleSystemComponent name=SmokePSC
		Template=ParticleSystem'FX_VN_Smoke.FX_VN_SignalSmoke_Purple'
		bAutoActivate=false
		TranslucencySortPriority=1
	End Object
	SmokeEmitter=SmokePSC
	Components.Add(SmokePSC)

	Begin Object Class=AkComponent name=SmokeSoundComponent0
		bStopWhenOwnerDestroyed=true
	End Object
	SmokeSoundComponent=SmokeSoundComponent0
	Components.Add(SmokeSoundComponent0)

	ImpactSounds[0]=(MaterialType=EMT_Default,Sound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Dirt')
	ImpactSounds[1]=(MaterialType=EMT_Rock,Sound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Concrete')
	ImpactSounds[2]=(MaterialType=EMT_Dirt,Sound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Dirt')
	ImpactSounds[3]=(MaterialType=EMT_Metal,Sound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Concrete')
	ImpactSounds[4]=(MaterialType=EMT_Wood,Sound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Wood')
	ImpactSounds[5]=(MaterialType=EMT_Asphalt,Sound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Concrete')
	ImpactSounds[6]=(MaterialType=EMT_RedBrick,Sound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Concrete')
	ImpactSounds[7]=(MaterialType=EMT_WhiteBrick,Sound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Concrete')
	ImpactSounds[8]=(MaterialType=EMT_Plant,Sound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Dirt')
	ImpactSounds[9]=(MaterialType=EMT_HollowMetal,Sound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Concrete')
	ImpactSounds[10]=(MaterialType=EMT_HollowWood,Sound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Wood')
	ImpactSounds[11]=(MaterialType=EMT_Mud,Sound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Dirt')
	ImpactSounds[12]=(MaterialType=EMT_Snow,Sound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Dirt')
	ImpactSounds[13]=(MaterialType=EMT_Water,Sound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Dirt')
	ImpactSounds[14]=(MaterialType=EMT_ShallowWater,Sound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Dirt')
	ImpactSounds[15]=(MaterialType=EMT_Gravel,Sound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Dirt')
	ImpactSounds[16]=(MaterialType=EMT_Plaster,Sound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Concrete')
	ImpactSounds[17]=(MaterialType=EMT_Concrete,Sound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Concrete')
	ImpactSounds[18]=(MaterialType=EMT_Poop,Sound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Dirt')
	ImpactSounds[19]=(MaterialType=EMT_Plastic,Sound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Concrete')
	ImpactSounds[20]=(MaterialType=EMT_Clay,Sound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Dirt')

	DefaultImpactSound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Bounce_Dirt'

	SpottedBattleChatterIndex=-1
}