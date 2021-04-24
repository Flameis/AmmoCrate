class ACPlayerController extends ROPlayerController;

var byte                TeamIdx;
var(RolesNorth)		array<RORoleCount>	ACNorthernRoles;
var(RolesSouth)		array<RORoleCount>	ACSouthernRoles;

simulated function PreBeginPlay()
{
    super.PreBeginPlay();

    if (WorldInfo.NetMode == NM_Standalone || Role == ROLE_Authority)
    {
        ReplaceRoles();
        ReplaceInventoryManager();
        ReplacePawnHandler();

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

simulated function ReplacePawnHandler()
{
    ROGameInfo(WorldInfo.Game).PawnHandlerClass = class'ACPawnHandler';
    `log("Replacing PawnHandler...");
}

reliable client function ClientReplacePawnHandler()
{
    ReplacePawnHandler();
}

simulated function ReceivedGameClass(class<GameInfo> GameClass)
{
    super.ReceivedGameClass(GameClass);

    ReplaceRoles();
    ReplaceInventoryManager();
    ReplacePawnHandler();
}

simulated function ReplaceInventoryManager()
{
    ROPawn(Pawn).InventoryManagerClass = class'ACInventoryManager';
}

simulated function ReplaceRoles()
{
    local ROMapInfo ROMI;

    ROMI = ROMapInfo(WorldInfo.GetMapInfo());

    if (ROMI != None)
    { 
        `log("Replacing roles...");
        
        ROMI.SouthernRoles.length = 10;
        ROMI.SouthernRoles[0].Count = 255;
        ROMI.SouthernRoles[1].Count = 255;
        ROMI.SouthernRoles[2].Count = 255;
        ROMI.SouthernRoles[3].Count = 255;
        ROMI.SouthernRoles[4].Count = 255;
        ROMI.SouthernRoles[5].Count = 255;
        ROMI.SouthernRoles[6].Count = 255;
        ROMI.SouthernRoles[7].Count = 19;
        ROMI.SouthernRoles[8].Count = 255;
        ROMI.SouthernRoles[9].Count = 255;

        ROMI.NorthernRoles.length = 8;
        ROMI.NorthernRoles[0].Count = 255;
        ROMI.NorthernRoles[1].Count = 255;
        ROMI.NorthernRoles[2].Count = 255;
        ROMI.NorthernRoles[3].Count = 255;
        ROMI.NorthernRoles[4].Count = 255;
        ROMI.NorthernRoles[5].Count = 255;
        ROMI.NorthernRoles[6].Count = 255;
        ROMI.NorthernRoles[7].Count = 19;

        if (ROMI.SouthernForce == SFOR_USArmy)
        {
            ROMI.SouthernRoles[0].RoleInfoClass = class'RORoleInfoSouthernRifleman';
            ROMI.SouthernRoles[1].RoleInfoClass = class'RORoleInfoSouthernPointman';
            ROMI.SouthernRoles[2].RoleInfoClass = class'RORoleInfoSouthernMachineGunner';
            ROMI.SouthernRoles[3].RoleInfoClass = class'RORoleInfoSouthernMarksman';
            ROMI.SouthernRoles[4].RoleInfoClass = class'RORoleInfoSouthernEngineer';
            ROMI.SouthernRoles[5].RoleInfoClass = class'ACRoleInfoSouthernGrenadier';
            ROMI.SouthernRoles[6].RoleInfoClass = class'ACRoleInfoSouthernSupport';
            ROMI.SouthernRoles[7].RoleInfoClass = class'RORoleInfoSouthernCommander';
            ROMI.SouthernRoles[8].RoleInfoClass = class'RORoleInfoSouthernPilot';
            ROMI.SouthernRoles[9].RoleInfoClass = class'RORoleInfoSouthernTransportPilot';
        }

        if (ROMI.SouthernForce == SFOR_USMC)
        {
            ROMI.SouthernRoles[0].RoleInfoClass = class'RORoleInfoSouthernRifleman';
            ROMI.SouthernRoles[1].RoleInfoClass = class'RORoleInfoSouthernPointmanUSMC';
            ROMI.SouthernRoles[2].RoleInfoClass = class'RORoleInfoSouthernMachineGunner';
            ROMI.SouthernRoles[3].RoleInfoClass = class'RORoleInfoSouthernMarksmanUSMC';
            ROMI.SouthernRoles[4].RoleInfoClass = class'RORoleInfoSouthernEngineerUSMC';
            ROMI.SouthernRoles[5].RoleInfoClass = class'ACRoleInfoSouthernGrenadier';
            ROMI.SouthernRoles[6].RoleInfoClass = class'ACRoleInfoSouthernSupport';
            ROMI.SouthernRoles[7].RoleInfoClass = class'RORoleInfoSouthernCommanderUSMC';
            ROMI.SouthernRoles[8].RoleInfoClass = class'RORoleInfoSouthernPilot';
            ROMI.SouthernRoles[9].RoleInfoClass = class'RORoleInfoSouthernTransportPilot';
        }

        if (ROMI.SouthernForce == SFOR_AusArmy)
        {
            ROMI.SouthernRoles[0].RoleInfoClass = class'RORoleInfoSouthernRiflemanAUS';
            ROMI.SouthernRoles[1].RoleInfoClass = class'RORoleInfoSouthernScoutAUS';
            ROMI.SouthernRoles[2].RoleInfoClass = class'RORoleInfoSouthernMachineGunnerAUS';
            ROMI.SouthernRoles[3].RoleInfoClass = class'RORoleInfoSouthernMarksmanAUS';
            ROMI.SouthernRoles[4].RoleInfoClass = class'RORoleInfoSouthernEngineerAUS';
            ROMI.SouthernRoles[5].RoleInfoClass = class'ACRoleInfoSouthernGrenadierAUS';
            ROMI.SouthernRoles[6].RoleInfoClass = class'ACRoleInfoSouthernSupport';
            ROMI.SouthernRoles[7].RoleInfoClass = class'RORoleInfoSouthernCommanderAUS';
            ROMI.SouthernRoles[8].RoleInfoClass = class'RORoleInfoSouthernPilotAUS';
            ROMI.SouthernRoles[9].RoleInfoClass = class'RORoleInfoSouthernTransportPilotAUS';
        }

        if (ROMI.SouthernForce == SFOR_ARVN)
        {
            ROMI.SouthernRoles[0].RoleInfoClass = class'RORoleInfoSouthernRiflemanARVN';
            ROMI.SouthernRoles[1].RoleInfoClass = class'RORoleInfoSouthernPointmanARVN';
            ROMI.SouthernRoles[2].RoleInfoClass = class'RORoleInfoSouthernMachineGunnerARVN';
            ROMI.SouthernRoles[3].RoleInfoClass = class'RORoleInfoSouthernMarksmanARVN';
            ROMI.SouthernRoles[4].RoleInfoClass = class'RORoleInfoSouthernEngineerARVN';
            ROMI.SouthernRoles[5].RoleInfoClass = class'ACRoleInfoSouthernGrenadier';
            ROMI.SouthernRoles[6].RoleInfoClass = class'ACRoleInfoSouthernSupport';
            ROMI.SouthernRoles[7].RoleInfoClass = class'RORoleInfoSouthernCommanderARVN';
            ROMI.SouthernRoles[8].RoleInfoClass = class'RORoleInfoSouthernPilotARVN';
            ROMI.SouthernRoles[9].RoleInfoClass = class'RORoleInfoSouthernTransportPilotARVN';
        }
        
        if (ROMI.NorthernForce == NFOR_NVA)
        {
            ROMI.NorthernRoles[0].RoleInfoClass = class'RORoleInfoNorthernRifleman';
            ROMI.NorthernRoles[1].RoleInfoClass = class'RORoleInfoNorthernScout';
            ROMI.NorthernRoles[2].RoleInfoClass = class'ACRoleInfoNorthernMachineGunner';
            ROMI.NorthernRoles[3].RoleInfoClass = class'RORoleInfoNorthernSniper';
            ROMI.NorthernRoles[4].RoleInfoClass = class'ACRoleInfoNorthernSapper';
            ROMI.NorthernRoles[5].RoleInfoClass = class'RORoleInfoNorthernRPG';
            ROMI.NorthernRoles[6].RoleInfoClass = class'ACRoleInfoNorthernSupport';
            ROMI.NorthernRoles[7].RoleInfoClass = class'RORoleInfoNorthernCommander';
        }

        if (ROMI.NorthernForce == NFOR_NLF)
        {
            ROMI.NorthernRoles[0].RoleInfoClass = class'RORoleInfoNorthernGuerilla';
            ROMI.NorthernRoles[1].RoleInfoClass = class'RORoleInfoNorthernScoutNLF';
            ROMI.NorthernRoles[2].RoleInfoClass = class'ACRoleInfoNorthernMachineGunnerNLF';
            ROMI.NorthernRoles[3].RoleInfoClass = class'RORoleInfoNorthernSniperNLF';
            ROMI.NorthernRoles[4].RoleInfoClass = class'ACRoleInfoNorthernSapperNLF';
            ROMI.NorthernRoles[5].RoleInfoClass = class'RORoleInfoNorthernRPGNLF';
            ROMI.NorthernRoles[6].RoleInfoClass = class'ACRoleInfoNorthernSupport';
            ROMI.NorthernRoles[7].RoleInfoClass = class'RORoleInfoNorthernCommanderNLF';
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
