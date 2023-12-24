codeunit 50146 "Install Upgrade Code"
{
    procedure InstallUpgrade(ExistingModule: ModuleInfo; IncomingModule: ModuleInfo)
    var
        BaseAppVersion: Text;
        BaseAppLocalization: Code[10];
        ExistingVersion: Code[10];
        IncomingVersion: Code[10];
    begin
        BaseAppVersion := Format(ExistingModule.AppVersion);
        BaseAppLocalization := Format(ExistingModule.Name);
        ExistingVersion := Format(IncomingModule.DataVersion);
        IncomingVersion := Format(IncomingModule.AppVersion);
        case BaseAppVersion.startswith('13.0') of
            true:
                case BaseAppLocalization of
                    'GB':
                        case ExistingVersion of
                            '1.0.0.0':
                                case IncomingVersion of
                                    '1.0.0.1':
                                        PerformUpgradeGB130_1000_1001();
                                    '1.0.0.2':
                                        PerformUpgradeGB130_1000_1002();
                                end;
                        end;
                end;
        end;
    end;

    procedure PerformUpgradeGB130_1000_1001()
    begin
        //Upgrade Code
    end;
    procedure PerformUpgradeGB130_1000_1002()
    begin
        //Upgrade Code
    end;
}