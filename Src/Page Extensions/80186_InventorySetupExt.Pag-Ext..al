pageextension 80186 "Inventory Setup Ext" extends "Inventory Setup"
{
    layout
    {
        addlast(Numbering)
        {
            field("Mrp Nos."; Rec."Mrp Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Mrp Nos. field.';
            }
            field("Posted Mrp Nos."; Rec."Posted Mrp Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Posted Mrp Nos. field.';
            }
        }
    }
}
