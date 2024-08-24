pageextension 50118 PSI extends "Posted Sales Invoice"
{
    layout
    {
        // Add changes to page layout here

    }

    actions
    {
        addafter(Print)
        {
            action("New Print")
            {
                ApplicationArea = All;
                Image = Report;
                Ellipsis = true;

                trigger OnAction()
                var
                    PSI: Report "Standard Sales - Invoice";
                begin
                    PSI.Run();
                end;
            }
        }
    }

    var
        myInt: Integer;
}