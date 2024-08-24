xmlport 50121 "Import GL Data"
{
    Format = VariableText;
    Direction = Both;
    TextEncoding = UTF8;
    UseRequestPage = false;
    TableSeparator = '';
    schema
    {
        textelement(Root)
        {

            tableelement(GenJournalLine; "Gen. Journal Line")
            {
                // fieldelement()
                XmlName = 'HRDetailsImport';


                textelement(DateFormate)
                {

                    trigger OnBeforePassVariable()
                    begin
                        DateFormate := GenJournalLine.FieldCaption("Posting Date");
                    end;
                }
                fieldelement("Datewritten"; GenJournalLine."Posting Date")
                {

                    trigger OnBeforePassField()
                    var
                        DateTxt: Text;
                        TempDate: Date;
                        Day: Integer;
                        Month: Integer;
                        Year: Integer;
                        ReformattedDateTxt: Text[10];
                    begin

                        // ReformattedDateTxt := Format(GenJournalLine."Posting Date", 0, '<Day,2>/<Month,2>/<Year,4>');
                        // // GenJournalLine."Posting Date" := TempDate;
                        // GenJournalLine."Posting Date" := ParseDate(ReformattedDateTxt);
                        // Evaluate(TempDate, DateTxt);
                        // GenJournalLine."Posting Date" := TempDate;
                        // // Day := Date2DMY(GenJournalLine."Posting Date", 1);
                        // // Month := Date2DMY(GenJournalLine."Posting Date", 2);
                        // // Year := Date2DMY(GenJournalLine."Posting Date", 3);

                        // // DateTxt := Format(Month + '/' + Day + '/' + Year);
                        // // Evaluate(TempDate, DateTxt);
                        // GenJournalLine."Posting Date" := TempDate;
                        // Message('Date', GenJournalLine."Posting Date");
                        // GenJournalLine."Posting Date" := Format(GenJournalLine."Posting Date", 0, '<Day,2>/<Month,2>/<Year,4>');
                        TempDate := GenJournalLine."Posting Date";
                        ReformattedDateTxt := Format(TempDate + 'D', 0, '<Month,2>/<Day,2>/<Year,4>');
                        GenJournalLine."Posting Date" := TempDate;
                    end;
                }
                fieldelement("Accountnumber"; GenJournalLine."Account No.")
                {

                }
                fieldelement("Descriptionofentry"; GenJournalLine.Description)
                {

                }
                fieldelement("Debitamount"; GenJournalLine."Debit Amount")
                {

                }
                fieldelement("Creditamount"; GenJournalLine."Credit Amount")
                {

                }

                // fieldelement("Axis1"; GenJournalLine."Shortcut Dimension 1 Code")
                // {

                // }
                // fieldelement("Axis2"; GenJournalLine."Shortcut Dimension 2 Code")
                // {

                // }
            }
        }
    }
    var
        DateText: Text[10];

    procedure ParseDate(DateStr: Text): Date
    var
        Day: Integer;
        Month: Integer;
        Year: Integer;
        FormattedDate: Date;
    begin
        // Parse the date assuming the format is dd/mm/yyyy
        EVALUATE(Day, COPYSTR(DateStr, 1, 2));
        EVALUATE(Month, COPYSTR(DateStr, 4, 2));
        EVALUATE(Year, COPYSTR(DateStr, 7, 4));
        FormattedDate := DMY2Date(Day, Month, Year);
        exit(FormattedDate);
    end;
}



