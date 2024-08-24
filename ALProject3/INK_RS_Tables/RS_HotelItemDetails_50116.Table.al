table 50116 "Hotel Item Details"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item Code"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Item Name"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Example"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Item Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;



    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}