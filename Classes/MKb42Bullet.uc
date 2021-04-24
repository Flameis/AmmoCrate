//=============================================================================
// MKb42Bullet
//=============================================================================
// Bullet for the MKb42 Assault Rifle
//=============================================================================
// RO: Heroes of Stalingrad Source
// Copyright (C) 2010 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================

class MKb42Bullet extends ROBullet;

//=============================================================================
// defaultproperties
//=============================================================================

defaultproperties
{
	BallisticCoefficient=0.411
	Damage=70
	MyDamageType=class'RODmgType_MKb42Bullet'
	Speed=32300 // 646 M/S
	MaxSpeed=32300 // 646 M/S
}
