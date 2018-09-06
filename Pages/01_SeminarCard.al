page 123456701 "CSD Seminar Card"
{
    PageType = Card;
    SourceTable = "CSD Seminar";
    Caption='Seminar';


    layout
    {
        area(content)
        {
            group(General)
            {
                field("No.";"No.")
                {
                AssistEdit=true;
                trigger OnAssistEdit();
                begin
                    if AssistEdit then
                    CurrPage.Update;
                    end;

                }
                field(Name;Name)
                {

                }
                field("Search Name";"Search Name")
                {

                }
                field("Seminar Duration";"Seminar Duration")
                {

                }
                field("Minimum Participants";"Minimum Participants")
                {

                }
                field("Maximum Participants";"Maximum Participants")
                {

                }
                field(Blocked;Blocked)
                {

                }
                field("Last Date Modified";"Last Date Modified")
                {

                }
            }
            group(Invoicing)
            {
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {

                }
                field("VAT prod. posting group";"VAT prod. posting group")
                {

                }
                field("Seminar Price";"Seminar Price")
                {

                }
            }
        }
        area(FactBoxes)
        {
            systempart("links";Links)
            {

            }
            systempart("notes";Notes)
            {

            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Seminar") 
            {
                 action("Co&mments") 
                 { 
                     //RunObject=page "Seminar Comment Sheet"; 
                     //RunPageLink = "Table Name"= const(Seminar), 
                     // "No."=field("No."); 
                     Image = Comment; 
                     Promoted = true; 
                     PromotedIsBig = true; 
                     PromotedOnly = true; 
                     }
                      }
        }
    }
    
 
    
}