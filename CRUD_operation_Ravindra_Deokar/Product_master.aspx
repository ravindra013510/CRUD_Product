<%@  Page  enableEventValidation="false"  Language="C#" AutoEventWireup="true" CodeBehind="Product_master.aspx.cs" Inherits="CRUD_operation_Ravindra_Deokar.Product_master" %>

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
                 <h1 class="jumbotron bg-primary  text-white text-center"> PRODUCT MASTER</h1>
               
            </div>
           
        </div>
       <br />
    <div class="row">
  <div class="col-sm">

      <asp:Label style="border:solid  2px;" ID="Label1" runat="server" Text="Select Catagory" CssClass="form-control"></asp:Label>
  </div>
  <div class="col-sm">
      
      <asp:DropDownList ID="ddl_catagory" style="border:solid  2px;"  runat="server" CssClass="form-control">
          <asp:ListItem Selected="True">--Select--</asp:ListItem>
      </asp:DropDownList>
  </div>
  <div class="col-sm">
  </div>
</div>
         <br />
             <div class="row">
  <div class="col-sm"></div>
  <div class="col-sm"> <asp:TextBox ID="textprodduct" CssClass="form-control" placeholder="Enter Product Name" runat="server" style="border:solid  2px;" ></asp:TextBox></div>
  <div class="col-sm">
      <asp:RequiredFieldValidator ControlToValidate="textprodduct" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Product" ForeColor="red"> </asp:RequiredFieldValidator>
  </div>
</div>

         <br /><br /><br />
            <div class="row col-md-6 mx-auto">
                <div class="col-md-6   mx-auto row  "> 
                                      <div class=" text-white  ">
           
               <input  runat="server" id="submit" type="button" value="SUBMIT" class="btn form-control btn-block bg-primary text-white"    />
          </div>
                    <div class="col-md-2"></div>
                  <div class=" text-white  ">

          <input  id="clr" value="CLEAR" runat="server"  type="button" class="btn form-control btn-block  bg-danger text-white"/>
          </div>

                </div>
 

            </div>
      
         </div>
    </form>
       <script type="text/javascript">

           $(document).ready(function () {
               getcatagory();
               $("#submit").click(function () {
                   //debugger;
                   submitdata();
                 
                      
               });
               $("#clr").click(function () {

                   $('#form1 input[type="text"]').val('');
                  // $('#textprodduct input[type="text"]').val('');
                   debugger;
               });
        });
        function submitdata() {
            debugger;
            $.ajax({
                type: "POST",
                url: "Product_master.aspx/insertdata",
                data: "{catagory:'" + $('#ddl_catagory option:selected').val() + "',product:'" + $('#textprodduct')[0].value + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                   
                   



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
                   url: "Product_master.aspx/getdata",
                   data: "{}",
                   contentType: "application/json; charset=utf-8",
                   dataType: "json",
                   success: function (msg) {

                       if (msg.d.length > 0 || msg.d[0] != "") {
                           $('#ddl_catagory').children('option').remove();
                           $("#ddl_catagory").append('<option value="0">----Select----</option>');
                           for (var i = 0; i < msg.d.length; i++) {
                               
                               $("#ddl_catagory").append("<option value='" + (msg.d[i].id) + "'>" + (msg.d[i].Name1) + "</option>");
                           }
                       }



                   },
                   error: function () {
                       jAlert('Loading Error', 'Error Message', function (r) { $('#ddlbatch').focus(); });
                   }
               });

           }
           //$.ajax({
           //    type: "POST",
           //    url: "StudentList.aspx/addTOSession",
           //    data: "{data:'" + email + "'}", //"{batchid:'" + $('#hiddenBatchID')[0].value + "',semester:'" + $('#ddlsemester option:selected').val() + "'}",
           //    contentType: "application/json; charset=utf-8",
           //    dataType: "json",
           //    success: function (msg) {
           //        if (msg.d[0] == "100") {
           //            jAlert('PLEASE SELECT VALID EMAIL', 'ERROR MESSAGE', function (r) {
           //            });
           //        }
           //        else
           //            fnGetMailPage();
           //        //window.open("../EMAIL/Send_MAIL.aspx");

           //    },
           //    error: function () {
           //        jAlert('Loading Error', 'Error Message', function (r) {
           //        });
           //    }
           //});

       </script>
</body>
</html>
