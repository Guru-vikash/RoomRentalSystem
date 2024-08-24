page 50115 "Sub Item List Part"
{
    Caption = 'Lists';
    PageType = ListPart;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Sub Item List Table";


    layout
    {
        area(Content)
        {
            repeater(Lists)
            {
                field("Sub Item Code"; Rec."Sub Item Code")
                {
                    ApplicationArea = All;
                    Caption = 'Item no.';
                }
                field("Sub Item Name"; Rec."Sub Item Name")
                {
                    ApplicationArea = All;
                    Caption = 'Item Name';
                }
                field("Sub Item Price"; Rec."Sub Item Price")
                {
                    ApplicationArea = All;
                    Caption = 'Item Price';
                }
                field("Sub Item Picture"; Rec."Sub Item Picture")
                {
                    ApplicationArea = All;
                    Caption = 'Sub Item Picture';
                    // ExtendedDatatype =;


                }

            }
        }
        // area(Factboxes)
        // {

        // }
    }

    actions
    {
        area(Processing)
        {
            action("Import Picture")
            {
                ApplicationArea = All;
                Image = Picture;
                trigger OnAction();
                var
                    inStr: InStream;
                    outStr: OutStream;
                    fileName: Text;
                begin
                    if UploadIntoStream('Selected file', '', '', fileName, inStr) then begin
                        Tempblob.CreateOutStream(outStr);
                        CopyStream(outStr, inStr);
                        Rec.CalcFields("Sub Item Picture");
                        Rec."Sub Item Picture".CreateOutStream(outStr);
                        Tempblob.CreateInStream(inStr);
                        CopyStream(outStr, inStr);
                    end;
                end;
            }
            action("Clear Image")
            {
                ApplicationArea = All;
                Image = Delete;

                trigger OnAction()
                begin
                    if not Confirm('Confirm to delete the picture?') then
                        exit;
                    Clear(Rec."Sub Item Picture");
                    Rec.Modify();




                end;
            }
            action("Show Image")
            {
                ApplicationArea = All;
                Image = Delete;

                trigger OnAction()
                var
                    inStr: InStream;
                begin
                    // Clear(Rec."Sub Item Picture");
                    // Rec.Modify();
                end;
            }
        }
    }

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin

    //     // int := 1;
    //     // if Rec."Sub Item Code" = '' then begin

    //     //     Rec."Sub Item Code" := Format(int);
    //     // end;
    //     // int += 1;
    //     // Rec."Sub Item Code" := '';
    //     // Int := 1;
    //     // // repeat
    //     // if Rec."Sub Item Code" = '' then begin
    //     //     Rec."Sub Item Code" := Format(Int);
    //     //     Int += 1;
    //     // end
    //     // Int := 1;
    //     // // Rec."Sub Item Code" := Format(Int);

    //     // if Rec."Sub Item Code" = '' then begin
    //     //     Int += 1;
    //     // end;
    //     // // else begin
    //     // //     Int := 1;
    //     // // end;
    //     // Rec."Sub Item Code" := Format(Int);

    // end;
    trigger OnOpenPage()
    begin
        if Rec.IsEmpty() then
            Rec.Insert();
    end;

    var
        Int: Integer;

        subItemPic: Record "Sub Item List Table";
        Tempblob: Codeunit "Temp Blob";
        BlobList: Codeunit "Temp Blob List";

    //Item Image
}