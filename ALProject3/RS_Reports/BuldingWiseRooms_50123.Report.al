// report 50123 "Bulding Wise Rooms"
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     DefaultRenderingLayout = Buldings;

//     dataset
//     {
//         dataitem(BuldingTable;BuldingTab)
//         {
//             column(BuldingName;BuldingName)
//             {

//             }
//         }
//     }

//     requestpage
//     {
//         AboutTitle = 'Teaching tip title';
//         AboutText = 'Teaching tip content';
//         layout
//         {
//             area(Content)
//             {
//                 group(GroupName)
//                 {
//                     field(Name; SourceExpression)
//                     {
//                         ApplicationArea = All;

//                     }
//                 }
//             }
//         }

//         actions
//         {
//             area(processing)
//             {
//                 action(LayoutName)
//                 {
//                     ApplicationArea = All;

//                 }
//             }
//         }
//     }

//     rendering
//     {
//         layout(Buldings)
//         {
//             Type = RDLC;
//             LayoutFile = 'RS_Reports/Buldings.rdl';
//         }
//     }

//     var
//         myInt: Integer;
//         keoe
// }