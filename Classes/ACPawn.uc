class ACpawn extends ROPawn
    abstract;

simulated event PreBeginPlay()
{
	PawnHandlerClass = class'ACPawnHandler';
	
	super.PreBeginPlay();
}