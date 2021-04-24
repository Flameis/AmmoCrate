
class GOMWeapon_Satchel_Attach extends ROWeaponAttachmentSatchel;

DefaultProperties
{
	ThirdPersonHandsAnim=Soviet_Satchel_HandPose
	IKProfileName=F1
	
	Begin Object Name=SkeletalMeshComponent0
		SkeletalMesh=SkeletalMesh'GOM3_WP_VN_NVA_SATCHEL.Mesh.SOV_3kg_Satchel_3rd'
		PhysicsAsset=PhysicsAsset'GOM3_WP_VN_NVA_SATCHEL.Phy.SOV_3kg_Satchel_3rd_Bounds'
		CullDistance=5000
	End Object
	
	WeaponClass=class'GOMWeapon_Satchel'
}
