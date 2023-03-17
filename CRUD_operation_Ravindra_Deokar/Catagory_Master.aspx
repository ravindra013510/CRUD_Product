<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Catagory_Master.aspx.cs" Inherits="CRUD_operation_Ravindra_Deokar.Catagory_Master" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="~/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link href="~/dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
         <script src="../Scripts/jquery.js"  type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
</head>
    
<body>
    
    <form id="form1" runat="server">
         <div class="container">
                   <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark fixed-top">
            <a class="navbar-brand" href="Catagory_Master.aspx">Catagory Master</a>  <a class="navbar-brand" href="Product_master.aspx">Product  Master</a><a class="navbar-brand" href="Product_details.aspx">Product  Details</a> 
            
      
        
        </nav>             
          <br />
             <br />
             <br />
             <br />
        <div class="row">
            <div class="col-md-12">
                 <h1 class="jumbotron bg-primary  text-white text-center"> CATAGORY MASTER</h1>
               
            </div>
           
        </div>
       <br />
   
         <br />
             <div id="xx">
                              <div class="row">
  <div class="col-sm"></div>
  <div class="col-sm"> <asp:TextBox ID="textcatagory" CssClass="form-control" placeholder="Enter Catagory Name" runat="server" style="border:solid  2px;" ></asp:TextBox></div>
  <div class="col-sm">
      <asp:RequiredFieldValidator ControlToValidate="textcatagory" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Catagory" ForeColor="red"> </asp:RequiredFieldValidator>
  </div>
</div>
    
         <br /><br /><br />
            <div  class="row col-md-6 mx-auto">
                <div id="btndiv" class="col-md-6   mx-auto row   "> 
                                      <div class=" text-white  ">
              <asp:Button ID="submit" runat="server" Text="SUBMIT" CssClass=" btn form-control btn-block  bg-primary text-white"    />
          
          </div>
                    <div class="col-md-2"></div>
                  <div class=" text-white  ">
              <input  id="clr" value="CLEAR" runat="server"  type="button" class="btn form-control btn-block  bg-danger text-white"/>
          
          </div>

                       
                    
                </div>
             </div>

                <div></div>
                   </div>
 <br />
                <br /><br /><br />
                <br /><br /><br />
                <table id="table1" class="table table-condensed" style="width: 100%;">
            <tr>
            
               
                 <td style="width: 5%;color: blue;" align="center">
                  Catagory ID


                </td>
                 <td style="width: 5%;color: blue;" align="center">
           
                     <input id="Text1" type="text"  readonly="true"/></td>

                <td style="width: 10%;color: blue;" align="center">
                   Catagory Name
                </td>
                 <td style="width: 5%;color: blue;" align="center">
                   <input  type="text" id="textproductname"/>
                </td>
                   <td style="width: 8%;color: blue;" align="center">
               
                </td>
               
                  
            </tr>
                 <tr>
                     <td colspan="6">
                          <input  runat="server" id="submit1" type="button" value="SUBMIT" class="btn form-control btn-block bg-primary text-white"    />
                     </td>
                 </tr>
        </table>
                 <table id="autocompleteTable" class="table table-condensed" style="width: 100%;">
            <tr>
               <%-- <td style="width: 3%;" align="center">
                    <input id="chkselectall" type="checkbox" />
                </td>--%>
                <td style="width: 15%;color: blue;" align="center">
                    Sr No
                </td>
                 <td style="width: 15%;color: blue;" align="center">
                  Catagory ID


                </td>

                <td style="width: 25%;color: blue;" align="center">
                    Catagory Name
                </td>
                   
                <td style="width: 15%;color: blue;" align="center">
                  Edit
                </td>
                 <td style="width: 15%;color: blue;" align="center">
                  Delete
                </td>
                  
            </tr>
        </table>
          
      
         </div>

        
    </form>
    <script type="text/javascript">

        $(document).ready(function () {
           // alert("This is an alert message!");
            $('#table1').hide();
           
           
            getdata();
            jAlert('Confirmed: ' + r, 'Confirmation Results');
            $("#submit1").click(function () {

                update_data();
                $('#form1 input[type="text"]').val('');
                // $('#textprodduct input[type="text"]').val('');
                debugger;
            });
            

            $("#submit").click(function () {
                submitdata();
            });
            $("#clr").click(function () {

                $('#form1 input[type="text"]').val('');
                // $('#textprodduct input[type="text"]').val('');
                debugger;
            });

        });
        function update_data() {

            debugger;
            $.ajax({
                type: "POST",
                url: "Catagory_Master.aspx/updatedata",
                data: "{catagory_id: '" + $('#Text1')[0].value + "',product_name: '" + $('#textproductname')[0].value + "'}",
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
        function submitdata() {
            debugger;
            $.ajax({
                type: "POST",
                url: "Catagory_Master.aspx/insertdata",
                data: "{catagory:'" + $('#textcatagory')[0].value + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    alert("Record inserted");
                    //jAlert('Record inserted', 'Information Message');



                },
                error: function () {
                    alert("Record not inserted");
                }
            });

        }
        function getdata() {
            debugger;
            $.ajax({
                type: "POST",
                url: "Catagory_Master.aspx/getdata",
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
        function update1(count) {
            $.ajax({
                type: "POST",
                url: "Catagory_Master.aspx/delete",
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
        function update(ID) {
            
            $('#xx').hide();
            debugger;
            $.ajax({
                type: "POST",
                url: "Catagory_Master.aspx/update",
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
                                tds += "<a href='#' onclick='update(" + msg.d[z].id + ")' class='btn btn-info btn-xs'><b>Update</b>&emsp;<span class='glyphicon glyphicon-edit'></span></a> </br>"

                                tds += "</td>";
                                break;
                            case 4:
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
