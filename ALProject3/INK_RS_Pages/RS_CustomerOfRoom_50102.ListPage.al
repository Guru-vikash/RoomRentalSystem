page 50102 CustomerOfRoom
{
    PageType = List;
    UsageCategory = Lists;
    // SourceTable = TableName;
    Editable = false;
    AdditionalSearchTerms = '';
    RefreshOnActivate = true;
    Caption = 'Customer Room List';

    layout
    {
        area(Content)
        {
            // repeater(GroupName)
            // {
            //     field(Name; NameSource)
            //     {
            //         ApplicationArea = All;

            //     }
            // }
            field(CustCode; CustCode)
            {
                ApplicationArea = All;
                Caption = 'Customer Code';
                ToolTip = 'Enter a Bulding Code Which is unique for every bulding.';
            }
            field(CustName; CustName)
            {
                ApplicationArea = All;
                Caption = 'Customer Name';
            }
            field(CustAddress; CustAddress)
            {
                ApplicationArea = All;
                Caption = 'Customer Address';

            }
            field(TotalNoOfMenmbes; TotalNoOfMenmbes)
            {
                ApplicationArea = All;
                Caption = 'Total no. of Members';

            }
            field(AadharNo; AadharNo)
            {
                ApplicationArea = All;
                Caption = 'Aadhar Card No.';
            }
        }
        area(Factboxes)
        {
            systempart(Notes; Notes)
            {

            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }
    var
        CustCode: Code[20];
        CustName: Text[100];
        CustAddress: Text[100];
        TotalNoOfMenmbes: Integer;
        AadharNo: Integer;
}