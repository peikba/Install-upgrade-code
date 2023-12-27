codeunit 50146 "Install Upgrade Code"
{
    var
        UpgradeTag: Codeunit "Upgrade Tag";
        UpgradeTagBuild2019_1Txt: Label 'UpgradeTagBuild2019_1';
        UpgradeTagBuild2019_2Txt: Label 'UpgradeTagBuild2019_2';
        UpgradeTagBuild2019_3Txt: Label 'UpgradeTagBuild2019_3';

    procedure InstallUpgrade(Implementation: option Install,Upgrade)
    begin
        if not UpgradeTag.HasUpgradeTag(UpgradeTagBuild2019_1Txt) then PerformUpgradeTagBuild2019_1();
        if not UpgradeTag.HasUpgradeTag(UpgradeTagBuild2019_2Txt) then PerformUpgradeTagBuild2019_2();
        if not UpgradeTag.HasUpgradeTag(UpgradeTagBuild2019_3Txt) then PerformUpgradeTagBuild2019_3();
    end;

    local procedure PerformUpgradeTagBuild2019_1()
    begin
        UpgradeTag.SetUpgradeTag(UpgradeTagBuild2019_1Txt);
        InitSetup();
        CreateResources();
    end;
    local procedure InitSetup();
    var
        NoSerie: Record "No. Series";
        NoSerieLine: Record "No. Series Line";
    begin
        NoSerie.Code := 'SEM';
        NoSerie.Description := 'Seminars';
        NoSerie."Default Nos." := true;
        NoSerie."Manual Nos." := true;

        if NoSerie.Insert()  then;

        NoSerieLine."Series Code" := NoSerie.Code;
        NoSerieLine."Starting No." := 'SEM0000';
        if NoSerieLine.Insert() then;

        NoSerie.Code := 'SEMREG';
        NoSerie.Description := 'Seminar Registrations';
        NoSerie."Default Nos." := true;
        NoSerie."Manual Nos." := false;
        if NoSerie.Insert()  then;

        NoSerieLine."Series Code" := NoSerie.Code;
        NoSerieLine."Starting No." := 'SEMREG0000';
        if NoSerieLine.Insert()  then;

        NoSerie.Code := 'SEMREGPOST';
        NoSerie.Description := 'Posted Seminar Registrations';
        NoSerie."Default Nos." := true;
        NoSerie."Manual Nos." := true;
        if NoSerie.Insert()  then;

        NoSerieLine."Series Code" := NoSerie.Code;
        NoSerieLine."Starting No." := 'SEMPREG0000';
        if NoSerieLine.Insert()  then;
    end;

    local procedure CreateResources();
    var
        Resource: Record Resource;
    begin
        Resource.Init();
        Resource."No." := 'INSTR';
        if Resource.Insert()  then;
        Resource.Name := 'Mr. Instructor';
        Resource.validate("Gen. Prod. Posting Group", 'MISC');
        Resource."Direct Unit Cost" := 100;
        Resource.Type := Resource.Type::Person;
        if Resource.Modify() then;
        Resource."No." := 'ROOM 01';
        if Resource.Insert()  then;
        Resource.Name := 'Room 01';
        Resource.Type := Resource.Type::Machine;
        if Resource.Modify() then;
    end;

    local procedure PerformUpgradeTagBuild2019_2()
    begin
        //Upgrade Code
    end;

    local procedure PerformUpgradeTagBuild2019_3()
    begin
        //Upgrade Code
    end;
}