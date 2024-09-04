tableextension 80186 "Inventory Setup Ext" extends "Inventory Setup"
{
    fields
    {
        field(50003; "Mrp Nos."; Code[20])
        {
            Caption = 'Mrp Nos.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50004; "Posted Mrp Nos."; Code[20])
        {
            Caption = 'Posted Mrp Nos.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}
