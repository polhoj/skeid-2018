pageextension 123456700 "CSD Resource Card Ext" extends "Resource Card"
// CSD1.00 - 2018-02-01 - D. E. Veloper
{
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type"; "CSD Resource Type")

            {

            }
            
            field("CSD Quantity per day"; "CSD Quantity per day")
            {

            }

            }
        addafter("Personal Data")
        {
            group("CSD Room")
            {
                
                field("CSD Maximum Participants"; "CSD Maximum Participants")
                {

                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        showmaxfield :=(Type=type::Machine);
        currpage.Update(false);
    end;

    var
        [indataset]
        showmaxfield:Boolean;
}