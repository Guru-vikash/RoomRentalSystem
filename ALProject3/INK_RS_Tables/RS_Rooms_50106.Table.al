table 50106 Rooms
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; RoomCode; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "No. Series";


        }
        field(22; "Building Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "No. Series";
            // trigger OnValidate()
            // var
            //     building: Page BuldingCardPage;
            // begin
            //     Rec."Building Code" := building.buldingCodeToRoomeCard();
            // end;


        }

        field(16; Description; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(2; RoomNo; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(3; CustomerName; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(23; "Customer Address"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(4; NoOfRooms; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(5; NoOfMembers; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(6; RoomRent; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 2;

        }
        field(7; ElectricBill; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(8; WaterBill; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(9; OtherBill; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(10; TotalBillAmount; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(11; RemainingAmount; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        // field(12;DocumentType;Decimal)
        // {
        //     DataClassification = ToBeClassified;

        // }
        field(13; DocumentNo; BigInteger)
        {
            DataClassification = ToBeClassified;

        }
        field(14; Document; Blob)
        {
            DataClassification = ToBeClassified;

        }
        field(15; Image; Media)
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = Person;
        }
        field(17; CustmorElectricBill; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18; DocumentDate; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "NoSeries"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";


        }
        field(24; "Room Booking Date"; DateTime)
        {
            DataClassification = ToBeClassified;


        }
        field(25; "Room Leave Date"; DateTime)
        {
            DataClassification = ToBeClassified;


        }

        // Another Task created Fields
        field(20; "Hotel Item Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Hotel Item Details";
            trigger OnValidate()
            var
                ItemPrice: Record "Hotel Item Details";
            begin
                ItemPrice.Reset();
                if ItemPrice.Get("Hotel Item Code") then
                    "Item Price" := ItemPrice.Price;
            end;
        }
        field(21; "Item Price"; Decimal)
        {
            DataClassification = ToBeClassified;


        }



        //room Code ,Room No.,Customer Name,NoORooms ,NoOfMemebers, Room Rent, 
        //ElectricBill,WaterBill,other,TotalBillAmount,Remain Amount
        // Document no.,Document Type,Document ,Customer Photo,
    }

    keys
    {
        key(PK; RoomCode, "Building Code")
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
    var
        int: Integer;

    begin
        // if Rec.RoomCode = '' then begin
        //     NoSerMng.InitSeries('RM', xRec.NoSeries, 0D, RoomCode, NoSeries);
        // end;

        // BuldingCode.SetRange(BuldingCode, Rec."Building Code");



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