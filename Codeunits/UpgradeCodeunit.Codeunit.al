codeunit 50149 "Upgrade Codeunit"
{
    Subtype = Upgrade;

    trigger OnUpgradePerDatabase()
    var
        VersionCode: Codeunit "Version Code";
        ExistingModuleInfo: ModuleInfo;
        IncomingModuleInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(ExistingModuleInfo);
        VersionCode.InsertVersionInfo(ExistingModuleInfo);
        NavApp.GetCallerModuleInfo(IncomingModuleInfo);
        VersionCode.InsertVersionInfo(IncomingModuleInfo);
    end;
}