tableextension 50124 "Gen. Journal Line Extend" extends "Gen. Journal Line"
{
    fields
    {
        field(50124; "ExtendingDate"; Date)
        {
            Caption = 'Extending Posting Date';
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}