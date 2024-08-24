page 50101 Rooms
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Rooms;
    RefreshOnActivate = true;
    Caption = 'Rooms-List';
    Editable = false;
    CardPageId = RoomsCardPage;
    // QueryCategory = 'Rooms List';


    layout
    {
        area(Content)
        {
            repeater(RoomList)
            {
                field(RoomCode; Rec.RoomCode)
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                }
                field(RoomNo; Rec.RoomNo)
                {
                    ApplicationArea = All;
                    Caption = 'Room No.';
                }


                field(CustomerName; Rec.CustomerName)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Name';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Room Description';
                }
                field(RoomRent; Rec.RoomRent)
                {
                    ApplicationArea = All;
                    Caption = 'Room Rent';
                }
                field("Building Code"; Rec."Building Code")
                {
                    ApplicationArea = All;
                    Caption = 'Building Code';
                }
            }

        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(New)
            {
                ApplicationArea = All;
                Caption = 'Home';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        BuldingCodeForFilter: Code[20];
        buildingRec: Record BuldingTab;

    trigger OnOpenPage()
    begin
        // Rec.SetRange("Building Code", BuldingCodeForFilter);  
    end;

    // procedure SetBuildingCode(BCode: Code[20])

    // begin
    //     BuldingCodeForFilter := BCode;
    // end;



    var
        int: Integer;

}