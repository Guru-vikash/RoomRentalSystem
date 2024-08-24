page 50100 Buldings
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = BuldingTab;
    Editable = false;
    AdditionalSearchTerms = 'Buld';
    Caption = 'Buildings';
    CardPageId = BuldingCardPage;            //cardPage linking id or page name
    RefreshOnActivate = true;


    layout
    {
        area(Content)
        {
            repeater(BuldingList)
            {
                field(BuldingCode; Rec.BuldingCode)
                {
                    ApplicationArea = All;
                    Caption = 'Bulding Code';
                    ToolTip = 'Enter a Bulding Code Which is unique for every bulding.';


                }
                field(BuldingName; Rec.BuldingName)
                {
                    ApplicationArea = All;
                    Caption = 'Bulding Name';

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
            action("Bulding wise Rooms Report")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;

                trigger OnAction()
                begin

                end;
            }
        }
    }



    // yester day leave
    trigger OnNewRecord(BelowxRec: Boolean)
    var
        int: Integer;
        Str: Text;
    begin
        int := 100;
        if Rec.BuldingCode = '' then begin

            str := 'BD00' + Format(int);
            Rec.BuldingCode := Str;
        end
        else begin
            int += 100;
        end;
    end;

    var
        sl: Record "Sales Line";
        slp: Page "Sales Order Subform";
}