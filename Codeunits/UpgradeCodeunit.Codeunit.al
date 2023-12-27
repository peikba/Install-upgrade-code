codeunit 50149 "Upgrade Codeunit"
{
    Subtype = Upgrade;

    trigger OnUpgradePerDatabase()
    var
        InstallUpgradeCode: Codeunit "Install Upgrade Code";
        Implementation: option Install,Upgrade;
    begin
        InstallUpgradeCode.InstallUpgrade(Implementation::Upgrade);
    end;
}