page 50108 MyPage
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Rooms;
    Caption = 'Customer Image';
    layout
    {
        area(Content)
        {

            field(Image; Rec.Image)
            {
                ApplicationArea = All;
                ShowCaption = false;
                Caption = 'Customer Image';
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(Import)
            {
                ApplicationArea = All;
                Image = Import;
                trigger OnAction()
                var
                    inStr: InStream;
                    outStr: OutStream;
                    Fromfile: Text;
                begin
                    Rec.TestField(RoomCode);
                    if Rec.CustomerName = '' then
                        Error('Must Specify Customer Name');
                    if Rec.Image.HasValue() then
                        if not Confirm('Override the Image') then
                            exit;


                    //yesterday leaved 
                    if UploadIntoStream('Import', '', 'All Files(*.*)|*.*', Fromfile, inStr) then begin
                        if Fromfile = '' then
                            exit;

                        Clear(Rec.Image);
                        Rec.Image.ImportStream(inStr, 'Image Description');
                        Rec.Modify(true);

                    end;


                end;
            }
            action(Export)
            {
                ApplicationArea = All;
                Image = Export;
                trigger OnAction()
                var
                    inStr: InStream;
                    TM: Record "Tenant Media";
                    imageLbl: Label '%1_image.jpg';
                    FileName: Text;
                begin
                    if TM.Get(Rec.Image.MediaId) then begin
                        TM.CalcFields(Content);
                        if TM.Content.HasValue then begin
                            FileName := StrSubstNo(imageLbl, Rec.TableCaption);
                            TM.Content.CreateInStream(InStr);
                            DownloadFromStream(inStr, '', '', '', FileName);
                        end;
                    end;

                end;
            }
            action(ClearImage)
            {
                ApplicationArea = All;
                Image = Delete;
                trigger OnAction()
                begin
                    if not Confirm('Are you want to clear Image?') then
                        exit;
                    Clear(Rec.Image);
                    Rec.Modify(true);
                end;
            }
        }
    }


    var
        myInt: Integer;
}

