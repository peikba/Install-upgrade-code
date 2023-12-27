codeunit 50147 "Install Codeunit"
{
    Subtype = Install;

    trigger OnInstallAppPerDatabase()
    var
        InstallUpgradeCode: Codeunit "Install Upgrade Code";
        Implementation: option Install,Upgrade;
    begin
        InstallUpgradeCode.InstallUpgrade(Implementation::Install);
    end;
}
