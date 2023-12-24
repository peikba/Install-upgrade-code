codeunit 50147 "Install Codeunit"
{
    Subtype = Install;

    trigger OnInstallAppPerDatabase()
    var
        VersionCode: Codeunit "Version Code";
        InstallUpgrade: Codeunit "Install Upgrade Code";
        ExistingModuleInfo: ModuleInfo;
        IncomingModuleInfo: ModuleInfo;
        Implementation: option Install,Upgrade;
    begin
        NavApp.GetCurrentModuleInfo(ExistingModuleInfo);
        VersionCode.InsertVersionInfo(ExistingModuleInfo, Implementation::Install);
        NavApp.GetCallerModuleInfo(IncomingModuleInfo);
        VersionCode.InsertVersionInfo(IncomingModuleInfo, Implementation::Install);
        InstallUpgrade.InstallUpgrade(ExistingModuleInfo,IncomingModuleInfo);
    end;
}
