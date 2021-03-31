//=============================================================================
// ROWeap_M79_GrenadeLauncher
//=============================================================================
// M79 40mm "Thumper" Grenade Launcher
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACWeap_M79_GrenadeLauncher extends ROProjectileWeapon
	  abstract;

// Bone names for hiding during ammo switch
var name HEBoneNames[2];
var name BuckshotBoneNames[2];
var name SmokeBoneNames[2];

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	super.PostInitAnimTree(SkelComp);

	SkelComp.ForceSkelUpdate();
	// Always start by showing the HE rounds. We'll swap later when the ammo does, if required. If we don't do this here, we will spawn with BOTH sets of shells visible
	SwitchVisibleAmmo();
}

simulated function bool ShouldFireFromMuzzleLocation()	// always true!
{
	return Instigator.IsHumanControlled() ? true : super.ShouldFireFromMuzzleLocation();
}

// Show correct ammo
simulated function SetAltAmmoLoadout(byte LoadoutIndex)
{
	super.SetAltAmmoLoadout(LoadoutIndex);

	SwitchVisibleAmmo();
}

simulated exec function SwitchFireMode()
{
	// disallow
}

// subclass this
simulated function SwitchVisibleAmmo()
{
	ShowHighExplosive();
};

// Hide other bones
simulated function ShowHighExplosive()
{
	SkeletalMeshComponent(Mesh).UnHideBoneByName(HEBoneNames[0]);
	SkeletalMeshComponent(Mesh).UnHideBoneByName(HEBoneNames[1]);
	SkeletalMeshComponent(Mesh).HideBoneByName(BuckshotBoneNames[0],PBO_None);
	SkeletalMeshComponent(Mesh).HideBoneByName(BuckshotBoneNames[1],PBO_None);
	SkeletalMeshComponent(Mesh).HideBoneByName(SmokeBoneNames[0],PBO_None);
	SkeletalMeshComponent(Mesh).HideBoneByName(SmokeBoneNames[1],PBO_None);
}

// Hide other bones
simulated function ShowBuckshot()
{
	SkeletalMeshComponent(Mesh).UnHideBoneByName(BuckshotBoneNames[0]);
	SkeletalMeshComponent(Mesh).UnHideBoneByName(BuckshotBoneNames[1]);
	SkeletalMeshComponent(Mesh).HideBoneByName(HEBoneNames[0],PBO_None);
	SkeletalMeshComponent(Mesh).HideBoneByName(HEBoneNames[1],PBO_None);
	SkeletalMeshComponent(Mesh).HideBoneByName(SmokeBoneNames[0],PBO_None);
	SkeletalMeshComponent(Mesh).HideBoneByName(SmokeBoneNames[1],PBO_None);
}

// Hide other bones
simulated function ShowSmoke()
{
	SkeletalMeshComponent(Mesh).UnHideBoneByName(SmokeBoneNames[0]);
	SkeletalMeshComponent(Mesh).UnHideBoneByName(SmokeBoneNames[1]);
	SkeletalMeshComponent(Mesh).HideBoneByName(BuckshotBoneNames[0],PBO_None);
	SkeletalMeshComponent(Mesh).HideBoneByName(BuckshotBoneNames[1],PBO_None);
	SkeletalMeshComponent(Mesh).HideBoneByName(HEBoneNames[0],PBO_None);
	SkeletalMeshComponent(Mesh).HideBoneByName(HEBoneNames[1],PBO_None);
}

function ConsumeAmmo( byte FireModeNum )
{
	// Subtract the Ammo
	AddAmmo(-1);

	if( AmmoArray.Length > 0 && (ROInventoryManager(InvManager) == none || !ROInventoryManager(InvManager).bInfiniteAmmo) )
	{
		AmmoArray.Remove((AmmoArray.Length - 1), 1);
		CurrentMagCount = AmmoArray.Length;

		// Remove the clip from encumbrance calculations
		if ( ROPawn(Instigator) != none )
		{
			ROPawn(Instigator).ModifyEncumbrance(-1 * AmmoClass.default.Weight, self);
		}

		// Remove the clip from the category limitations
		if ( ROInventoryManager(Instigator.InvManager) != none )
		{
			ROInventoryManager(Instigator.InvManager).CategoryCounts[ROIC_Ammo] -= 1.0 / AmmoClass.default.ClipsPerSlot;
		}
	}
}

