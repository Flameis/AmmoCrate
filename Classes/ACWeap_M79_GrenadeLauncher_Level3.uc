//=============================================================================
// ROWeap_M79_GrenadeLauncher_Level2
//=============================================================================
// Level 2 Content for M79 Grenade Launcher - Secondary Buckshot Round
//=============================================================================
// Rising Storm 2 Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACWeap_M79_GrenadeLauncher_Level3 extends ACWeap_M79_GrenadeLauncher_Content;

simulated function TimeWeaponEquipping()
{
	local ROPlayerController ROPC;

	super.TimeWeaponEquipping();

	ROPC = ROPlayerController(Instigator.Controller);

	if( ROPC != none )
	{
		ROPC.TriggerHint(ROHTrig_M79ShellTypes);
	}
}

// Switch between visible buckshot/grenades
simulated function SwitchVisibleAmmo()
{
	if(IsInState('SwitchingAmmo'))
	{
		if(bUsingAltAmmo)
		{
			ShowHighExplosive();
		}
		else
		{
			ShowSmoke();
		}
	}
	else
	{
		if(bUsingAltAmmo)
		{
			ShowSmoke();
		}
		else
		{
			ShowHighExplosive();
		}
	}
}

defaultproperties
{
	// ALT FIREMODE
	FiringStatesArray(ALTERNATE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTERNATE_FIREMODE)=EWFT_Custom
	WeaponProjectiles(ALTERNATE_FIREMODE)=class'ACM79GrenadeProjectileWP'
	FireInterval(ALTERNATE_FIREMODE)=0.15
	DelayedRecoilTime(ALTERNATE_FIREMODE)=0
	Spread(ALTERNATE_FIREMODE)=0.01
	NumProjectiles(ALTERNATE_FIREMODE)=1

	SecondaryRecoilMod=0.75	//0.5

	InstantHitDamage(ALTERNATE_FIREMODE)=80
	// InstantHitDamage(ALTERNATE_FIREMODE)=85
	InstantHitDamageTypes(ALTERNATE_FIREMODE)=class'RODmgType_M79GrenadeImpact'

	InitialNumPrimaryMags=6
	MaxNumPrimaryMags=6

	PrimaryAmmoClass=class'ROAmmo_40x46_M79Grenade'
	SecondaryAmmoClass=class'ROAmmo_40x46_M79Smoke'
	InitialNumSecondaryMags=1	//6
	MaxNumSecondaryMags=1		//6

	PrimaryAmmoIndex=0
	SecondaryAmmoIndex=1

	PerformAmmoSwitchPct=0.88f

	// Weapon SkeletalMesh
	Begin Object Name=FirstPersonMesh
	//Materials(0)=
	End Object

	SecondarySuppressionPower=15

	FireModeCanUseClientSideHitDetection[ALTERNATE_FIREMODE]=false

	NumHeloPenetrations=1

	SecondarySightRanges[0]=(SightRange=50,SightPitch=0,SightSlideOffset=0.0,SightPositionOffset=-0.0, AddedPitch=300)
	SecondarySightRanges[1]=(SightRange=75,SightPitch=-16384,SightSlideOffset=-0.1,SightPositionOffset=-0.35, AddedPitch=450)
	SecondarySightRanges[2]=(SightRange=100,SightPitch=-16384,SightSlideOffset=0.05,SightPositionOffset=-0.75, AddedPitch=450)
	SecondarySightRanges[3]=(SightRange=125,SightPitch=-16384,SightSlideOffset=0.27,SightPositionOffset=-1.24, AddedPitch=450)
	SecondarySightRanges[4]=(SightRange=150,SightPitch=-16384,SightSlideOffset=0.45,SightPositionOffset=-1.66, AddedPitch=500)
	SecondarySightRanges[5]=(SightRange=175,SightPitch=-16384,SightSlideOffset=0.67,SightPositionOffset=-2.2, AddedPitch=500)
	SecondarySightRanges[6]=(SightRange=200,SightPitch=-16384,SightSlideOffset=0.9,SightPositionOffset=-2.74, AddedPitch=500)
	SecondarySightRanges[7]=(SightRange=225,SightPitch=-16384,SightSlideOffset=1.2,SightPositionOffset=-3.45, AddedPitch=450)
	SecondarySightRanges[8]=(SightRange=250,SightPitch=-16384,SightSlideOffset=1.49,SightPositionOffset=-4.15, AddedPitch=450)
	SecondarySightRanges[9]=(SightRange=275,SightPitch=-16384,SightSlideOffset=1.83,SightPositionOffset=-4.93, AddedPitch=400)
	SecondarySightRanges[10]=(SightRange=300,SightPitch=-16384,SightSlideOffset=2.25,SightPositionOffset=-5.94, AddedPitch=325)
	SecondarySightRanges[11]=(SightRange=325,SightPitch=-16384,SightSlideOffset=2.7,SightPositionOffset=-7.0)
	SecondarySightRanges[12]=(SightRange=350,SightPitch=-16384,SightSlideOffset=3.3,SightPositionOffset=-8.43)
	SecondarySightRanges[13]=(SightRange=375,SightPitch=-16384,SightSlideOffset=4.3,SightPositionOffset=-9.8)

	AltFireModeType=ROAFT_SwitchAmmo
	
	PlayerIronSightFOV=60.0//55.0

	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_M79.Play_WEP_M79_Fire_Single_3P',FirstPersonCue=AkEvent'WW_WEP_M79.Play_WEP_M79_Fire_Single')
	WeaponFireSnd(ALTERNATE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_M79.Play_WEP_M79_Fire_Single_3P',FirstPersonCue=AkEvent'WW_WEP_M79.Play_WEP_M79_Fire_Single')
}
