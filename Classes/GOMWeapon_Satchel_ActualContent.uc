
class GOMWeapon_Satchel_ActualContent extends GOMWeapon_Satchel;

DefaultProperties
{
	ArmsAnimSet=AnimSet'GOM3_WP_VN_NVA_SATCHEL.Anim.WP_SatchelHands'
	
	Begin Object Name=FirstPersonMesh
		DepthPriorityGroup=SDPG_Foreground
		SkeletalMesh=SkeletalMesh'GOM3_WP_VN_NVA_SATCHEL.Mesh.SOV_3kg_Satchel'
		PhysicsAsset=None
		AnimSets(0)=AnimSet'GOM3_WP_VN_NVA_SATCHEL.Anim.WP_SatchelHands'
		AnimTreeTemplate=AnimTree'GOM3_WP_VN_NVA_SATCHEL.Anim.Sov_Satchel_Tree'
		Scale=1.0
		FOV=70
	End Object
	
	Begin Object Name=PickupMesh
		SkeletalMesh=SkeletalMesh'GOM3_WP_VN_NVA_SATCHEL.Mesh.SOV_3kg_Satchel_3rd'
		PhysicsAsset=PhysicsAsset'GOM3_WP_VN_NVA_SATCHEL.Phy.SOV_3kg_Satchel_3rd_Physics'
		CollideActors=true
		BlockActors=true
		BlockZeroExtent=true
		BlockNonZeroExtent=true//false
		BlockRigidBody=true
		bHasPhysicsAssetInstance=false
		bUpdateKinematicBonesFromAnimation=false
		PhysicsWeight=1.0
		RBChannel=RBCC_GameplayPhysics
		RBCollideWithChannels=(Default=TRUE,GameplayPhysics=TRUE,EffectPhysics=TRUE)
		bSkipAllUpdateWhenPhysicsAsleep=TRUE
		bSyncActorLocationToRootRigidBody=true
	End Object
	
	AttachmentClass=class'GOMWeapon_Satchel_Attach'
}
