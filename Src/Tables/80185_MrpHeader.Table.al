table 80185 "Mrp Header"
{
    Caption = 'Mrp Header';
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
                    NoSeriesMgmt.TestManual(InventorySetup."Mrp Nos.");
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
            TableRelation = if("Source Type"=const(Customer)) customer else if("Source Type"=const(Vendor)) Vendor;
            trigger OnValidate()
            var
                Customer : Record Customer;
                Vendor : Record Vendor;
            begin
                case "Source Type" of
                    "Source Type"::Customer:
                        begin
                            if Customer.Get("Source No.") then begin
                                Name := Customer.Name;
                                Address := Customer.Address;
                                City := Customer.City;
                                Country := Customer.County;
                                "Phone No." := Customer."Phone No.";
                            end;
                        end;
                    "Source Type"::Vendor:
                        begin
                            if Vendor.Get("Source No.") then begin
                                Name := Vendor.Name;
                                Address := Vendor.Address;
                                City := Vendor.City;
                                Country := Vendor.County;
                                "Phone No." := Vendor."Phone No.";
                            end;
                        end;
                end;
            end;
        }
        field(4; Name; Text[30])
        {
            Caption = 'Name';
            Editable = false;
        }
        field(5; Address; Text[250])
        {
            Caption = 'Address';
            Editable = false;
        }
        field(6; City; Text[100])
        {
            Caption = 'City';
            Editable = false;
        }
        field(7; State; Code[10])
        {
            Caption = 'State';
            TableRelation = State;
        }
        field(8; Country; Code[10])
        {
            Caption = 'Country';
            Editable = false;
        }
        field(9; "Phone No."; Text[20])
        {
            Caption = 'Phone No.';
            Editable = false;
        }
        field(10; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(11; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(12; Status; Enum Status)
        {
            Caption = 'Status';
            Editable = false;
        }
        field(13; "No. Series"; Code[20])
        {
            Caption = 'No Series';
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
            InventorySetup.TestField("Mrp Nos.");
            NoSeriesMgmt.InitSeries(InventorySetup."Mrp Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;
    var
    InventorySetup : Record "Inventory Setup";
    NoSeriesMgmt : Codeunit NoSeriesManagement;
}
