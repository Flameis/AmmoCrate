class AmmoCrateMutator extends Mutator
	config(AmmoCrate);

var config array<string>  MutatorAdmins;
var ACPlayerController ACPC;
var ROVolumeMapBounds ROMB;
var ROPawnHandler ROPH;
var array<string>       LoggedInMutatorAdmins;

function PreBeginPlay()
    {
    local class<Object>          All;
    local ROMapInfo ROMI;
    local ROVolumeNoArtillery ROV;
    local ROWeap_AK47_AssaultRifle_AKM AKM;
    local ROWeap_AK47_AssaultRifle_Type56_1 Type56_1;
    local ROWeap_AK47_AssaultRifle_Type56 Type56;
    ROMI = ROMapInfo(WorldInfo.GetMapInfo());
    `log("AmmoCrateMutator init");

    DynamicLoadObject("ROGameContent.ROHeli_AH1G_Content", class'Class');
    DynamicLoadObject("ROGameContent.ROHeli_OH6_Content", class'Class');
    DynamicLoadObject("ROGameContent.ROHeli_UH1H_Content", class'Class');
    DynamicLoadObject("ROGameContent.ROHeli_UH1H_Gunship_Content", class'Class');
    DynamicLoadObject("GOM3.GOMVehicle_M113_ACAV_ActualContent", class'Class');
    DynamicLoadObject("WinterWar.WWVehicle_T20_ActualContent", class'Class');
    DynamicLoadObject("WinterWar.WWVehicle_T26_EarlyWar_ActualContent", class'Class');
    DynamicLoadObject("WinterWar.WWVehicle_T28_ActualContent", class'Class');
    DynamicLoadObject("WinterWar.WWVehicle_HT130_ActualContent", class'Class');
    DynamicLoadObject("WinterWar.WWVehicle_53K_ActualContent", class'Class');
    DynamicLoadObject("WinterWar.WWVehicle_Vickers_ActualContent", class'Class');
    DynamicLoadObject("AmmoCrate.ACVehicle_M113_APC_Content", class'Class');
    DynamicLoadObject("GOM3.GOMWeapon_Satchel_ActualContent", class'Class');
    DynamicLoadObject("GOM3.GOMWeapon_RPG2_ActualContent", class'Class');
    DynamicLoadObject("GOM3.GOMWeapon_RPD_SawnOff_ActualContent", class'Class');
    DynamicLoadObject("GOM3.GOMWeapon_PPS_ActualContent", class'Class');
    DynamicLoadObject("GOM3.GOMWeapon_M38_Carbine_ActualContent", class'Class');
    DynamicLoadObject("GOM3.GOMWeapon_M7RifleGrenade_ActualContent", class'Class');
    DynamicLoadObject("GOM3.GOMWeapon_Kar98k_ActualContent", class'Class');
    DynamicLoadObject("GOM3.GOMWeapon_BowieKnife_ActualContent", class'Class');
    DynamicLoadObject("GOM3.GOMWeapon_M1_Carbine_ActualContent", class'Class');

    All = class<ROVehicle>(DynamicLoadObject("ROGameContent.ROHeli_AH1G_Content", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("ROGameContent.ROHeli_OH6_Content", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("ROGameContent.ROHeli_UH1H_Content", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("ROGameContent.ROHeli_UH1H_Gunship_Content", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("GOM3.GOMVehicle_M113_ACAV_ActualContent", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_T20_ActualContent", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_T26_EarlyWar_ActualContent", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_T28_ActualContent", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_HT130_ActualContent", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_53K_ActualContent", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_Vickers_ActualContent", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("AmmoCrate.ACVehicle_M113_APC_Content", class'Class'));
    All = class<ROWeapon>(DynamicLoadObject("GOM3.GOMWeapon_Satchel_ActualContent", class'Class'));
    All = class<ROWeapon>(DynamicLoadObject("GOM3.GOMWeapon_RPG2_ActualContent", class'Class'));
    All = class<ROWeapon>(DynamicLoadObject("GOM3.GOMWeapon_RPD_SawnOff_ActualContent", class'Class'));
    All = class<ROWeapon>(DynamicLoadObject("GOM3.GOMWeapon_PPS_ActualContent", class'Class'));
    All = class<ROWeapon>(DynamicLoadObject("GOM3.GOMWeapon_M38_Carbine_ActualContent", class'Class'));
    All = class<ROWeapon>(DynamicLoadObject("GOM3.GOMWeapon_M7RifleGrenade_ActualContent", class'Class'));
    All = class<ROWeapon>(DynamicLoadObject("GOM3.GOMWeapon_Kar98k_ActualContent", class'Class'));
    All = class<ROWeapon>(DynamicLoadObject("GOM3.GOMWeapon_BowieKnife_ActualContent", class'Class'));
    All = class<ROWeapon>(DynamicLoadObject("GOM3.GOMWeapon_M1_Carbine_ActualContent", class'Class'));

    ROMI.SharedContentReferences.AddItem(All);

    AddSharedContentRef(All);

    ROGameInfo(WorldInfo.Game).PlayerControllerClass = class'ACPlayerController';
    ROGameInfo(WorldInfo.Game).PlayerReplicationInfoClass = class'ACPlayerReplicationInfo';
    ROGameInfo(WorldInfo.Game).PawnHandlerClass = class'ACPawnHandler';
        
        if (ROGameInfo(WorldInfo.Game).PawnHandlerClass != class'ACPawnHandler')
        {
        `log("Error replacing Handler");
        }
        Else
        {
        `log("Replacing Handler");
        }

    foreach allactors(class'ROVolumeNoArtillery', ROV)
    {
    ROV.Destroy();
    }

    AKM.Spread[0]=0.00085;
    AKM.Spread[1]=0.00085;
    Type56_1.Spread[0]=0.00085;
    Type56_1.Spread[1]=0.00085;
    Type56.Spread[0]=0.00085;
    Type56.Spread[1]=0.00085;

    super.PreBeginPlay();
    }

function AddSharedContentRef(object ObjectToAdd);

/*
function ModifyPlayer(Pawn Other)
    {
    local RORoleInfo RORI;
    local ACPlayerReplicationInfo ACPRI;
    local class<ROWeapon> ROWC;

    ACPRI = ACPlayerReplicationInfo(Other.PlayerReplicationInfo);
    RORI = ACPRI.RoleInfo;

    `log("RORI = " $ RORI);

    ForEach RORI.Items[RORIGM_Default].OtherItems(ROWC)
    {
        `log("Item = " $ ROWC);
    }

    super.ModifyPlayer(Other);
    }
*/

function NotifyLogin(Controller NewPlayer)
    {
        ACPC = ACPlayerController(NewPlayer);

        if (ACPC == None)
        {
            `log("Error replacing roles");
            return;
        }

        ACPC.ReplacePawnHandler();
        ACPC.ClientReplacePawnHandler();
        ACPC.ReplaceRoles();
        ACPC.ClientReplaceRoles();
        ACPC.ReplaceInventoryManager();
        ACPC.ClientReplaceInventoryManager();

        super.NotifyLogin(NewPlayer);
    }
    
