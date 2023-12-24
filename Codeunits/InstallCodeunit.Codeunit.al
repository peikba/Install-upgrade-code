codeunit 50147 "Install Codeunit"
{
    Subtype = Install;

    trigger OnInstallAppPerDatabase()
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