function PerformMagazineReload()
{
	if( AmmoArray.Length == 0 || CurrentReloadStatus == RORS_OpeningBolt || CurrentReloadStatus == RORS_ClosingBolt )
	{
		return;
	}

	// We're done reloading
	CurrentReloadStatus = RORS_Complete;

 	if( AmmoArray.Length > 0 )
	{
		// Select another mag as our current mag index
		CurrentMagIndex = GetNextMagIndex(true);

		SetAmmo(AmmoArray[CurrentMagIndex]);
		CurrentMagCount = AmmoArray.Length;
	}
}

// Enable recoil when firing grenades
simulated function Projectile ProjectileFire()
{
	// Alt fire for this weapon uses EWFT_Custom, so already applies recoil. Lets not double up!
	if( Instigator.IsFirstPerson() && CurrentFireMode == DEFAULT_FIREMODE)
	{
		HandleRecoil();
	}

	return super.ProjectileFire();
}

simulated state WeaponEquipping
{
	simulated function BeginState(Name PreviousStateName)
	{
		local ROPlayerController ROPC;
		super.BeginState(PreviousStateName);

		ROPC = ROPlayerController(Instigator.Controller);

		if ( ROPC != none )
		{
			ROPC.TriggerHint(ROHTrig_M79);
		}
	}
}