function ClearVehicles()
{
	local ROVehicle ROV;

	foreach WorldInfo.AllPawns(class'ROVehicle', ROV)
	{
		if( !ROV.bDriving )
			ROV.Destroy();
	}
}

function Mutate(string MutateString, PlayerController PC) //no prefixes, also call super function!
    {
        local array<string> Args;
        local string        command;

        Args = SplitString(MutateString, " ", true);
        command = Caps(Args[0]);

        
        Switch (Command)
        {
            case "GIVEWEAPON":
            GiveWeapon(PC, StringToInt(Args[1]));
            `log("Giving a weapon");
            break;
            
            case "SPAWNVEHICLE":
            SpawnVehicle(PC, StringToInt(Args[1]));
            `log("Spawning a vehicle");
            break;

            case "CLEARVEHICLES":
            ClearVehicles();
            `log("Clearing Vehicles");
            break;

            case "CLEARVEHICLES":
            break;
        }

    super.Mutate(MutateString, PC);
    }

function int StringToInt(string String)
    {
    if(String ~= "USAMMO")
    {
        return 1;
    }
    else if(String ~= "VCAMMO")
    {
        return 2;
    }
    else if(String ~= "BHP")
    {
        return 3;
    }
    else if(String ~= "M79WP")
    {
        return 4;
    }
    else if(String ~= "MEME")
    {
        return 5;
    }
    else if(String ~= "MG34")
    {
        return 6;
    }
    else if(String ~= "DSHK")
    {
        return 7;
    }
    else if(String ~= "AKM")
    {
        return 8;
    }
    else if(String ~= "C4")
    {
        return 10;
    }
    else if(String ~= "DP28")
    {
        return 11;
    }
    else if(String ~= "F1")
    {
        return 12;
    }
    else if(String ~= "FOUGASSE")
    {
        return 13;
    }
    else if(String ~= "IZH43")
    {
        return 14;
    }
    else if(String ~= "K50M")
    {
        return 15;
    }
    else if(String ~= "L1A1")
    {
        return 16;
    }
    else if(String ~= "L2A1")
    {
        return 17;
    }
    else if(String ~= "M1CARBINE")
    {
        return 18;
    }
    else if(String ~= "M14")
    {
        return 19;
    }
    else if(String ~= "M1630RND")
    {
        return 20;
    }
    else if(String ~= "TYPE56")
    {
        return 21;
    }
    else if(String ~= "M16")
    {
        return 22;
    }
    else if(String ~= "CLAYMORE")
    {
        return 23;
    }
    else if(String ~= "M18SMOKE")
    {
        return 24;
    }
    else if(String ~= "M1911")
    {
        return 25;
    }
    else if(String ~= "REVOLVER")
    {
        return 26;
    }
    else if(String ~= "BAR")
    {
        return 27;
    }
    else if(String ~= "M1919")
    {
        return 28;
    }
    else if(String ~= "TYPE56-1")
    {
        return 29;
    }
    else if(String ~= "THOMPSON")
    {
        return 30;
    }
    else if(String ~= "M1DGARAND")
    {
        return 31;
    }
    else if(String ~= "M1GARAND")
    {
        return 32;
    }
    else if(String ~= "M2CARBINE")
    {
        return 33;
    }
    else if(String ~= "M34WP")
    {
        return 34;
    }
    else if(String ~= "DUCKBILL")
    {
        return 35;
    }
    else if(String ~= "STAKEOUT")
    {
        return 36;
    }
    else if(String ~= "TRENCH")
    {
        return 37;
    }
    else if(String ~= "GREASEGUN")
    {
        return 38;
    }
    else if(String ~= "M40")
    {
        return 39;
    }
    else if(String ~= "M60")
    {
        return 40;
    }
    else if(String ~= "M61")
    {
        return 41;
    }
    else if(String ~= "M61QUAD")
    {
        return 42;
    }
    else if(String ~= "M79")
    {
        return 43;
    }
    else if(String ~= "M79BUCKSHOT")
    {
        return 44;
    }
    else if(String ~= "M79SMOKE")
    {
        return 45;
    }
    else if(String ~= "M8SMOKE")
    {
        return 46;
    }
    else if(String ~= "FLAMETHROWER")
    {
        return 47;
    }
    else if(String ~= "MAS49")
    {
        return 48;
    }
    else if(String ~= "MAS49GRENADE")
    {
        return 49;
    }
    else if(String ~= "MAS49SNIPER")
    {
        return 50;
    }
    else if(String ~= "MAT49")
    {
        return 51;
    }
    else if(String ~= "MD82")
    {
        return 52;
    }
    else if(String ~= "MOSIN")
    {
        return 53;
    }
    else if(String ~= "MOSINSNIPER")
    {
        return 54;
    }
    else if(String ~= "MOLOTOV")
    {
        return 55;
    }
    else if(String ~= "MP40")
    {
        return 56;
    }
    else if(String ~= "OWEN")
    {
        return 57;
    }
    else if(String ~= "MAKAROV")
    {
        return 58;
    }
    else if(String ~= "PPSH")
    {
        return 59;
    }
    else if(String ~= "PPSHDRUM")
    {
        return 60;
    }
    else if(String ~= "PUNJI")
    {
        return 61;
    }
    else if(String ~= "RDG1SMOKE")
    {
        return 62;
    }
    else if(String ~= "RP46")
    {
        return 63;
    }
    else if(String ~= "RPD")
    {
        return 64;
    }
    else if(String ~= "RPG7")
    {
        return 65;
    }
    else if(String ~= "SKS")
    {
        return 66;
    }
    else if(String ~= "SVD")
    {
        return 67;
    }
    else if(String ~= "TRIPWIRE")
    {
        return 68;
    }
    else if(String ~= "TT33")
    {
        return 69;
    }
    else if(String ~= "TYPE67")
    {
        return 70;
    }
    else if(String ~= "SATCHEL")
    {
        return 71;
    }
    else if(String ~= "XM17730RND")
    {
        return 72;
    }
    else if(String ~= "XM177")
    {
        return 73;
    }
    else if(String ~= "XM21SNIPER")
    {
        return 74;
    }
    else if(String ~= "XM21SILENCED")
    {
        return 75;
    }
    else if(String ~= "COBRA")
    {
        return 76;
    }
    else if(String ~= "LOACH")
    {
        return 77;
    }
    else if(String ~= "HUEY")
    {
        return 78;
    }
    else if(String ~= "BUSHRANGER")
    {
        return 79;
    }
    else if(String ~= "M113ACAV")
    {
        return 80;
    }
    else if(String ~= "T20")
    {
        return 81;
    }
    else if(String ~= "T26")
    {
        return 82;
    }
    else if(String ~= "T28")
    {
        return 83;
    }
    else if(String ~= "HT130")
    {
        return 84;
    }
    else if(String ~= "ATGUN")
    {
        return 85;
    }
    else if(String ~= "VICKERS")
    {
        return 86;
    }
    else if(String ~= "M18YELLOW")
    {
        return 87;
    }
    else if(String ~= "M18RED")
    {
        return 88;
    }
    else if(String ~= "M18PURPLE")
    {
        return 89;
    }
    else if(String ~= "M18GREEN")
    {
        return 90;
    }
    else if(String ~= "RPG2")
    {
        return 91;
    }
    else if(String ~= "RPDSAWNOFF")
    {
        return 92;
    }
    else if(String ~= "PPS43")
    {
        return 93;
    }
    else if(String ~= "M38CARBINE")
    {
        return 94;
    }
    else if(String ~= "M7RIFLENADE")
    {
        return 95;
    }
    else if(String ~= "KAR98K")
    {
        return 96;
    }
    else if(String ~= "BOWIE")
    {
        return 97;
    }
    else if(String ~= "GOMCARBINE")
    {
        return 98;
    }
    else if(String ~= "M113")
    {
        return 99;
    }
    else if(String ~= "MG34HMG")
    {
        return 100;
    }
    else if(String ~= "MKB42")
    {
        return 101;
    }
    else
    {
        return -1;
    }
}

function SpawnVehicle(PlayerController PC, int VehicleName)
{
	local vector                    CamLoc, StartShot, EndShot, X, Y, Z;
	local rotator                   CamRot;
	local class<ROVehicle>          Cobra;
    local class<ROVehicle>          Loach;
    local class<ROVehicle>          Huey;
    local class<ROVehicle>          Bushranger;
    local class<ROVehicle>          M113ACAV;
    local class<ROVehicle>          T20;
    local class<ROVehicle>          T26;
    local class<ROVehicle>          T28;
    local class<ROVehicle>          HT130;
    local class<ROVehicle>          ATGun;
    local class<ROVehicle>          Vickers;
    local class<ROVehicle>          M113;
	local ROVehicle ROHelo;

	ACPC.GetPlayerViewPoint(CamLoc, CamRot);

	// Do ray check and grab actor
	GetAxes(CamRot, X, Y, Z );
	StartShot   = PC.Pawn.Location;
	EndShot     = StartShot + (450.0 * X) + (100 * Z);

	Cobra = class<ROVehicle>(DynamicLoadObject("ROGameContent.ROHeli_AH1G_Content", class'Class'));
    Loach = class<ROVehicle>(DynamicLoadObject("ROGameContent.ROHeli_OH6_Content", class'Class'));
    Huey = class<ROVehicle>(DynamicLoadObject("ROGameContent.ROHeli_UH1H_Content", class'Class'));
    Bushranger = class<ROVehicle>(DynamicLoadObject("ROGameContent.ROHeli_UH1H_Gunship_Content", class'Class'));
    M113ACAV = class<ROVehicle>(DynamicLoadObject("GOM3.GOMVehicle_M113_ACAV_ActualContent", class'Class'));
    T20 = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_T20_ActualContent", class'Class'));
    T26 = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_T26_EarlyWar_ActualContent", class'Class'));
    T28 = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_T28_ActualContent", class'Class'));
    HT130 = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_HT130_ActualContent", class'Class'));
    ATGun = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_53K_ActualContent", class'Class'));
    Vickers = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_Vickers_ActualContent", class'Class'));
    M113 = class<ROVehicle>(DynamicLoadObject("AmmoCrate.ACVehicle_M113_APC_Content", class'Class'));

	if(VehicleName == 76)
	{
		ROHelo = Spawn(Cobra, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        `log("Spawned " $ VehicleName $ EndShot);
	}
    if(VehicleName == 77)
	{
		ROHelo = Spawn(Loach, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        `log("Spawned " $ VehicleName $ EndShot);
	}
    if(VehicleName == 78)
	{
		ROHelo = Spawn(Huey, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        `log("Spawned " $ VehicleName $ EndShot);
	}
    if(VehicleName == 79)
	{
		ROHelo = Spawn(Bushranger, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        `log("Spawned " $ VehicleName $ EndShot);
	}
    if(VehicleName == 80)
	{
		ROHelo = Spawn(M113ACAV, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        `log("Spawned " $ VehicleName $ EndShot);
	}
    if(VehicleName == 81)
	{
		ROHelo = Spawn(T20, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        `log("Spawned " $ VehicleName $ EndShot);
	}
    if(VehicleName == 82)
	{
		ROHelo = Spawn(T26, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        `log("Spawned " $ VehicleName $ EndShot);
	}
    if(VehicleName == 83)
	{
		ROHelo = Spawn(T28, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        `log("Spawned " $ VehicleName $ EndShot);
	}
    if(VehicleName == 84)
	{
		ROHelo = Spawn(HT130, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        `log("Spawned " $ VehicleName $ EndShot);
	}
    if(VehicleName == 85)
	{
		ROHelo = Spawn(ATGUN, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        `log("Spawned " $ VehicleName $ EndShot);
	}
    if(VehicleName == 86)
	{
		ROHelo = Spawn(VICKERS, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        `log("Spawned " $ VehicleName $ EndShot);        
	}
    if(VehicleName == 99)
	{
		ROHelo = Spawn(M113, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        `log("Spawned " $ VehicleName $ EndShot);        
	}
}

function PrivateMessage(PlayerController receiver, coerce string msg)
{
    receiver.TeamMessage(None, msg, '');
}

function GiveWeapon(PlayerController PC, int WeaponName)
    {
	local ROInventoryManager InvManager;
	InvManager = ROInventoryManager(PC.Pawn.InvManager);        
        
        if (WeaponName == -1)
        {
            PrivateMessage(PC, "Not a valid weapon name.");
        }
        if (WeaponName == 1)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACItem_USAmmoCrate_Content", false, true);
        }
        if (WeaponName == 2)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACItem_VCAmmoCrate_Content", false, true);
        }
        if (WeaponName == 3)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_BHP_Pistol_Content", false, true);
        }
        if (WeaponName == 4)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACWeap_M79_GrenadeLauncher_Level3", false, true);
        }
        if (WeaponName == 5)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACWeap_M79_MemeLauncher_Content", false, true);
        }
        if (WeaponName == 6)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACWeap_MG34_LMG_Content", false, true);
        }
        if (WeaponName == 7)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROItem_PlaceableHMG_Content", false, true);
        }
        if (WeaponName == 8)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_AK47_AssaultRifle_AKM", false, true);
        }
        if (WeaponName == 10)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_C4_Explosive_Content", false, true);
        }
        if (WeaponName == 11)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_DP28_LMG_Content", false, true);
        }
        if (WeaponName == 12)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_F1_SMG_Content", false, true);
        }
        if (WeaponName == 13)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_Fougasse_Mine_Content", false, true);
        }
        if (WeaponName == 14)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_IZH43_Shotgun_Content", false, true);
        }
        if (WeaponName == 15)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_K50M_SMG_Content", false, true);
        }
        if (WeaponName == 16)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_L1A1_Rifle_Content", false, true);
        }
        if (WeaponName == 17)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_L2A1_LMG_Content", false, true);
        }
        if (WeaponName == 18)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M1_Carbine_30rd", false, true);
        }
        if (WeaponName == 19)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M14_Rifle_Content", false, true);
        }
        if (WeaponName == 20)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M16A1_AssaultRifle_30rd", false, true);
        }
        if (WeaponName == 21)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_AK47_AssaultRifle_Type56", false, true);
        }
        if (WeaponName == 22)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M16A1_AssaultRifle_Content", false, true);
        }
        if (WeaponName == 23)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M18_Claymore_Content", false, true);
        }
        if (WeaponName == 24)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M18_SignalSmoke_Purple", false, true);
        }
        if (WeaponName == 25)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M1911_Pistol_Content", false, true);
        }
        if (WeaponName == 26)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M1917_Pistol_Content", false, true);
        }
        if (WeaponName == 27)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M1918_BAR_Content", false, true);
        }
        if (WeaponName == 28)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M1919A6_LMG_Content", false, true);
        }
        if (WeaponName == 29)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_AK47_AssaultRifle_Type56_1", false, true);
        }
        if (WeaponName == 30)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M1A1_SMG_Content", false, true);
        }
        if (WeaponName == 31)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M1DGarand_SniperRifle_Content", false, true);
        }
        if (WeaponName == 32)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M1Garand_Rifle_Content", false, true);
        }
        if (WeaponName == 33)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M2_Carbine_Content", false, true);
        }
        if (WeaponName == 34)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M34_WP_Content", false, true);
        }
        if (WeaponName == 35)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M37_Shotgun_Duckbill", false, true);
        }
        if (WeaponName == 36)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M37_Shotgun_Stakeout", false, true);
        }
        if (WeaponName == 37)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M37_Shotgun_Trench", false, true);
        }
        if (WeaponName == 38)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M3A1_SMG_Content", false, true);
        }
        if (WeaponName == 39)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M40Scoped_Rifle_Content", false, true);
        }
        if (WeaponName == 40)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M60_GPMG_Level2", false, true);
        }
        if (WeaponName == 41)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M61_Grenade_Content", false, true);
        }
        if (WeaponName == 42)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M61_Grenade_ContentQuad", false, true);
        }
        if (WeaponName == 43)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M79_GrenadeLauncher_Content", false, true);
        }
        if (WeaponName == 44)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M79_GrenadeLauncher_Level2", false, true);
        }
        if (WeaponName == 45)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M79_GrenadeLauncher_Level3", false, true);
        }
        if (WeaponName == 46)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M8_Smoke_Content", false, true);
        }
        if (WeaponName == 47)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M9_Flamethrower_Content", false, true);
        }
        if (WeaponName == 48)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_MAS49_Rifle_Content", false, true);
        }
        if (WeaponName == 49)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_MAS49_Rifle_Grenade_Content", false, true);
        }
        if (WeaponName == 50)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_MAS49Scoped_Rifle_Content", false, true);
        }
        if (WeaponName == 51)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_MAT49_SMG_Content", false, true);
        }
        if (WeaponName == 52)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_MD82_Mine_Content", false, true);
        }
        if (WeaponName == 53)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_MN9130_Rifle_Content", false, true);
        }
        if (WeaponName == 54)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_MN9130Scoped_Rifle_Content", false, true);
        }
        if (WeaponName == 55)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_Molotov_Content", false, true);
        }
        if (WeaponName == 56)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_MP40_SMG_Content", false, true);
        }
        if (WeaponName == 57)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_Owen_SMG_Content", false, true);
        }
        if (WeaponName == 58)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_PM_Pistol_Content", false, true);
        }
        if (WeaponName == 59)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_PPSH41_SMG_Content", false, true);
        }
        if (WeaponName == 60)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_PPSH41_SMG_Drum", false, true);
        }
        if (WeaponName == 61)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_PunjiTrap_Content", false, true);
        }
        if (WeaponName == 62)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_RDG1_Smoke_Content", false, true);
        }
        if (WeaponName == 63)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_RP46_LMG_Content", false, true);
        }
        if (WeaponName == 64)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_RPD_LMG_200rd", false, true);
        }
        if (WeaponName == 65)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_RPG7_RocketLauncher_Content", false, true);
        }
        if (WeaponName == 66)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_SKS_Rifle_Content", false, true);
        }
        if (WeaponName == 67)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_SVDScoped_Rifle_Content", false, true);
        }
        if (WeaponName == 68)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_TripwireTrap_Content", false, true);
        }
        if (WeaponName == 69)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_TT33_Pistol_Content", false, true);
        }
        if (WeaponName == 70)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_Type67_Grenade_Content", false, true);
        }
        if (WeaponName == 71)
        {
            InvManager.LoadAndCreateInventory("GOM3.GOMWeapon_Satchel_ActualContent", false, true);
        }
        if (WeaponName == 72)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_XM177E1_Carbine_30rd", false, true);
        }
        if (WeaponName == 73)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_XM177E1_Carbine_Content", false, true);
        }
        if (WeaponName == 74)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_XM21Scoped_Rifle_Level2", false, true);
        }
        if (WeaponName == 75)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_XM21Scoped_Rifle_Suppressed", false, true);
        }
        if (WeaponName == 87)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACWeap_M18_SignalSmoke_Yellow_Content", false, true);
        }
        if (WeaponName == 88)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACWeap_M18_SignalSmoke_Red_Content", false, true);
        }
        if (WeaponName == 89)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACWeap_M18_SignalSmoke_Purple_Content", false, true);
        }
        if (WeaponName == 90)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACWeap_M18_SignalSmoke_Green_Content", false, true);
        }
        if (WeaponName == 91)
        {
            InvManager.LoadAndCreateInventory("GOM3.GOMWeapon_RPG2_ActualContent", false, true);
        }
        if (WeaponName == 92)
        {
            InvManager.LoadAndCreateInventory("GOM3.GOMWeapon_RPD_SawnOff_ActualContent", false, true);
        }
        if (WeaponName == 93)
        {
            InvManager.LoadAndCreateInventory("GOM3.GOMWeapon_PPS_ActualContent", false, true);
        }
        if (WeaponName == 94)
        {
            InvManager.LoadAndCreateInventory("GOM3.GOMWeapon_M38_Carbine_ActualContent", false, true);
        }
        if (WeaponName == 95)
        {
            InvManager.LoadAndCreateInventory("GOM3.GOMWeapon_M7RifleGrenade_ActualContent", false, true);
        }
        if (WeaponName == 96)
        {
            InvManager.LoadAndCreateInventory("GOM3.GOMWeapon_Kar98k_ActualContent", false, true);
        }
        if (WeaponName == 97)
        {
            InvManager.LoadAndCreateInventory("GOM3.GOMWeapon_BowieKnife_ActualContent", false, true);
        }
        if (WeaponName == 98)
        {
            InvManager.LoadAndCreateInventory("GOM3.GOMWeapon_M1_Carbine_ActualContent", false, true);
        }
        if (WeaponName == 100)
        {
            InvManager.LoadAndCreateInventory("GOM3.GOMWeapon_M1_Carbine_ActualContent", false, true);
        }
        if (WeaponName == 101)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ROWeap_MKb42_AssaultRifle_Content", false, true);
        }
    }