reportextension 50120 "PSI" extends "Standard Sales - Invoice"
{
    RDLCLayout = 'RS_Reports/PSI.rdl';
    dataset
    {
        // Add changes to dataitems and columns here


        addfirst(header)
        {

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document No." = field("Prepayment Order No.");
                column(ItemNo_; "No.") { }

                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(Unit_of_Measure; "Unit of Measure") { }
                column(Unit_Price; "Unit Price") { }
                column(Line_Discount__; "Line Discount %") { }
                column(Line_Discount_Amount; "Line Discount Amount") { }
                column(Amount; Amount) { DecimalPlaces = 2 : 3; }
                column(Item_Charge_Qty__to_Handle; "Item Charge Qty. to Handle") { }
                column(LineAmountIncludingVAT; "Amount Including VAT") { }
                column(VAT__; "VAT %") { }

                column(TotalAmountInclVAT1; TotalAmountInclVAT) { }
                column(CurrCode; CurrCode) { }

                // column(Prepmt__Line_Amount; "Prepmt. Line Amount") { }
                // column(Prepmt__Amount_Inv__Incl__VAT; "Prepmt. Amount Inv. Incl. VAT") { }
                // column(Prepmt__Amount_Inv___LCY_; "Prepmt. Amount Inv. (LCY)") { }
                column(Prepmt__Amt__Inv_; "Prepmt. Amt. Inv.") { }
                trigger OnAfterGetRecord()
                var
                    TotalAmountIncTax: Decimal;
                    TotalLineAmount: Decimal;
                    TotalTax: Decimal;

                begin
                    // TotalAmount
                    // TotalAmountIncTax
                    TotalTax += "VAT %";

                end;

            }

            dataitem("Sales Header"; "Sales Header")
            {
                DataItemLink = "No." = field("Prepayment Order No.");
                column(Sales_Tax_Amount_Rounding; "Sales Tax Amount Rounding") { }
                column(Prepayment__; "Prepayment %")
                {

                }
                column(Prepmt__Pmt__Discount_Date; "Prepmt. Pmt. Discount Date")
                {
                }
                column(Prepmt__Include_Tax; "Prepmt. Include Tax")
                {

                }
                column(DocDate; Format("Document Date", 0, 4)) { }
                column(PrepaymentDueDate; Format("Prepayment Due Date", 0, 4)) { }
                column(Prepmt__Sales_Tax_Rounding_Amt; "Prepmt. Sales Tax Rounding Amt")
                {

                }

                column(Prepmt__Payment_Discount__; "Prepmt. Payment Discount %") { }

                column(CompanyPic; CompanyInfo.Picture) { }
                trigger OnAfterGetRecord()
                begin

                end;


            }


        }

    }


    requestpage
    {
        // Add changes to the requestpage here
    }

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = RDLC;
    //         LayoutFile = 'mylayout.rdl';
    //     }
    // }

    trigger OnPreReport()
    begin
        // Message('Document Date', "Sales Header"."Document Date");
    end;

}