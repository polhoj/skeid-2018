table 123456704 "CSD Seminar Comment Line"
{
    Caption = 'Seminar Comment Line';
    LookupPageId=123456707;
    DrillDownPageId=123456707;
    
    fields
    {
        field(10;"Table Name";Option)
        {
            Caption='table name';
            OptionMembers="Seminar","Seminar Registration","Posted seminar registration";
            OptionCaption='Seminar,Seminar registration,posted seminar registration';
            
        }
    
        field(20;"Document line no.";Integer)
        {
            caption='lineno';
        }
        field(30;"No.";code[20])
        {
            caption='no';
            TableRelation=if ("Table Name"=CONST(Seminar)) "CSD Seminar";
        }
        field(40;"Line no.";Integer)
        {
            caption='Line no';
        }
        field(50;"Date";Date)
        {
            caption='Date';
        }
        field(60;"Code";Code[10])
        {
            caption='code';
        }
        field(70;"Comment";Text[80])
        {
            caption='comment';
        }
    }
    keys
    {
        key(PK;"Table Name","Document Line No.","No.","Line No.")
        {
            Clustered = true;
        }
    }
    
    
}