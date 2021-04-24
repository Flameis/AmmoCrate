//=============================================================================
// GOMWeapon_Satchel.uc
//=============================================================================
// North Vietnamese Army Satchel Charge.
//=============================================================================
// Gameplay Overhaul Mutator for Rising Storm 2: Vietnam
// Authored by SgtJoe
//=============================================================================

class GOMWeapon_Satchel extends ROSatchelChargeWeapon
	abstract;

defaultproperties
{
	WeaponContentClass(0)="AmmoCrate.GOMWeapon_Satchel_ActualContent"
	
	RoleSelectionImage(0)=Texture2D'GOM3_UI.WP_Render.WP_Render_Satchel'
	
	InvIndex=92
	bIsModWeapon=true
	
	FuzeLength=5.0
	
	AmmoClass=class'ROAmmo_SatchelCharge'
	
	WeaponProjectiles(0)=class'ROSatchelChargeProjectile'
	
	ThrowingBattleChatterIndex=`BATTLECHATTER_ThrowingGrenade
}
