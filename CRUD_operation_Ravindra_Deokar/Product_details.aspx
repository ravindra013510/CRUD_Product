<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product_details.aspx.cs" Inherits="CRUD_operation_Ravindra_Deokar.Product_details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

     <link href="~/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    
        <link href="~/dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
         <script src="../Scripts/jquery.js"  type="text/javascript"></script>
    <script src="table-pagination.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">
              <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark fixed-top">
            <a class="navbar-brand" href="Catagory_Master.aspx">Catagory Master</a>  <a class="navbar-brand" href="Product_master.aspx">Product  Master</a><a class="navbar-brand" href="Product_details.aspx">Product  Details</a>
            
      
        
        </nav> <br />
                <div></div>
                </div>
          <br />
            <table id="autocompleteTable" class="table table-condensed" style="width: 100%;">
            <tr>
               <%-- <td style="width: 3%;" align="center">
                    <input id="chkselectall" type="checkbox" />
                </td>--%>
                <td style="width: 5%;color: blue;" align="center">
                    Sr No
                </td>
                 <td style="width: 5%;color: blue;" align="center">
                  ProductId


                </td>

                <td style="width: 10%;color: blue;" align="center">
                   ProductName
                </td>
                   <td style="width: 8%;color: blue;" align="center">
                  CategoryId
                </td>
                <td style="width: 15%;color: blue;" align="center">
                  CategoryName
                </td>
                  
            </tr>
        </table>
             <table id="table1" class="table table-condensed" style="width: 100%;">
            <tr>
            
               
                 <td style="width: 5%;color: blue;" align="center">
                  ProductId


                </td>
                 <td style="width: 5%;color: blue;" align="center">
           
                     <input id="Text1" type="text"  readonly="true"/></td>

                <td style="width: 10%;color: blue;" align="center">
                   ProductName
                </td>
                 <td style="width: 5%;color: blue;" align="center">
                   <input  type="text" id="textproductname"/>
                </td>
                   <td style="width: 8%;color: blue;" align="center">
                  Category
                </td>
                <td style="width: 15%;color: blue;" align="center">
                 <select id="ddl_catagory" name="cat">
  <option value="0">select</option>

