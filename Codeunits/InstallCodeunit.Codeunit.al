codeunit 50147 "Install Codeunit"
{
    Subtype = Install;

    trigger OnInstallAppPerDatabase()
    var
        InstallUpgradeCode: Codeunit "Install Upgrade Code";
        IncomingModuleInfo: ModuleInfo;
        Implementation: option Install,Upgrade;
    begin
        NavApp.GetCallerModuleInfo(IncomingModuleInfo);
        InstallUpgradeCode.InstallUpgrade(IncomingModuleInfo,Implementation::Install);
    end;
}
