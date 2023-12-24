page 50149 "Version Info List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Version Info";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(AppId; Rec.AppId)
                {
                    ApplicationArea = All;
                    ToolTip = 'Application Id';
                }
                field(PackageId; Rec.PackageId)
                {
                    ApplicationArea = All;
                    ToolTip = 'Package Id';
                }
                field("Version Id"; Rec."Version Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Version Id';
                }
                field("Version No"; Rec."Version No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Version No.';
                }
                field("Data Version"; Rec."Data Version")
                {
                    ApplicationArea = All;
                    ToolTip = 'Data Version';
                }
                field(Name;Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Name';
                }
                field("Publisher"; Rec."Publisher")
                {
                    ApplicationArea = All;
                    ToolTip = 'Publisher Name';
                }
                field(Implementation;Rec.Implementation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Implementation';
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action("Get Module Info")
            {
                Caption = 'Get Module Info';
                ApplicationArea = All;
                ToolTip = 'Get Module Info';
                Image = GetBinContent;
                Promoted=true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction();
                var
                    IncomingModuleInfo: ModuleInfo;
                begin
                    NavApp.GetCallerModuleInfo(IncomingModuleInfo);
                    Message('AppVersion %1\DataVersion %2\Dependencies %3\Id %4\Name %5\PackageId %6\Publisher %7', IncomingModuleInfo.AppVersion,
                                                            IncomingModuleInfo.DataVersion,
                                                            IncomingModuleInfo.Dependencies,
                                                            IncomingModuleInfo.Id,
                                                            IncomingModuleInfo.Name,
                                                            IncomingModuleInfo.PackageId,
                                                            IncomingModuleInfo.Publisher);
                end;
            }
        }
    }
}