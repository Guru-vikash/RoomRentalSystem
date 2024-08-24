page 50114 "Hotel Item Card Page"
{
    PageType = Card;
    // ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Hotel Item Details";
    RefreshOnActivate = true;


    layout
    {
        area(Content)
        {
            group("Item Details")
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


            part(SubItemListPart; "Sub Item List Part")
            {
                SubPageLink = "Item No." = field("Item Code");
                UpdatePropagation = Both;
                ApplicationArea = All;
            }
            group("Sub Item Details")
            {
                field(Price; Rec.Price)
                {
                    ApplicationArea = All;
                    Caption = 'Price';

                    trigger OnValidate()
                    var
                        recRef: RecordRef;
                        fldRef: FieldRef;
                        RoomCard: Record Rooms;

                    begin
                        // RoomCard.TotalBillAmount := Rec.Price;
                        // recRef.Open(Database::Rooms);
                        // fldRef := recRef.Field(11);
                        // fldRef.SetRange();
                        // fldRef.

                    end;
                }
                // field(Name; Name)
                // {
                //     ApplicationArea = All;
                //     Caption = 'Sub Item Name';
                //     trigger OnValidate()
                //     begin
                //         if SubItemList.Get(SubItemList."Sub Item Code") then begin
                //             SubItemList."Sub Item Name" := Name;
                //             // SubItemList.Modify()
                //         end;

                //     end;

                // }

                field(tryEnum; tryEnum)
                {
                    ApplicationArea = All;
                    Caption = 'Example';
                    trigger OnValidate()
                    var
                        fref: FieldRef;
                    begin
                        // SeletedValEnum();
                        x();
                    end;
                }
                field(y; y)
                {
                    ApplicationArea = All;
                    Caption = 'Example1';

                }

            }
            group("Aadhar Card")
            {
                Caption = 'Aadhar';
                Visible = AadharFast;
                field(Aadhar; Aadhar)
                {
                    ApplicationArea = all;
                }
            }
            group("Pan Card")
            {
                Caption = 'Pan Card';
                Visible = PanFast;
                field(PanCard; PanCard)
                {
                    ApplicationArea = all;
                }
            }

        }
        area(FactBoxes)
        {
            systempart(Notes; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(picute; Outlook)
            { ApplicationArea = all; }
            part(picture; "Sub Item List Part")
            {

            }

        }


    }



    actions
    {

        area(Processing)
        {
            action("Print Menu")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()

                begin
                    Message('Process');
                end;
            }
            action("New")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()

                begin
                    Message('New');
                end;
            }
            action("Report")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;
                trigger OnAction()

                begin
                    Message('Report');
                end;
            }
            action("category 10")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category10;
                trigger OnAction()

                begin
                    Message('Category 10');
                end;
            }
        }
        area(Creation)
        {
            action("Creation1")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()

                begin
                    Message('Creation');
                end;
            }
            action("Creation2")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()

                begin
                    Message('Creation2');
                end;
            }
            action("Creation3")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()

                begin
                    Message('Creation3');
                end;
            }
        }

    }
    trigger OnInit()
    begin
        // AadharFast := false;
        // PanFast := false;
    end;

    trigger OnOpenPage()
    begin


    end;

    trigger OnModifyRecord(): Boolean
    begin

        Message('OnModifyRecord');

    end;


    var
        No: Code[20];
        Name: Text[100];
        y: Text[50];
        tryEnum: Enum DocumentType;
        AadharFast: Boolean;
        PanFast: Boolean;
        Aadhar: Text[100];
        PanCard: Text[100];

    local procedure SeletedValEnum()
    var
        myInt: Integer;
    begin
        case tryEnum of
            tryEnum::AadharCard:
                begin
                    AadharFast := true;
                    PanFast := false;
                end;

            tryEnum::PancardCard:
                begin
                    AadharFast := false;
                    PanFast := true;
                end;
            tryEnum::VoterID:
                Message('VoterID');
            else
                Message('Nothing');
        end;
    end;

    local procedure x()
    var

    begin

        if Format(tryEnum::AadharCard) <> '' then begin
            AadharFast := true;
            PanFast := false;
        end
        else if Format(tryEnum::PancardCard) <> '' then begin
            AadharFast := false;
            PanFast := true;
        end
        else begin
            AadharFast := false;
            PanFast := false;
        end;
    end;

}

