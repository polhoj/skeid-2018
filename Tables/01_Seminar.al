table 123456701 "CSD Seminar"
{
    Caption = 'Seminar';
    LookupPageId=123456702;
    DrillDownPageId=123456702;
    fields
    {
        field(10; "No."; Code[20])
        {
            Caption = 'No';
            trigger
            OnValidate();
            begin
                if "No." <> xRec."No." then begin
                    SeminarSetup.GET; NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(20; "Name"; Text[50])
        {
            Caption = 'Name';
            trigger
            OnValidate();
            begin
                if("Search Name" = UpperCase(xRec.Name)) or
                ("Search Name" = '') then
                    "Search Name" := Name;
            end;
        }
        field(30; "Seminar Duration"; Decimal)
        {
            Caption = 'Duration';
            DecimalPlaces = 0 : 1;
        }
        field(40; "Minimum Participants"; Integer)
        {
            Caption = 'Minimum participants';
        }
        field(50; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum participants';
        }
        field(60; "Search Name"; Code[50])
        {
            Caption = 'serach name';
        }
        field(70; "Blocked"; Boolean)
        {
            Caption = 'Blocked';
        }
        field(80; "Last Date Modified"; Date)
        {
            Caption = 'Last date modified';
            Editable = false;
        }
        field(90; "Comment"; Boolean)
        {
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(100; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar price';
            AutoFormatType = 1;
        }
        field(110; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen prod posting group';
            TableRelation = "Gen. Product Posting Group";
            trigger
            OnValidate();
            begin
                if(xRec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group") then begin
                    if GenProdPostingGroup.ValidateVatProdPostingGroup
                    (GenProdPostingGroup, "Gen. Prod. Posting Group") then
                        Validate("VAT Prod. Posting Group",
                    GenProdPostingGroup."Def. VAT Prod. Posting Group");
                end;
            end;
        }
        field(120; "VAT prod. posting group"; Code[10])
        {
            Caption = 'Vat prod posting group';
            TableRelation = "VAT Product Posting Group";
        }
        field(130; "No. Series"; Code[10])
        {
            Caption = 'No series';
            Editable = false;
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
    trigger
    OnInsert();
    begin
        if "No." = '' then begin
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger
    OnModify();
    begin
        "Last Date Modified" := Today;

    end;

    trigger
    OnRename();
    begin
        "Last Date Modified" := Today;
    end;

    trigger
    OnDelete();
    begin
        //CommentLine.Reset; 
        //CommentLine.SetRange("Table Name", 
        //CommentLine."Table Name"::Seminar); 
        //CommentLine.SetRange("No.","No."); 
        // CommentLine.DeleteAll;
    end;






    var
        SeminarSetup: Record "CSD Seminar Setup";
        seminar: Record "CSD Seminar";
        GenProdPostingGroup: Record "Gen. Product Posting Group";
        NoSeriesMgt: Codeunit "NoSeriesManagement";

    procedure AssistEdit(): Boolean;

    begin
        with Seminar do
        begin
            Seminar := Rec;
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos."
            , xRec."No. Series", "No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                Rec := Seminar;
                exit(true);
            end;
        end;
    end;
}