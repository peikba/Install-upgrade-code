codeunit 50149 "Upgrade Codeunit"
{
    Subtype = Upgrade;

    trigger OnUpgradePerDatabase()
    var
        VersionCode: Codeunit "Version Code";
        ExistingModuleInfo: ModuleInfo;
        IncomingModuleInfo: ModuleInfo;
        Implementation: option Install,Upgrade;
    begin
        NavApp.GetCurrentModuleInfo(ExistingModuleInfo);
        VersionCode.InsertVersionInfo(ExistingModuleInfo, Implementation::Upgrade);
        NavApp.GetCallerModuleInfo(IncomingModuleInfo);
        VersionCode.InsertVersionInfo(IncomingModuleInfo, Implementation::Upgrade);
    end;
}