table 50117 "Sub Item List Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Sub Item Code"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Sub Item Name"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Sub Item Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 2;

        }
        field(4; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Hotel Item Details";
        }
        field(5; "Sub Item Picture"; Blob)
        {
            DataClassification = ToBeClassified;
            Caption = 'Picture';
            Subtype = Bitmap;

            trigger OnValidate()
            begin
                PictureUpdate := true;
            end;
        }

    }

    keys
    {
        key(PK; "Sub Item Code", "Item No.")
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
        PictureUpdate: Boolean;


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