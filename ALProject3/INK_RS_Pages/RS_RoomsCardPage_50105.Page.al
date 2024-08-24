namespace Microsoft.Sales.Customer;
using Microsoft.Inventory.Item;
using Microsoft.Foundation.NoSeries;
using Microsoft.Sales.Document;
page 50105 RoomsCardPage
{
    PageType = Card;
    UsageCategory = Administration;
    SourceTable = Rooms;
    Caption = 'Room Card';
    RefreshOnActivate = true;


    layout
    {
        area(Content)
        {
            group(General)
            {
                field(RoomCode; Rec.RoomCode)
                {
                    ApplicationArea = All;
                    Caption = 'Room Code';
                    // trigger OnLookup(var Text: Text): Boolean
                    // var
                    //     NoSeries: Codeunit "No. Series Check";
                    //     cust:page "Customer Card";
                    // begin

                    // end;




                }
                field("Building Code"; Rec."Building Code")
                {
                    ApplicationArea = All;
                    Caption = 'Building Code';
                }
                field(RoomNo; Rec.RoomNo)
                {
                    ApplicationArea = All;
                    Caption = 'Room No.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                }
                field(NoOfRooms; Rec.NoOfRooms)
                {
                    ApplicationArea = All;
                    Caption = 'No. of Rooms';
                }
                field(RoomRent; Rec.RoomRent)
                {
                    ApplicationArea = All;
                    Caption = 'Room Rent';
                }
            }
            group("Customer Details")
            {
                field(CustomerName; Rec.CustomerName)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Name';
                }
                field("Customer Address"; Rec."Customer Address")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Address';
                }
                field(NoOfMembers; Rec.NoOfMembers)
                {
                    ApplicationArea = All;
                    Caption = 'No. of members';
                }
                field("Room Booking Date"; Rec."Room Booking Date")
                {
                    ApplicationArea = All;
                    Caption = 'Room Booking Date';
                }
                field("Room Leave Date"; Rec."Room Leave Date")
                {
                    ApplicationArea = All;
                    Caption = 'Room Leaving Date';
                }
                field(DocumentDate; Rec.DocumentDate)
                {
                    ApplicationArea = All;
                    Caption = 'Document Date';
                }
                field(CustmorElectricBill; Rec.CustmorElectricBill)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Electric Bill';
                }
                field(ElectricBill; Rec.ElectricBill)
                {
                    ApplicationArea = All;
                    Caption = 'Electric Bill';
                }
                field(WaterBill; Rec.WaterBill)
                {
                    ApplicationArea = All;
                    Caption = 'Water Bill';
                }
                field(TotalBillAmount; Rec.TotalBillAmount)
                {
                    ApplicationArea = All;
                    Caption = 'Total Bill Amount';
                    Editable = false;


                }
                field(RemainingAmount; Rec.RemainingAmount)
                {
                    ApplicationArea = All;
                    Caption = 'Remaining Amount';
                }
            }
            part("Room Customer Line Part"; CustomerExpenseLine)
            {
                ApplicationArea = All;
                SubPageLink = CustLineCode = field(RoomCode), "Bulding Code" = field("Building Code");
                UpdatePropagation = Both;
            }
            group(Documents)
            {
                field(DocumentType; DocumentType)
                {
                    ApplicationArea = All;
                    Caption = 'Document Type';

                    trigger OnValidate()
                    begin
                        Message('Value is changed');
                    end;
                }
                field(DocumentNo; Rec.DocumentNo)
                {
                    ApplicationArea = All;
                    Caption = 'Document No.';
                }
                field(Document; Rec.Document)
                {
                    ApplicationArea = All;
                    Caption = 'Document';
                }
                field(Image; Rec.Image)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Image';
                }
                field("Hotel Item Code"; Rec."Hotel Item Code")
                {
                    ApplicationArea = All;
                    Caption = 'Hotel Item Code';
                }

                field("Item Price"; Rec."Item Price")
                {
                    ApplicationArea = All;
                    Caption = 'Item Price';


                }
                //room Code ,Room No.,Customer Name,NoORooms ,NoOfMemebers, Room Rent, 
                //ElectricBill,WaterBill,other,TotalBillAmount,Remain Amount
                // Document no.,Document Type,Document ,Customer Photo,
            }

        }
        area(FactBoxes)
        {
            part(Mypage; MyPage)
            {
                ApplicationArea = All;
                SubPageLink = RoomCode = field(RoomCode), "Building Code" = field("Building Code");


            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Customer List")
            {
                ApplicationArea = All;

                Image = Open;
                RunObject = page CustomerOfRoom;

                trigger OnAction()
                // var
                //     RoomLists: Page Rooms;
                begin
                    // if Page.RunModal(Page::Rooms) = Action::LookupOK then;

                end;
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    var
        BuldingCode: Record BuldingTab;
        int: Integer;
        code: Code[20];
        str: Text[20];
        increment: Text[20];
        Room: Record Rooms;
    begin

        // Room.SetRange("Building Code", Rec."Building Code");
        // if Room.FindLast() then begin
        //     Evaluate(int, Room.RoomCode);
        //     int += 1000;
        //     Rec.RoomCode := Format(int);
        // end
        // else begin
        //     int := 1000;
        //     rec.RoomCode := Format(int);
        // end;

        //2nd
        // Room.Reset();
        Room.SetRange("Building Code", Rec."Building Code");
        if Room.FindLast() then begin
            Evaluate(code, Room.RoomCode);
            // int += 1000;
            str := code;
            increment := IncStr(str);
            Rec.RoomCode := Format(increment);
        end
        else begin
            code := 'RM001';
            Rec.RoomCode := code;
        end;


    end;





    var

        DocumentType: Enum DocumentType;
        Price: Decimal;


}