</select>
                </td>
                  
            </tr>
                 <tr>
                     <td colspan="6">
                          <input  runat="server" id="submit1" type="button" value="SUBMIT" class="btn form-control btn-block bg-primary text-white"    />
                     </td>
                 </tr>
        </table>
        </div>
    </form>
     <script type="text/javascript">

         $(document).ready(function () {
             $('#table1').hide();
             getdata();
             $('#autocompleteTable').DataTable();
             
               $("#submit1").click(function () {
                   update_data();
                   $('#form1 input[type="text"]').val('');
                   // $('#textprodduct input[type="text"]').val('');
                   debugger;
               });
              
        });
         function update_data() {
             
            debugger;
            $.ajax({
                type: "POST",
                url: "Product_details.aspx/updatedata",
                data: "{id: '" + $('#Text1')[0].value + "',product_name: '" + $('#textproductname')[0].value + "',catagory_id: '" + $('#ddl_catagory option:selected').val() +"'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    window.location.reload();
                    if (msg.d.length > 0) {
                        //addTableRow('#autocompleteTable', msg);
                      

                    }



                },
                error: function () {
                    jAlert('Loading Error', 'Error Message', function (r) { $('#ddlbatch').focus(); });
                }
            });

         }
         function getdata() {
             debugger;
             $.ajax({
                 type: "POST",
                 url: "Product_details.aspx/getdata",
                 data: "{}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (msg) {

                     if (msg.d.length > 0) {
                         addTableRow('#autocompleteTable', msg);


                     }



                 },
                 error: function () {
                     jAlert('Loading Error', 'Error Message', function (r) { $('#ddlbatch').focus(); });
                 }
             });

         }
         function getcatagory() {
             debugger;
             $.ajax({
                 type: "POST",
                 url: "Product_details.aspx/getcatagory",
                 data: "{}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (msg) {

                     if (msg.d.length > 0 || msg.d[0] != "") {
                         $('#ddl_catagory').children('option').remove();
                         $("#ddl_catagory").append('<option value="0">----Select----</option>');
                         for (var i = 0; i < msg.d.length; i++) {
                             /*$("#ddl_catagory").append("<option>" + (msg.d[i].id).toUpperCase() + "</option>");*/
                             $("#ddl_catagory").append("<option value='" + (msg.d[i].id) + "'>" + (msg.d[i].Name1) + "</option>");
                         }
                     }



                 },
                 error: function () {
                     jAlert('Loading Error', 'Error Message', function (r) { $('#ddlbatch').focus(); });
                 }
             });

         }
          
         function update(ID) {
             debugger;
             $.ajax({
                 type: "POST",
                 url: "Product_details.aspx/update",
                 data: "{ID:'" + ID + "'}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (msg) {
                     if (msg.d.length > 0) {
                         $('#autocompleteTable').hide();
                         $('#table1').show();
                         $('#textproductname')[0].value = msg.d[0].Name1;
                         $('#Text1')[0].value = msg.d[0].id;
                         getcatagory();
                        
                         
                     }
                     else {
                         jAlert('Record not found', 'Information Message', function (r) { $('#txtfeetype').focus(); });

                     }
                 },
                 error: function () {
                     jAlert('Loading Error', 'Error Message', function (r) { $('#txtfeetype').focus(); });
                 }
             });
         }
         function update1(count) {
             $.ajax({
                 type: "POST",
                 url: "Product_details.aspx/delete",
                 data: "{ID:'" + count + "'}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (msg) {
                     window.location.reload();
                     if (msg.d.length > 0) {
                       
                     }
                     else {
                       

                     }
                 },
                 error: function () {
                    
                 }
             });
         }
         //function delete(ID) {
         //    $.ajax({
         //        type: "POST",
         //        url: "Product_details.aspx/delete",
         //        data: "{ID:'" + ID + "'}",
         //        contentType: "application/json; charset=utf-8",
         //        dataType: "json",
         //        success: function (msg) {
         //            if (msg.d.length > 0) {
         //                $('#table1').show();
         //                $('#autocompleteTable').hide();
         //                AssignvalueTextBoxes(msg.d[0]);
         //            }
         //            else {
         //                jAlert('Record not found', 'Information Message', function (r) { $('#txtfeetype').focus(); });

         //            }
         //        },
         //        error: function () {
         //            jAlert('Loading Error', 'Error Message', function (r) { $('#txtfeetype').focus(); });
         //        }
         //    });
         //}

         function addTableRow(jQtable, msg) {
            
             var table = document.getElementById(jQtable.replace('#', ''));
             jQtable = $(jQtable);

             for (var z = 0; z < msg.d.length; z++) {
                 var count = table.rows.length;
                 jQtable.each(function () {
                     var $table = $(this);
                     // Number of td's in the last table row         
                     var n = $('tr:last td', this).length + 2;
                     var tds;
                     debugger;
                         tds = "<tr >";

                     for (var i = 0; i < n; i++) {
                         switch (i) {
                             case 0:
                         
                                 tds += "<td style='width:5%;'align='center'>";
                                 tds += count;
                                 tds += "</td>";
                                 break;
                             case 1:
                                 tds += "<td style='width:5%;'align='center' >";
                                 tds += msg.d[z].id;
                                
                                 tds += "</td>";
                                 break;
                             case 2:
                                 tds += "<td style='width:5%;'align='center' >";
                                 tds += msg.d[z].Name1;
                                 tds += "</td>";
                                 break;
                             case 3:
                                 tds += "<td style='width:5%;'align='center' >";
                                 tds += msg.d[z].Name2;
                                 tds += "</td>";
                                 break;


                             case 4:
                                 tds += "<td style='width:25%;'align='center' >";
                                 tds += msg.d[z].Name3
                                 tds += "</td>";
                                 break;
                             case 5:
                                 tds += "<td style='width:5%;'align='center' >";
                                 tds += "<a href='#' onclick='update(" + msg.d[z].id + ")' class='btn btn-info btn-xs'><b>Update</b>&emsp;<span class='glyphicon glyphicon-edit'></span></a> </br>"
                                 
                                 tds += "</td>";
                                 break;
                             case 6:
                                 tds += "<td style='width:5%;'align='center' >";
                              
                                 tds += "<a href='#' onclick='update1(" + msg.d[z].id + ")' class='btn btn-info btn-xs'><b>Delete</b>&emsp;<span class='glyphicon glyphicon-edit'></span></a>"
                                 tds += "</td>";
                                 break;
                             

                         }
                     }
                     tds += '</tr>';
                     //total
                     if ($('tbody', this).length > 0) {
                         $('tbody', this).append(tds);
                     }
                     else {
                         $(this).append(tds);
                     }
                 });
             }

             // TOTAL DETAIL ROW
             //jQtable.each(function () {
             //    var $table = $(this);
             //    // Number of td's in the last table row         
             //    var n = $('tr:last td', this).length + 1;
             //    var tds;


             //    for (var i = 0; i < n; i++) {
             //        switch (i) {
             //            case 4:

             //                tds += "<td colspan='8.8' align='center'>TOTAL";
             //                tds += "</td>";
             //                break;
             //            case 5:
             //                tds += "<td style='width:6%; align='right'>";
             //                tds += msg.d[msg.d.length - 1].AdmissionFee + ".00"
             //                tds += "</td>";
             //                break;
             //            //                        case 6:
             //            //                            tds += "<td style='width:3%;'>";
             //            //                            tds += msg.d[msg.d.length - 1].GrandTotalBalanceFee;
             //            //                            tds += "</td>";
             //            //                            break;
             //            //                        case 7:
             //            //                            tds += "<td style='width:5%;'align='center' >";
             //            //                            tds += "</td>";
             //            //                            break;
             //            //                        case 8:
             //            //                            tds += "<td style='width:5%;'align='center' >";
             //            //                            tds += "</td>";
             //            //                            break;
             //        }
             //    }
             //    tds += '</tr>';
             //    //total
             //    if ($('tbody', this).length > 0) {
             //        $('tbody', this).append(tds);
             //    }
             //    else {
             //        $(this).append(tds);
             //    }
             //});

             //
         }


     </script>
</body>
</html>
