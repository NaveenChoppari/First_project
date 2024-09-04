table 80189 "Posted Mrp Line"
{
    Caption = 'Posted Mrp Line';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Doument No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = " ",Item,"G/l Account";
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(6; "Unit of measure code"; Code[10])
        {
            Caption = 'Unit of measure code';
        }
        field(7; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(8; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
        }
        field(9; "Line Discount"; Decimal)
        {
            Caption = 'Line Discount';
        }
        field(10; "Line Discount Amount"; Decimal)
        {
            Caption = 'Line Discount Amount';
        }
        field(11; Amount; Decimal)
        {
            Caption = 'Amount';
        }
    }
    keys
    {
        key(PK; "Document No.","Line No.")
        {
            Clustered = true;
        }
    }
}
