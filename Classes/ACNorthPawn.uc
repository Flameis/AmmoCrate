class ACNorthPawn extends RONorthPawn;


simulated event PreBeginPlay()
{
	PawnHandlerClass = class'ACPawnHandler';
	
	super.PreBeginPlay();
}