page 50113 HotelItemList
{
    Caption = 'Hotel Item List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Hotel Item Details";
    RefreshOnActivate = true;
    Editable = false;
    CardPageId = "Hotel Item Card Page";

    layout
    {
        area(Content)
        {
            repeater("Item List")
            {
                field("Item Code"; Rec."Item Code")
                {
                    ApplicationArea = All;
                }
                field("Item Name"; Rec."Item Name")
                {
                    ApplicationArea = All;
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
            action("Print Menu")
            {
                ApplicationArea = All;

                trigger OnAction();
                var
                    HotelMenu: Report "Hotel items menus";
                    cominfo: page "Company Information";
                begin
                    HotelMenu.Run();
                end;
            }
        }
    }
    var
    // Hotel_ItemCode: Code[20];
    // Hotel_Item_Type: Text[100];
}