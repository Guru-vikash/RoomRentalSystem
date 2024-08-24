pageextension 50112 "General Journal Extend " extends "General Journal"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addfirst("A&ccount")
        {
            action("Import G/L Account")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Image = Import;
                trigger OnAction()
                var

                    GenJournal: Record "Gen. Journal Line";
                    xmlport: XmlPort "Import G/L Data";

                begin
                    // Xmlport.Run(50123, false, true);
                    xmlport.setJournalTemp(Rec."Journal Template Name", Rec."Journal Batch Name");
                    xmlport.Run();


                end;
            }
        }
        // Add changes to page actions here
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var

    begin

        if Rec."Document No." = '' then begin
            //             GLaccount.Get();
            //             GLaccount.TestField("Document No.");
            // // NoSeriesMng.InitSeries(GLaccount."Document No.",xRec."Document No.",0D,Rec."Document No.",);
            // NoSeriesMng
        end;

    end;

    var
        myInt: Integer;



}