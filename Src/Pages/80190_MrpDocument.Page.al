page 80190 "Mrp Document"
{
    ApplicationArea = All;
    Caption = 'Mrp Document';
    PageType = Document;
    SourceTable = "Mrp Header";
    
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
                field(Posted; Rec.Posted)
                {
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("No Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No Series field.';
                }
            }
            part(Lines; "Mrp Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");   
                Caption = 'Lines';
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Reopen)
            {
                ApplicationArea = All;
                Image = ReOpen;
                
                trigger OnAction()
                begin
                    Rec.Status := Enum::Status::Open;
                end;
            }
            action(Release)
            {
                ApplicationArea = All;
                Image = ReleaseDoc;
                
                trigger OnAction()
                var
                TxtLbl : Label 'Document Already in released state.';
                begin
                    if rec.Status = Enum::Status::Released then
                        Message(TxtLbl);
                    Rec.Status := Enum::Status::Released;
                end;
            }
            action(Post)
            {
                ApplicationArea = All;
                Image = Post;
                
                trigger OnAction()
                var
                    PostedMrpHeader : Record "Posted Mrp Header";
                    PostedMrpLine : Record "Posted Mrp Line";
                    MrpLine : Record "Mrp Line";
                    TxtLbl : Label 'Status must be released.';
                    Posted : Label 'Document %1 is posted.';
                    LineNo : Integer;
                    InventorySetup : Record "Inventory Setup";
                begin
                    if Rec.Status <> Enum::Status::Released  then 
                        Error(TxtLbl)
                    else begin
                        //We can also use Transfer Fields instead.
                        PostedMrpHeader.Init();
                        PostedMrpHeader."Source Type" := Rec."Source Type";
                        PostedMrpHeader."Source No." := Rec."Source No.";
                        PostedMrpHeader.Name := Rec.Name;
                        PostedMrpHeader.Address := Rec.Address;
                        PostedMrpHeader.City := Rec.City;
                        PostedMrpHeader.State := Rec.State;
                        PostedMrpHeader.Country := Rec.Country;
                        PostedMrpHeader."Phone No." := Rec."Phone No.";
                        PostedMrpHeader."Location Code" := Rec."Location Code";
                        PostedMrpHeader.Insert(true);
                        PostedMrpHeader.Modify();
                    end;
                    MrpLine.SetRange("Document No.",Rec."No.");
                    LineNo := 1000;
                    if MrpLine.FindSet() then
                        repeat
                            PostedMrpLine.Init();
                            PostedMrpLine."Document No." := PostedMrpHeader."No.";
                            PostedMrpLine."Line No." := LineNo;
                            PostedMrpLine.Insert(true);
                            PostedMrpLine.Type := MrpLine.Type;
                            PostedMrpLine."No." := MrpLine."No.";
                            PostedMrpLine.Description := MrpLine.Description;
                            PostedMrpLine.Quantity := MrpLine.Quantity;
                            PostedMrpLine."Unit Price" := MrpLine."Unit Price";
                            PostedMrpLine."Unit of measure code" := MrpLine."Unit of measure code";
                            PostedMrpLine."Line Discount" := MrpLine."Line Disount %";
                            PostedMrpLine."Line Discount Amount" := MrpLine."Line Discount Amount";
                            PostedMrpLine.Amount := MrpLine.Amount;
                            PostedMrpLine.Modify(true);
                            LineNo := LineNo + 10000;
                        until MrpLine.Next() = 0;
                    Rec.Posted := true;
                    Message(Posted,Rec."No.");
                end;
            }
        }
        area(Promoted)
        {
            actionref(MyPromotedAction1; Reopen)
            {
                
            }
            actionref(MyPromotedAction2; Release)
            {
                
            }
            actionref(MyPromotedAction3; Post)
            {
                
            }
        }
    }
}
