table 50103 BuldingTab
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; BuldingCode; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "No. Series";


        }
        field(18; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";

        }
        field(2; BuldingName; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(3; BuldingAddress; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(4; BuldingNoOfFloors; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(5; TotalNoOfRooms; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(6; DocDate; Date)
        {
            DataClassification = ToBeClassified;

        }

    }


    keys
    {
        key(PK; BuldingCode)
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
        NoSerMng: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        if Rec.BuldingCode = '' then begin
            NoSerMng.InitSeries('BLD', xRec."No Series", 0D, BuldingCode, "No Series")
        end;

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