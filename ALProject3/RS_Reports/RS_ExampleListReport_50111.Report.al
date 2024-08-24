report 50111 ExampleListReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'Customer Item List';
    RDLCLayout = 'RS_Reports/CustomerItemListReport.rdl';
    UseRequestPage = true;

    dataset
    {
        dataitem(SalesInvHeader; "Sales Invoice Header")
        {

            PrintOnlyIfDetail = true;
            RequestFilterFields = "Bill-to Customer No.";
            DataItemTableView = sorting("Sell-to Customer No.");

            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {

            }
            column(Bill_to_Name; "Bill-to Name")
            {


            }
            column(Ship_to_Address; "Ship-to Address")
            {

            }


            column(Amount; Amount)
            {

            }
            column(companyName; companyInfo.Name)
            {

            }
            column(Payment_Method_Code; "Payment Method Code")
            {

            }
            column(companyPic; companyInfo.Picture)
            {

            }
            column(customerImage; custTenantMedia.Content)
            {


            }
            column(companyInfo_Address; companyInfo.Address)
            {


            }



            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {

                DataItemLink = "Bill-to Customer No." = field("Bill-to Customer No.");
                DataItemTableView = sorting("Line No.");
                column(No; No)
                { }
                column(Description; Description)
                { }
                column(Quantity; Quantity)
                { }

                column(Line_Discount__; "Line Discount %")
                { }
                column(Unit_Cost; "Unit Cost")
                { DecimalPlaces = 1 : 1; }

                column(Unit_Price; "Unit Price")
                { DecimalPlaces = 1 : 2; }
                dataitem("Value Entry"; "Value Entry")
                {
                    DataItemLink = "Source No." = field("Sell-to Customer No.");
                    DataItemTableView = sorting("Item No.");

                    trigger OnAfterGetRecord()
                    var
                        valEntry: Record "Value Entry";
                    begin


                    end;
                }


            }
            trigger OnPreDataItem()
            begin
                // SetRange(SalesInvHeader."No.", DocNoFilter);
            end;

            trigger OnAfterGetRecord()
            var
                cust: Record Customer;
            begin
                if cust.Get("Sell-to Customer No.") then
                    if cust.Image.HasValue then begin
                        custTenantMedia.Get(cust.Image.MediaId);
                        custTenantMedia.CalcFields(Content);
                    end;
            end;

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
                    // field(DocNoFilter; DocNoFilter)
                    // {
                    //     // TableRelation = "Sales Invoice Header"."No.";
                    //     ApplicationArea = All;

                    // }
                }
            }
        }

    }

    trigger OnInitReport()
    var

    begin
        companyInfo.Get;
        companyInfo.CalcFields(Picture);


    end;


    trigger OnPreReport()

    begin
        // if cust.Get(cust."No.") then
        //     if cust.Image.HasValue then begin
        //         custTenantMedia.Get(cust.Image.MediaId);
        //         custTenantMedia.CalcFields(Content);
        //     end;
    end;



    var
        myInt: Integer;
        companyInfo: Record "Company Information";
        No: label 'No:';
        custTenantMedia: Record "Tenant Media";
        // SaleInvHeader: Record "Sales Invoice Header";

        cust_sales: Report 113;
        ps: Page "Posted Sales Invoice";

        DocNoFilter: Code[20];
}

