
table 80188 "Posted Mrp Header"
{
    Caption = 'Posted Mrp Header';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if "No." <> xRec."No." then begin
                    InventorySetup.Get();
                    NoSeriesMgmt.TestManual(InventorySetup."Posted Mrp Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Source Type"; Option)
        {
            Caption = 'Source Type';
            OptionMembers = " ",Customer,Vendor;
        }
        field(3; "Source No."; Code[100])
        {
            Caption = 'Source No.';
        }
        field(4; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(5; Address; Text[250])
        {
            Caption = 'Address';
        }
        field(6; City; Text[100])
        {
            Caption = 'City';
        }
        field(7; State; Code[10])
        {
            Caption = 'State';
        }
        field(8; Country; Code[10])
        {
            Caption = 'Country';
        }
        field(9; "Phone No."; Text[20])
        {
            Caption = 'Phone No.';
        }
        field(10; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
        }
        field(11; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if "No." = '' then begin
            InventorySetup.Get();
            InventorySetup.TestField("Posted Mrp Nos.");
            NoSeriesMgmt.InitSeries(InventorySetup."Posted Mrp Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;
    var
    InventorySetup : Record "Inventory Setup";
    NoSeriesMgmt : Codeunit NoSeriesManagement;
}
