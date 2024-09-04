table 80187 "Mrp Line"
{
    Caption = 'Mrp Line';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = " ",Item,"G/L Account";
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = if(Type = const(Item)) Item else if(Type = const("G/L Account")) "G/L Account";
            trigger OnValidate()
            var
                Item : Record Item;
                GLAccount : Record "G/L Account";
            begin
                case Type of
                    Type::Item:
                        if item.Get("No.") then begin
                            Description := Item.Description;
                            "Unit of measure code" := Item."Sales Unit of Measure";
                            "Unit Price" := Item."Unit Price";
                        end;
                    Type::"G/L Account":
                        if GLAccount.Get("No.") then begin
                            Description := GLAccount."Account Subcategory Descript.";
                            "Unit of measure code" := GLAccount."Business Unit Filter";
                            "Unit Price" := GLAccount."Budgeted Debit Amount";
                        end;
                end;
            end;
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
            Editable = false;
        }
        field(6; "Unit of measure code"; Code[10])
        {
            Caption = 'Unit of measure code';
            Editable = false;
        }
        field(7; Quantity; Decimal)
        {
            Caption = 'Quantity';
            trigger OnValidate()
            begin
                Validate(Amount);
                Validate("Line Discount Amount");
            end;
        }
        field(8; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            Editable = false;
            trigger OnValidate()
            begin
                Validate(Amount);
                Validate("Line Discount Amount");
            end;
        }
        field(9; "Line Disount %"; Decimal)
        {   
            Caption = 'Line Disount %';
            trigger OnValidate()
            begin
                Validate("Line Discount Amount");
                Validate(Amount);
            end;
        }
        field(10; "Line Discount Amount"; Decimal)
        {
            Caption = 'Line Discount Amount';
            Editable = false;
            trigger OnValidate()
            begin
                "Line Discount Amount" := ("Unit Price" * Quantity) * ("Line Disount %"/100);
                Validate(Amount);
            end;
        }
        field(11; Amount; Decimal)
        {
            Caption = 'Amount';
            Editable = false;
            trigger OnValidate()
            begin
                Amount := ("Unit Price" * Quantity) - "Line Discount Amount";
            end;
        }
        field(12; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item No.';
            trigger OnLookup()
            var
                Item : Record Item;
                Text : Text[5];
            begin
                Text := 'LS*';
                Item.SetRange(Blocked,false);
                Item.SetFilter("No.",Text);
                if Item.FindSet() then 
                    if Page.RunModal(Page::"Item List",Item) = Action::LookupOK then
                        Rec."Item No." := Item."No.";
            end;
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
