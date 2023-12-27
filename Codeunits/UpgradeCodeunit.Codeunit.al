codeunit 50149 "Upgrade Codeunit"
{
    Subtype = Upgrade;

    trigger OnUpgradePerDatabase()
    var
        InstallUpgradeCode: Codeunit "Install Upgrade Code";
        IncomingModuleInfo: ModuleInfo;
        Implementation: option Install,Upgrade;
    begin
        NavApp.GetCallerModuleInfo(IncomingModuleInfo);
        InstallUpgradeCode.InstallUpgrade(IncomingModuleInfo,Implementation::Upgrade);
    end;
}