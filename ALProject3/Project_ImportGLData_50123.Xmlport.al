
xmlport 50123 "Import G/L Data"
{
    Format = VariableText;
    Direction = Import;
    TextEncoding = UTF8;
    UseRequestPage = false;
    TableSeparator = '';
    // FormatEvaluate = Xml;
    // FieldSeparator = ';';
    schema
    {
        textelement(Root)
        {
            tableelement(GenJournalLine; "Gen. Journal Line")
            {
                textelement("Datewritten")
                {
                    trigger OnAfterAssignVariable()
                    begin
                        DateText := Datewritten;
                        GenJournalLine."Posting Date" := StringDateIntoDate(DateText);
                        // FormattedDateText := STRSUBSTNO('%1/%2/%3', FORMAT(Month, 2), FORMAT(Day, 2), FORMAT(Year, 4));
                        // Evaluate(PostingDate, FormattedDateText);

                        // if Evaluate(GenJournalLine."Posting Date", Datewritten) then begin
                        //     GenJournalLine."Posting Date" := TempDate;
                        // end;

                    end;

                }

                fieldelement(Acountnumber; GenJournalLine."Account No.")
                {

                }
                fieldelement(Description; GenJournalLine.Description)
                {

                }

                fieldelement(Debitamount; GenJournalLine."Debit Amount")
                {

                }
                fieldelement(Creditamount; GenJournalLine."Credit Amount")
                {

                }
                fieldelement(Axis1; GenJournalLine."Shortcut Dimension 1 Code")
                {

                }
                // textelement("Axis2")
                // {
                //     // SourceExpr = GenJournalLine."Shortcut Dimension 2 Code";
                // }
                trigger OnAfterGetRecord()
                begin

                end;

                trigger OnBeforeInsertRecord()
                var
                    DateTxt: Text;
                    TempDate: Date;
                    Day: Integer;
                    Month: Integer;
                    Year: Integer;

                    GenBatch: Record "Gen. Journal Batch";
                // NoSeries: Codeunit "No. Series";

                begin
                    Lineno += 10000;
                    GenJournalLine."Line No." := Lineno;
                    GenJournalLine."Journal Template Name" := GenJournalTemplate;
                    GenJournalLine."Journal Batch Name" := GenJournalBatch;
                    GenBatch.Get(GenJournalBatch);

                    // GenJournalLine."Document No." :=;
                    // Doctxt := 'D' + Format(AssignDocNo());
                    // GenJournalLine."Document No." := Doctxt;
                    // Doctxt := 'D0001';
                    // GenJournalLine.SetRange("Line No.", GenJournalLine."Line No.");
                    // if GenJournalLine.FindLast() then begin
                    //     if GenJournalLine."Document No." = 'D0001' then begin
                    //         GenJournalLine."Document No." := IncStr(Doctxt);
                    //     end;

                    // 
                    recDialog.Update(1, int);
                    Sleep(10);

                    // NoSeriesMng.GetNextNo('',);
                end;
            }
        }
    }
    trigger OnPreXmlPort()
    begin
        Clear(recDialog);
        int := 0;
        // DocNo := ;
        recDialog.Open('Record insert: #1##########');

    end;


    var
        PostDate: Date;
        k: Date;
        recDialog: Dialog;
        GL2: Record "Gen. Journal Line";

        GenJournalTemplate: Code[20];
        GenJournalBatch: Code[20];
        Lineno: Integer;
        DateText: Text;

        PostingDate: Date;
        int: Integer;
        DocNo: Integer;

        DocCode: Code[20];
        Doctxt: Text;
        DocNoSerMng: Codeunit NoSeriesManagement;

    procedure setJournalTemp(Template: Code[20]; Batch: Code[20])
    begin
        GenJournalTemplate := Template;
        GenJournalBatch := Batch;
    end;

    local procedure StringDateIntoDate(DateText: Text): Date
    var
        TempDate: Date;
        Day: Integer;
        Month: Integer;
        Year: Integer;

        FormattedDateText: Text;
    begin
        if STRPOS(DateText, '.') > 0 then begin
            EVALUATE(Day, COPYSTR(DateText, 1, STRPOS(DateText, '.') - 1));
            DateText := DELSTR(DateText, 1, STRPOS(DateText, '.'));

            EVALUATE(Month, COPYSTR(DateText, 1, STRPOS(DateText, '.') - 1));
            DateText := DELSTR(DateText, 1, STRPOS(DateText, '.'));

            EVALUATE(Year, DateText);
            // GenJournalLine."Posting Date" := DMY2DATE(Day, Month, Year);
            TempDate := DMY2DATE(Day, Month, Year);
            exit(TempDate);
        end
    end;

    local procedure AssignDocNo(): Integer
    var
        Txt: Text;
        genLineDocNo: Record "Gen. Journal Line";
    begin
        int += 1;
        // GenJournalLine.SetRange("Document No.", genLineDocNo."Document No.");
        // if GenJournalLine.FindLast() then begin
        //     if GenJournalLine."Document No." <> '' then begin
        //         DocNo += 1;
        //     end
        //     else begin
        //         GenJournalLine."Document No." := 'DO001';
        //         DocNo := 1;
        //     end;
        // end;
        DocNo += 1;
        exit(DocNo);
    end;

    trigger OnInitXmlPort()
    begin
        // Set the General Journal Template and Batch
        // GenJournalLine."Journal Template Name" := GenJournalTemplate.Name;
        // GenJournalLine."Journal Batch Name" := GenJournalBatch.Name;


    end;


    trigger OnPostXmlPort()
    begin
        // Message('%1 No. of record import successfully', GenJournalLine.Count);
    end;
}
