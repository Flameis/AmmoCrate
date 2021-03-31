class ACPlayerController extends ROPlayerController;

simulated function PreBeginPlay()
{
    super.PreBeginPlay();

    if (WorldInfo.NetMode == NM_Standalone || Role == ROLE_Authority)
    {
        ReplaceRoles();
        ReplaceInventoryManager();
    }
}

/*
simulated function PostBeginPlay()
{
    local ROMapInfo ROMI;
    local RORoleCount RORC;

    `log("ACPlayerController.PostBeginPlay()");

    super.PostBeginPlay();

    ROMI = ROMapInfo(WorldInfo.GetMapInfo());

    ForEach ROMI.NorthernRoles(RORC)
    {
        `log("RoleInfoClass = " $ RORC.RoleInfoClass);
    }

    ForEach ROMI.SouthernRoles(RORC)
    {
        `log("RoleInfoClass = " $ RORC.RoleInfoClass);
    }
}
*/

simulated function ReceivedGameClass(class<GameInfo> GameClass)
{
    super.ReceivedGameClass(GameClass);

    ReplaceRoles();
    ReplaceInventoryManager();
}

simulated function ReplaceInventoryManager()
{
    ROPawn(Pawn).InventoryManagerClass = class'ACInventoryManager';
}

simulated function ReplaceRoles()
{
    local ROMapInfo ROMI;
    local RORoleCount RORC;
    local int I;

    ROMI = ROMapInfo(WorldInfo.GetMapInfo());

    if (ROMI != None)
    {
        `log("Replacing roles...");

        I = 0;
        ForEach ROMI.NorthernRoles(RORC)
        {
            if (RORC.RoleInfoClass == class'RORoleInfoNorthernRadioman')
            {
                ROMI.NorthernRoles[I].RoleInfoClass = class'ACRoleInfoNorthernSupport';
				ROMI.NorthernRoles[I].Count =(255);
                `log("Replaced RoleInfoClass " $ RORC.RoleInfoClass);
            }
			if (RORC.RoleInfoClass == class'RORoleInfoNorthernRadiomanNLF')
            {
                ROMI.NorthernRoles[I].RoleInfoClass = class'ACRoleInfoNorthernSupport';
				ROMI.NorthernRoles[I].Count =(255);
                `log("Replaced RoleInfoClass " $ RORC.RoleInfoClass);
            }
            I++;
        }

        I = 0;
        ForEach ROMI.SouthernRoles(RORC)
        {
            if (RORC.RoleInfoClass == class'RORoleInfoSouthernRadioman')
            {
                ROMI.SouthernRoles[I].RoleInfoClass = class'ACRoleInfoSouthernSupport';
				ROMI.SouthernRoles[I].Count =(255);
                `log("Replaced RoleInfoClass " $ RORC.RoleInfoClass);
            }
			if (RORC.RoleInfoClass == class'RORoleInfoSouthernRadiomanARVN')
            {
                ROMI.SouthernRoles[I].RoleInfoClass = class'ACRoleInfoSouthernSupport';
				ROMI.SouthernRoles[I].Count =(255);
                `log("Replaced RoleInfoClass " $ RORC.RoleInfoClass);
            }
			if (RORC.RoleInfoClass == class'RORoleInfoSouthernRadiomanAUS')
            {
                ROMI.SouthernRoles[I].RoleInfoClass = class'ACRoleInfoSouthernSupport';
				ROMI.SouthernRoles[I].Count =(255);
                `log("Replaced RoleInfoClass " $ RORC.RoleInfoClass);
            }
			if (RORC.RoleInfoClass == class'RORoleInfoSouthernRadiomanUSMC')
            {
                ROMI.SouthernRoles[I].RoleInfoClass = class'ACRoleInfoSouthernSupport';
				ROMI.SouthernRoles[I].Count =(255);
                `log("Replaced RoleInfoClass " $ RORC.RoleInfoClass);
            }
			if (RORC.RoleInfoClass == class'RORoleInfoSouthernGrenadier')
            {
                ROMI.SouthernRoles[I].RoleInfoClass = class'ACRoleInfoSouthernGrenadier';
                `log("Replaced RoleInfoClass " $ RORC.RoleInfoClass);
            }
			if (RORC.RoleInfoClass == class'RORoleInfoSouthernGrenadierUSMC')
            {
                ROMI.SouthernRoles[I].RoleInfoClass = class'ACRoleInfoSouthernGrenadier';
                `log("Replaced RoleInfoClass " $ RORC.RoleInfoClass);
            }
			if (RORC.RoleInfoClass == class'RORoleInfoSouthernGrenadierARVN')
            {
                ROMI.SouthernRoles[I].RoleInfoClass = class'ACRoleInfoSouthernGrenadier';
                `log("Replaced RoleInfoClass " $ RORC.RoleInfoClass);
            }
			if (RORC.RoleInfoClass == class'RORoleInfoSouthernGrenadierAUS')
            {
                ROMI.SouthernRoles[I].RoleInfoClass = class'ACRoleInfoSouthernGrenadierAUS';
                `log("Replaced RoleInfoClass " $ RORC.RoleInfoClass);
            }
            I++;
        }
    }
}

reliable client function ClientReplaceRoles()
{
    ReplaceRoles();
}

reliable client function ClientReplaceInventoryManager()
{
    ReplaceInventoryManager();
}
