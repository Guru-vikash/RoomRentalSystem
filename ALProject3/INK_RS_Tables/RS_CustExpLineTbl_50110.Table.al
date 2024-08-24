table 50110 CustExpLineTbl
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CustLineCode; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Billing Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Bulding Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }


        field(2; BillDate; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(3; RoomRentPay; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(4; ElectricBillPay; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(5; WaterBillPay; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(6; OtherBillPay; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Total();

            end;

        }
        field(7; TotalBillAmount; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Total Amount';



        }
        //  field(7;TotalBillAmountPayed;Decimal)
        // {
        //     DataClassification = ToBeClassified;

        // }
        //  field(7;AdvanceAmount;Decimal)
        // {
        //     DataClassification = ToBeClassified;

        // }

    }

    keys
    {
        key(PK; "Billing Code", CustLineCode, "Bulding Code")
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

    local procedure Total()
    var

    begin

        TotalBillAmount := RoomRentPay + ElectricBillPay + WaterBillPay + OtherBillPay;
        Modify(true);

    end;

}