codeunit 50148 "Version Code"
{
    internal procedure InsertVersionInfo(InModuleInfo: ModuleInfo; Implementation:option Install,Upgrade)
    var
        VersionInfo: Record "Version Info";
        NextVersion: Integer;
    begin
        VersionInfo.SetRange(AppId, InModuleInfo.Id);
        VersionInfo.SetRange("Version Id", Format(InModuleInfo.AppVersion));
        if VersionInfo.FindLast() then
            NextVersion := VersionInfo."Version No." + 1
        else
            NextVersion := 1;
        VersionInfo.Init();
        VersionInfo.AppId := InModuleInfo.Id;
        VersionInfo."Version Id" := Format(InModuleInfo.AppVersion);
        VersionInfo.PackageId := InModuleInfo.PackageId;
        VersionInfo."Version No." := NextVersion;
        VersionInfo."Data Version" := format(InModuleInfo.DataVersion);
        VersionInfo.Name := CopyStr(InModuleInfo.Name, 1, MaxStrLen(VersionInfo.Name));
        VersionInfo.Publisher := CopyStr(InModuleInfo.Publisher, 1, MaxStrLen(VersionInfo.Publisher));
        VersionInfo.Implementation := Implementation;
        VersionInfo.Insert();
    end;

}

