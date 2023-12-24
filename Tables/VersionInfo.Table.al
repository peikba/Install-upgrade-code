table 50149 "Version Info"
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;

    fields
    {
        field(1; AppId; Guid)
        {
            DataClassification = SystemMetadata;
        }
        field(2; "Version Id"; Text[30])
        {
            DataClassification = SystemMetadata;
        }
        field(3; "Version No."; Integer)
        {
            DataClassification = SystemMetadata;
        }
        field(4; PackageId; Guid)
        {
            DataClassification = SystemMetadata;
        }
        field(5; "Data Version"; Text[30])
        {
            DataClassification = SystemMetadata;
        }
        field(6;"Is Installing"; Boolean)
        {
            DataClassification = SystemMetadata;
        }
        field(7; Name; Text[250])
        {
            DataClassification = SystemMetadata;
        }
        field(8; Publisher ; Text[250])
        {
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; AppId, "Version Id", "Version No.")
        {
            Clustered = true;
        }
    }
}