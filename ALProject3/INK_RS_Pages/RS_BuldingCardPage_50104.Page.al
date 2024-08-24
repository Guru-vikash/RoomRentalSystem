page 50104 BuldingCardPage
{
    PageType = Card;
    // ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BuldingTab;
    Caption = 'Bulding Card Page';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(BuldingCode; Rec.BuldingCode)
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                    trigger OnValidate()
                    begin

                    end;

                }
                field(BuldingName; Rec.BuldingName)
                {
                    ApplicationArea = All;
                    Caption = 'Name';

                }
                field(BuldingAddress; Rec.BuldingAddress)
                {
                    ApplicationArea = All;
                    Caption = 'Address';
                }
                field(BuldingNoOfFloors; Rec.BuldingNoOfFloors)
                {
                    ApplicationArea = All;
                    Caption = 'No. of Floors';
                }
                field(TotalNoOfRooms; Rec.TotalNoOfRooms)
                {
                    ApplicationArea = All;
                    Caption = 'Total No. of Rooms';
                }
                field(DocDate; Rec.DocDate)
                {
                    ApplicationArea = All;
                    Caption = 'Document Date';
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Rooms List")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Open;
                // RunObject = page Rooms;

                trigger OnAction()
                var
                    RoomLists: Page Rooms;
                    RoomListRec: Record Rooms;
                begin


                    // RoomLists.SetBuildingCode(Rec.BuldingCode);
                    RoomListRec.SetRange("Building Code", Rec.BuldingCode);
                    if RoomListRec.FindSet() then
                        Page.RunModal(Page::Rooms, RoomListRec)
                    else
                        Page.RunModal(Page::Rooms, RoomListRec);
                end;
            }
        }
    }

    // procedure buldingCodeToRoomeCard(): Code[20]
    // var
    // begin
    //     exit(Rec.BuldingCode)
    // end;



}