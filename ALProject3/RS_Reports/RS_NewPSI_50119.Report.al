report 50119 "New PSI"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    // DefaultRenderingLayout = LayoutName;
    Caption = 'Translation Report';
    RDLCLayout = 'RS_Reports/NewPSI.rdl';


    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.", Status;
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = const(Invoice));

            column(CustomerNameLbl; CustomerNameLbl)
            { }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            { }
            trigger OnPreDataItem()
            begin

            end;

            // column()
            // {

            // }

        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    // field(Name; SourceExpression)
                    // {
                    //     ApplicationArea = All;

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = Excel;
    //         LayoutFile = 'mySpreadsheet.xlsx';
    //     }
    // }

    var
        myInt: Integer;
        CustomerNameLbl: Label 'Customer Name';
}