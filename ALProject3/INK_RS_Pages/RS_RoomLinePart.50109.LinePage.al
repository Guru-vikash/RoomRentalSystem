page 50109 CustomerExpenseLine
{
    Caption = 'Customer Room Expenses ';
    PageType = ListPart;
    UsageCategory = Lists;
    // ApplicationArea = All;
    SourceTable = CustExpLineTbl;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Billing Code"; Rec."Billing Code")
                {
                    ApplicationArea = All;
                    Caption = 'Billing Code';
                }
                field(CustLineCode; Rec.CustLineCode)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Bulding Code"; Rec."Bulding Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(BillDate; Rec.BillDate)
                {
                    ApplicationArea = All;
                    Caption = 'Billing Date';
                }
                field(RoomRentPay; Rec.RoomRentPay)
                {
                    ApplicationArea = All;
                    Caption = 'Room Rent Amount';
                }
                field(ElectricBillPay; Rec.ElectricBillPay)
                {
                    ApplicationArea = All;
                    Caption = 'Room Electicity Bill Amount';
                }
                field(WaterBillPay; Rec.WaterBillPay)
                {
                    ApplicationArea = All;
                    Caption = 'Water Bill Amount';
                }
                field(OtherBillPay; Rec.OtherBillPay)
                {
                    ApplicationArea = All;
                    Caption = 'Other Bill Amount';
                }
                field(TotalBillAmount; Rec.TotalBillAmount)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
                }

            }
        }

    }

    actions
    {
        area(Processing)
        {
            action("Totaling Amount")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    Total := Round(Rec.RoomRentPay + Rec.ElectricBillPay + Rec.WaterBillPay + Rec.OtherBillPay);
                end;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        Total := Round(Rec.RoomRentPay + Rec.ElectricBillPay + Rec.WaterBillPay + Rec.OtherBillPay);
    end;

    var
        Total: Decimal;
}