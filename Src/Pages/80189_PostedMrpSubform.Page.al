page 80189 "Posted Mrp Subform"
{
    ApplicationArea = All;
    Caption = 'Posted Mrp Subform';
    PageType = ListPart;
    SourceTable = "Posted Mrp Line";
    AutoSplitKey = true;
    UsageCategory = Lists;
    DelayedInsert = true;
    Editable = false;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Doument No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Doument No. field.';
                    Visible = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                    Visible = false;
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Unit of measure code"; Rec."Unit of measure code")
                {
                    ToolTip = 'Specifies the value of the Unit of measure code field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Line Discount"; Rec."Line Discount")
                {
                    ToolTip = 'Specifies the value of the Line Discount field.';
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    ToolTip = 'Specifies the value of the Line Discount Amount field.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }
}
