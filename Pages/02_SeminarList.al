page 123456702 "CSD Seminar List"
{
    PageType = List;
    SourceTable = "CSD Seminar";
    Caption='Seminar list';
    Editable=false;
    CardPageId=123456702;
    UsageCategory=Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    
                }
                field(Name;Name)
                {

                }
                field("Seminar Duration";"Seminar Duration")
                {

                }
                field("Seminar Price";"Seminar Price")
                {

                }
                field("Minimum Participants";"Minimum Participants")
                {

                }
                field("Maximum Participants";"Maximum Participants")
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