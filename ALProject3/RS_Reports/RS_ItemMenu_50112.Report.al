report 50112 "Hotel items menus"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    // DefaultRenderingLayout = LayoutName;
    Caption = 'Hotel Menu';
    RDLCLayout = 'RS_Reports/HotelMenu.rdl';

    dataset
    {
        dataitem("Hotel Item Details"; "Hotel Item Details")
        {
            DataItemTableView = sorting("Item Code");
            RequestFilterFields = "Item Code";
            RequestFilterHeading = 'Hotel Item Details';
            column(Item_Code; "Item Code") { }
            column(Item_Name; "Item Name")
            {

            }
            dataitem("Sub Item List Table"; "Sub Item List Table")
            {
                DataItemLink = "Item No." = field("Item Code");
                column(Sub_Item_Code; "Sub Item Code") { }
                column(Sub_Item_Name; "Sub Item Name")
                {

                }
                column(Sub_Item_Price; "Sub Item Price")
                {


                }
                column(Sub_Item_Picture; "Sub Item Picture")
                {

                }

            }
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
                group("Item Category Filters")
                {
                    // field()
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
    // trigger OnInitReport()
    // begin
    //     SubItemListTable.Get();
    //     SubItemListTable.CalcFields("Sub Item Picture");
    // end;
    trigger OnPreReport()
    begin

    end;
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
        SubItemListTable: Record "Sub Item List Table";
        TenantMedia: Record "Tenant Media";

}