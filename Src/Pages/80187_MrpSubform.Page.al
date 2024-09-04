page 80187 "Mrp Subform"
{
    ApplicationArea = All;
    Caption = 'Mrp Lines';
    PageType = ListPart;
    SourceTable = "Mrp Line";
    UsageCategory = Lists;
    AutoSplitKey = true;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
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
                field("Line Disount %"; Rec."Line Disount %")
                {
                    ToolTip = 'Specifies the value of the Line Disount % field.';
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    ToolTip = 'Specifies the value of the Line Discount Amount field.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Item No"; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
            }
        }
    }
}