defaultproperties
{
	WeaponContentClass(0)="AmmoCrate.ACWeap_M79_GrenadeLauncher_Content" // HE Only

	AmmoContentClassStart=0
	// Class below here are available only through selecting alternative ammo loadouts
	WeaponContentClass(1)="ROGameContent.ROWeap_M79_GrenadeLauncher_Level2"	// HE + Smoke
	WeaponContentClass(2)="AmmoCrate.ACWeap_M79_GrenadeLauncher_Level3" // HE + WP
	RoleSelectionImage(0)=Texture2D'VN_UI_Textures.WeaponTex.US_Weap_M79_GrenadeLauncher'
	RoleSelectionImage(1)=Texture2D'VN_UI_Textures.WeaponTex.US_Weap_M79_GrenadeLauncher'
	RoleSelectionImage(2)=Texture2D'VN_UI_Textures.WeaponTex.US_Weap_M79_GrenadeLauncher'
	
	// HE and Buckshot mixture
	AltAmmoLoadouts(0)=(WeaponContentClassIndex=1)
	// HE and WP mixture
	AltAmmoLoadouts(1)=(WeaponContentClassIndex=2)

	WeaponClassType=ROWCT_Explosive
	TeamIndex=`ALLIES_TEAM_INDEX

	Category=ROIC_Primary 	//ROIC_Primary
	Weight=2.7         		//KG
	InvIndex=`ROII_M79_GrenadeLauncher
	InventoryWeight=3

	PlayerIronSightFOV=50.0//55.0

	// MAIN FIREMODE
	FiringStatesArray(0)=WeaponSingleFiring
	WeaponFireTypes(0)=EWFT_Projectile
	WeaponProjectiles(0)=class'M79GrenadeProjectile'
	FireInterval(0)=0.15
	DelayedRecoilTime(0)=0.0
	Spread(0)=0.001 // 36 MOA
	WeaponDryFireSnd=AkEvent'WW_WEP_Shared.Play_WEP_Generic_Dry_Fire'

	// ALT FIREMODE
	FiringStatesArray(ALTERNATE_FIREMODE)=none
	WeaponFireTypes(ALTERNATE_FIREMODE)=EWFT_Custom
	WeaponProjectiles(ALTERNATE_FIREMODE)=none
	FireInterval(ALTERNATE_FIREMODE)=0.15
	DelayedRecoilTime(ALTERNATE_FIREMODE)=0.01
	Spread(ALTERNATE_FIREMODE)=0.01

	PreFireTraceLength=1250 //25 Metres

	//ShoulderedSpreadMod=1.0
	//HippedSpreadMod=1.0

	// AI
	MinBurstAmount=1
	MaxBurstAmount=1
	//BurstWaitTime=1.0
	//AILongDistanceScale=1.25f
	//AIMediumDistanceScale=0.5f
	//AISpreadScale=200.0
	//AISpreadNoSeeScale=2.0
	//AISpreadNMEStillScale=0.5
	//AISpreadNMESprintScale=1.5

   	// Recoil
	maxRecoilPitch=1700
	minRecoilPitch=1700
	maxRecoilYaw=800
	minRecoilYaw=200
	RecoilRate=0.12
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=2000
	RecoilMinPitchLimit=63535
	RecoilISMaxYawLimit=500
	RecoilISMinYawLimit=65035
	RecoilISMaxPitchLimit=1500
	RecoilISMinPitchLimit=64035

	InstantHitDamage(0)=0
	InstantHitDamage(1)=0

	InstantHitDamageTypes(0)=none
	InstantHitDamageTypes(1)=none

	MuzzleFlashSocket=MuzzleFlashSocket
	MuzzleFlashPSCTemplate=ParticleSystem'FX_VN_Weapons.MuzzleFlashes.FX_VN_MuzzleFlash_3rdP_Rifles_round'
	MuzzleFlashDuration=0.33
	MuzzleFlashLightClass=class'ROGame.RORifleMuzzleFlashLight'

	// Shell eject FX
	ShellEjectSocket=ShellEjectSocket
	ShellEjectPSCTemplate=ParticleSystem'FX_VN_Weapons.ShellEjects.FX_Wep_A_ShellEject_PhysX_USA_M79Shell'
	bNoShellEjectOnFire=true

	bHasIronSights=true;
	bHasManualBolting=false;

	//Equip and putdown
	WeaponPutDownAnim=M79_Putaway
	WeaponEquipAnim=M79_Pullout
	WeaponDownAnim=M79_Down
	WeaponUpAnim=M79_Up

	// Fire Anims
	//Hip fire
   	WeaponFireAnim(0)=M79_Shoot
	WeaponFireAnim(1)=M79_Shoot
	WeaponFireLastAnim=M79_Shoot
	//Shouldered fire
	WeaponFireShoulderedAnim(0)=M79_Shoot
	WeaponFireShoulderedAnim(1)=M79_Shoot
	WeaponFireLastShoulderedAnim=M79_Shoot
	//Fire using iron sights
   	WeaponFireSightedAnim(0)=M79_Iron_Shoot
	WeaponFireSightedAnim(1)=M79_Iron_Shoot
	WeaponFireLastSightedAnim=M79_Iron_Shoot

	// Idle Anims
	// Hip Idle
   	WeaponIdleAnims(0)=M79_Shoulder_Idle
	WeaponIdleAnims(1)=M79_Shoulder_Idle
	// Shouldered idle
	WeaponIdleShoulderedAnims(0)=M79_Shoulder_Idle
	WeaponIdleShoulderedAnims(1)=M79_Shoulder_Idle
	// Sighted Idle
	WeaponIdleSightedAnims(0)=M79_Iron_Idle
	WeaponIdleSightedAnims(1)=M79_Iron_Idle

	// Prone Crawl
	WeaponCrawlingAnims(0)=M79_CrawlF
	WeaponCrawlStartAnim=M79_Crawl_into
	WeaponCrawlEndAnim=M79_Crawl_out

	//Reloading
	WeaponReloadEmptyMagAnim=M79_Reload
	WeaponReloadNonEmptyMagAnim=M79_Reload
	WeaponRestReloadEmptyMagAnim=M79_Reload
	WeaponRestReloadNonEmptyMagAnim=M79_Reload
	// Ammo check
	WeaponAmmoCheckAnim=M79_ammocheck
	WeaponRestAmmoCheckAnim=M79_Ammocheck_rest

	// Ammo Switch
	WeaponAmmoSwitchEmptyMagAnim=M79_Reload
	WeaponAmmoSwitchNonEmptyMagAnim=M79_Reload
	WeaponRestAmmoSwitchEmptyMagAnim=M79_Reload
	WeaponRestAmmoSwitchNonEmptyMagAnim=M79_Reload

	// Sprinting
	WeaponSprintStartAnim=M79_sprint_into
	WeaponSprintLoopAnim=M79_Sprint
	WeaponSprintEndAnim=M79_sprint_out
	Weapon1HSprintStartAnim=M79_1H_sprint_into
	Weapon1HSprintLoopAnim=M79_1H_Sprint
	Weapon1HSprintEndAnim=M79_1H_sprint_out

	// Mantling
	WeaponMantleOverAnim=M79_Mantle

	// Cover/Blind Fire Anims
	WeaponRestAnim=M79_rest_idle
	WeaponEquipRestAnim=M79_pullout_rest
	WeaponPutDownRestAnim=M79_putaway_rest
	WeaponBlindFireRightAnim=M79_BF_Right_Shoot
	WeaponBlindFireLeftAnim=M79_BF_Left_Shoot
	WeaponBlindFireUpAnim=M79_BF_up_Shoot
	WeaponIdleToRestAnim=M79_idleTOrest
	WeaponRestToIdleAnim=M79_restTOidle
	WeaponRestToBlindFireRightAnim=M79_restTOBF_Right
	WeaponRestToBlindFireLeftAnim=M79_restTOBF_Left
	WeaponRestToBlindFireUpAnim=M79_restTOBF_up
	WeaponBlindFireRightToRestAnim=M79_BF_Right_TOrest
	WeaponBlindFireLeftToRestAnim=M79_BF_Left_TOrest
	WeaponBlindFireUpToRestAnim=M79_BF_up_TOrest
	WeaponBFLeftToUpTransAnim=M79_BFleft_toBFup
	WeaponBFRightToUpTransAnim=M79_BFright_toBFup
	WeaponBFUpToLeftTransAnim=M79_BFup_toBFleft
	WeaponBFUpToRightTransAnim=M79_BFup_toBFright
	// Blind Fire ready
	WeaponBF_Rest2LeftReady=M79_restTO_L_ready
	WeaponBF_LeftReady2LeftFire=M79_L_readyTOBF_L
	WeaponBF_LeftFire2LeftReady=M79_BF_LTO_L_ready
	WeaponBF_LeftReady2Rest=M79_L_readyTOrest
	WeaponBF_Rest2RightReady=M79_restTO_R_ready
	WeaponBF_RightReady2RightFire=M79_R_readyTOBF_R
	WeaponBF_RightFire2RightReady=M79_BF_RTO_R_ready
	WeaponBF_RightReady2Rest=M79_R_readyTOrest
	WeaponBF_Rest2UpReady=M79_restTO_Up_ready
	WeaponBF_UpReady2UpFire=M79_Up_readyTOBF_Up
	WeaponBF_UpFire2UpReady=M79_BF_UpTO_Up_ready
	WeaponBF_UpReady2Rest=M79_Up_readyTOrest
	WeaponBF_LeftReady2Up=M79_L_ready_toUp_ready
	WeaponBF_LeftReady2Right=M79_L_ready_toR_ready
	WeaponBF_UpReady2Left=M79_Up_ready_toL_ready
	WeaponBF_UpReady2Right=M79_Up_ready_toR_ready
	WeaponBF_RightReady2Up=M79_R_ready_toUp_ready
	WeaponBF_RightReady2Left=M79_R_ready_toL_ready
	WeaponBF_LeftReady2Idle=M79_L_readyTOidle
	WeaponBF_RightReady2Idle=M79_R_readyTOidle
	WeaponBF_UpReady2Idle=M79_Up_readyTOidle
	WeaponBF_Idle2UpReady=M79_idleTO_Up_ready
	WeaponBF_Idle2LeftReady=M79_idleTO_L_ready
	WeaponBF_Idle2RightReady=M79_idleTO_R_ready

	// Enemy Spotting
	WeaponSpotEnemyAnim=M79_SpotEnemy
	WeaponSpotEnemySightedAnim=M79_SpotEnemy_ironsight

	// Melee anims
	WeaponMeleeAnims(0)=M79_Bash
	WeaponMeleeHardAnim=M79_BashHard
	MeleePullbackAnim=M79_Pullback
	MeleeHoldAnim=M79_Pullback_Hold

	EquipTime=+0.66//1.00

	bDebugWeapon = false

  	BoltControllerNames[0]=BoltSlide_Kar98

	ISFocusDepth=23

	// Ammo
	MaxAmmoCount=1
	AmmoClass=class'ROAmmo_40x46_M79Grenade'
	bUsesMagazines=true
	InitialNumPrimaryMags=9
	MaxNumPrimaryMags=9
	bLosesRoundOnReload=false
	bPlusOneLoading=false
	bCanReloadNonEmptyMag=false
	bCanLoadStripperClip=false
	bCanLoadSingleBullet=false
	PenetrationDepth=10
	MaxPenetrationTests=3
	MaxNumPenetrations=1

	PlayerViewOffset=(X=7.5,Y=4.5,Z=-1.75)
	ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)

	ShoulderedPosition=(X=6.5,Y=2.0,Z=-1.0)

	IronSightPosition=(X=-2,Y=0,Z=-0.05)

	bUsesFreeAim=true

	ZoomInTime=0.3//0.35
	ZoomOutTime=0.25//0.3

	// Free Aim variables
	FreeAimHipfireOffsetX=25

	Begin Object Class=ForceFeedbackWaveform Name=ForceFeedbackWaveformShooting1
		Samples(0)=(LeftAmplitude=30,RightAmplitude=50,LeftFunction=WF_Constant,RightFunction=WF_Constant,Duration=0.200)
	End Object
	WeaponFireWaveForm=ForceFeedbackWaveformShooting1

	CollisionCheckLength=36.55

	FireCameraAnim[0]=CameraAnim'1stperson_Cameras.Anim.Camera_KAR98_Shoot'
	FireCameraAnim[1]=CameraAnim'1stperson_Cameras.Anim.Camera_KAR98_Shoot'

	SightSlideControlName=Sight_Slide
	SightRotControlName=Sight_Rotation

	SightRanges[0]=(SightRange=50,SightPitch=0,SightSlideOffset=0.0,SightPositionOffset=-0.0, AddedPitch=300)
	SightRanges[1]=(SightRange=75,SightPitch=-16384,SightSlideOffset=-0.1,SightPositionOffset=-0.35, AddedPitch=450)
	SightRanges[2]=(SightRange=100,SightPitch=-16384,SightSlideOffset=0.05,SightPositionOffset=-0.75, AddedPitch=450)
	SightRanges[3]=(SightRange=125,SightPitch=-16384,SightSlideOffset=0.27,SightPositionOffset=-1.24, AddedPitch=450)
	SightRanges[4]=(SightRange=150,SightPitch=-16384,SightSlideOffset=0.45,SightPositionOffset=-1.66, AddedPitch=500)
	SightRanges[5]=(SightRange=175,SightPitch=-16384,SightSlideOffset=0.67,SightPositionOffset=-2.2, AddedPitch=500)
	SightRanges[6]=(SightRange=200,SightPitch=-16384,SightSlideOffset=0.9,SightPositionOffset=-2.74, AddedPitch=500)
	SightRanges[7]=(SightRange=225,SightPitch=-16384,SightSlideOffset=1.2,SightPositionOffset=-3.45, AddedPitch=450)
	SightRanges[8]=(SightRange=250,SightPitch=-16384,SightSlideOffset=1.49,SightPositionOffset=-4.15, AddedPitch=450)
	SightRanges[9]=(SightRange=275,SightPitch=-16384,SightSlideOffset=1.83,SightPositionOffset=-4.93, AddedPitch=400)
	SightRanges[10]=(SightRange=300,SightPitch=-16384,SightSlideOffset=2.25,SightPositionOffset=-5.94, AddedPitch=325)
	// Do we really want to go below here?
	// SightRanges[11]=(SightRange=325,SightPitch=-16384,SightSlideOffset=2.7,SightPositionOffset=-7.0)
	// SightRanges[12]=(SightRange=350,SightPitch=-16384,SightSlideOffset=3.3,SightPositionOffset=-8.43)
	// SightRanges[13]=(SightRange=375,SightPitch=-16384,SightSlideOffset=4.3,SightPositionOffset=-9.8)

	SuppressionPower=20

	FireModeCanUseClientSideHitDetection[DEFAULT_FIREMODE]=false

	bNoAccuracyStat=true

	SwayScale=0.9//1.08

	HEBoneNames(0)=Grenade
	HEBoneNames(1)=Grenade_Casing
	BuckshotBoneNames(0)=Buckshot
	BuckshotBoneNames(1)=Buckshot_Casing
	SmokeBoneNames(0)=SmokeGrenade
	SmokeBoneNames(1)=SmokeGrenade_Casing

	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_M79.Play_WEP_M79_Fire_Single_3P',FirstPersonCue=AkEvent'WW_WEP_M79.Play_WEP_M79_Fire_Single')
	WeaponFireSnd(ALTERNATE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_M79.Play_WEP_M79_Fire_Single_3P',FirstPersonCue=AkEvent'WW_WEP_M79.Play_WEP_M79_Fire_Single')

	bSyncSightRangeIndex = true
}