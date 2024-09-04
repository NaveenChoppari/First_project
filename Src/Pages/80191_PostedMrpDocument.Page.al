page 80191 "Posted Mrp Document"
{
    ApplicationArea = All;
    Caption = 'Posted Mrp Document';
    PageType = Document;
    SourceTable = "Posted Mrp Header";
    Editable = false;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';  
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Source Type"; Rec."Source Type")
                {
                    ToolTip = 'Specifies the value of the Source Type field.';
                }
                field("Source No."; Rec."Source No.")
                {
                    ToolTip = 'Specifies the value of the Source No. field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the value of the City field.';
                }
                field(State; Rec.State)
                {
                    ToolTip = 'Specifies the value of the State field.';
                }
                field(Country; Rec.Country)
                {
                    ToolTip = 'Specifies the value of the Country field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
            }
            part(Lines; "Posted Mrp Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
                UpdatePropagation = Both;
                Caption = 'Lines';
            }
        }
    }
}
