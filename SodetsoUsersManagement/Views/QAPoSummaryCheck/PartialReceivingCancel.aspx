<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<SodetsoUsersManagement.Models.EditUserModel>" %>
<%--<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
      <%: ViewBag.PageTitle = "Partial Receiving of PO Summary" %>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

       <!-- row -->
    <div class="row">
        <div class="col-md-6">
            <% if (TempData["Feedmill PO Summary CheckList Updated Successfully!"] != null)
               { %>
            <div class="alert alert-success alert-dismissable">
                <i class="fa fa-check"></i>
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <b>Alert!</b> Success.
       
            </div>
            <% } %>
        </div>
    </div>

    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header">
       
                                     
                </div>
                <!-- /.box-header -->
                <!-- form start -->
               <% using (Html.BeginForm("CancelQAForReceivingRawMaterials", null, FormMethod.Post, new { role = "form", id = "FormUser", enctype = "multipart/form-data" }))

                   { %>

                <div class="box-body">
                    <div class="row">
                        <div class="col-md-6">

                            <!-- HERE 1 -->

                                       <div class="form-group">


<table class="table table-bordered" style="font-size:13px">

    <thead>
        <tr>
            <th colspan="4" style="text-align:center; font-size:14px; background-color:#3c8dbc;color:white;">RAW MATERIAL INFORMATION'S</th>

        </tr>
    </thead>
                <tr>
                                     <td>Item Code</td>
                    <td> <%: Html.TextBoxFor(model => model.item_code, new { @class = "form-control", @placeholder="Enter Item Code", ReadOnly="true"}) %>        </td>
             <td>Description</td>
                    <td>


                                <%: Html.TextBoxFor(model => model.item_description, new { @class = "form-control", @placeholder="Enter Item Description", @required = "true", @ReadOnly="true"}) %>
                                <%: Html.ValidationMessageFor(model => model.item_description, "", new { @class = "text-danger" }) %>
                                <input type="hidden" class="form-control" name="po_sum_id" id="po_sum_id" value="<%: Model.po_sum_id %>" />
                                                     <input type="text" class="form-control" name="checklist_remarks" value="<%: Model.pepe%>" style="display:none;" />

                    </td>
                </tr>
                <tr>
            <td>Supplier</td>
                    <td>        <%: Html.TextBoxFor(model => model.vendor_name, new { @class = "form-control", @placeholder="Enter Vendor Name", ReadOnly="true"}) %>  </td>



                    <td>Date of Checking</td>
                    <td><%--<%: Html.TextBoxFor(x=> x.mfg_date, new { @Value = DateTime.Now.ToShortDateString(), @class="form-control",@id="dateToday", ReadOnly="true" })%>--%>
                 <%--       <input type="date" name="date_modified_status" id="dateToday" class="form-control" readonly />--%> <%--change mfg_date--%>
                     <%: Html.TextBoxFor(model => model.date_modified_status, new { @class = "form-control", @placeholder="Manufacturing Date", @required ="true",@id="dateToday",@ReadOnly="true" }) %>
                         <%: Html.ValidationMessageFor(model => model.date_modified_status, "", new { @class = "text-danger" }) %>


                    </td>
<%--                    buje2--%>

                </tr>
                
        <thead>
        <tr>
            <th colspan="4" style="text-align:center; font-size:14px; background-color:#3c8dbc;color:white;">RECEIVING INFORMATION'S</th>

        </tr>
    </thead>



             <tr>
               		             <td>Po No.</td>
                    <td> <%: Html.TextBoxFor(model => model.po_number, new { @class = "form-control", @placeholder="Enter Middlename", ReadOnly="true"}) %>        </td>
                    <td>  PO Date</td>
             <td>                     <%: Html.TextBoxFor(model => model.po_date, new { @class = "form-control", @placeholder="Enter PO Date", ReadOnly="true"}) %></td>

             
             
         
         
         </tr>










               <tr>
                    <td>PR No.</td>
                    <td> <%: Html.TextBoxFor(model => model.pr_number, new { @class = "form-control", @placeholder="Enter PR NO", ReadOnly="true"}) %>        </td>
                    <td>  PR Date</td>
             <td>                     <%: Html.TextBoxFor(model => model.pr_date, new { @class = "form-control", @placeholder="Enter PR Date", ReadOnly="true"}) %></td>
                </tr>











               <tr>


<%--buje1--%>
                 
                   
                     <td>Cancelation Reason</td>
                    <td>                     
                        <input type="hidden" id="num1" name="qty_ordered" class="form-control" value="<%: Model.qty_ordered %>" readonly/>


                                <select id="cars" name="truck_approval3" class="form-control" style="background-color:yellow;">
                                                  
                                                        <option value="CHANGE OF QUANTITY ">CHANGE OF QUANTITY </option>
                                                        <option value="OUT OF STOCK">OUT OF STOCK</option>
                                                                <option value="RE-PR">RE-PR</option>
                                                                       <option value="OTHERS">OTHERS</option>

                                                                        </select>


                    </td>
                   
                   
                   <td>Partial Quantity</td>
              <td>
                  <%: Html.TextBoxFor(model => model.qty_uom, new { @class = "form-control", @placeholder="Enter UOM", ReadOnly="true",@style="display:none;"}) %>       

                                           <input type="text" class="form-control" value="<%: Model.Password %>" readonly/>

              </td>




                </tr>
                

    <tr>
           <%--     buje 5--%>


                    <td>  Mfg. Date</td>
             <td style="font-size:20px">  
                 

                     <%: Html.TextBoxFor(model => model.mfg_date, new { @class = "form-control", @placeholder="Manufacturing Date", @required ="false",@id="master1",@autocomplete="off",@ReadOnly="true" }) %>
                       <%: Html.ValidationMessageFor(model => model.mfg_date, "", new { @class = "text-danger" }) %>

                        <input type="hidden" id="mastepogi1" class="form-control"/>    

                                    <input type="hidden" id="days" class="form-control"/>    
          

 <%--                   <%: Html.ValidationMessageFor(model => model.mfg_date) %>--%>



             </td>


                   <td>  Expiry Date</td>
             <td style="font-size:20px">
<%: Html.TextBoxFor(model => model.expiry_date, new { @class = "form-control", @placeholder="Expiry Date", @required ="false", @autofocus="autofocus",@autocomplete="off",@ReadOnly="true"}) %>
                                   <%: Html.ValidationMessageFor(model => model.expiry_date, "", new { @class = "text-danger" }) %>

                                  <input type="hidden" id="masterpogi2" class="form-control"/>    


             </td>


                </tr>

      <tr>
                

                                       <td>  Quantity Reject</td>
                                      <td>    
                                                           <input type="text" class="form-control" value="<%: Model.qty_reject %>" readonly/>
                                          
          <%: Html.TextBoxFor(model => model.stacking_level, new { @class = "form-control requiredfilled", @placeholder="Expected Delivery",@type="number", @required ="true", @autofocus="autofocus",@id="expected",@autocomplete="off",@style="display:none"}) %>
                                   <%: Html.ValidationMessageFor(model => model.stacking_level, "", new { @class = "text-danger" }) %>

                                  
                               <input type="hidden" id="tenPercentComputation" value="0" class="form-control"/>    



                             </td>
          
      <td>Remarks</td>
                    <td>

            <%: Html.TextBoxFor(model => model.qty_total_delivered, new { @class = "form-control requiredfilled", @placeholder="Input your Remarks",@type="text", @required = "true", @id="ActualDelivered",@autocomplete="off"}) %>
                                <%: Html.ValidationMessageFor(model => model.qty_total_delivered, "", new { @class = "text-danger" }) %>





                                            <%: Html.TextBoxFor(model => model.tenPercentAllow, new{ @class = "form-control", @placeholder="Allowable ten", @required ="true",@id="tenPercentMinusActual",@min="0",@style="display:none"}) %>
               
                    <%: Html.ValidationMessageFor(model => model.tenPercentAllow, "", new { @class = "text-danger" }) %>







<%--                                                   <%: Html.TextBoxFor(model => model.tenprecentallowableused, new { @class = "form-control", @placeholder="Qty Missing", @required = "true", @id="tenPercentMinusActual",ReadOnly ="true",style = "display: none;"}) %>--%>
                    </td>
                </tr>

          <tr class="<%: Session["Position"] %>">
                

                       <td>  Quantity Missing</td>
             <td>                       
                    <%: Html.TextBoxFor(model => model.qty_missing, new { @class = "form-control", @placeholder="Qty Missing", @required = "true", @id="missing",ReadOnly ="true"}) %>
                                <%: Html.ValidationMessageFor(model => model.qty_missing, "", new { @class = "text-danger" }) %>


                            <%: Html.TextBoxFor(model => model.CompareActualDelivedtoReject, new { @class = "form-control", @placeholder="Qty Compare", @required = "true", @id="CompareActualDelivedtoReject",ReadOnly ="true",@min="0"}) %>
                                <%: Html.ValidationMessageFor(model => model.CompareActualDelivedtoReject, "", new { @class = "text-danger" }) %>
               
             </td>


      <td>Checked By</td>
                    <td>


                           <input type="text" id="num222" name="QA_by" value="<%: Session["Firstname"] %>&nbsp;<%: Session["Lastname"] %>" class="form-control" readonly/>
                    </td>
                </tr>






       <tr style="display:none;">
                  <td>No. Actual Receiving</td>
                    <td>

                        <input type="hidden" name="qty_delivered" class="form-control" id="addition" readonly/>
                    </td>



                              <td>  Import Date</td>
             <td>                       
    <input type="hidden" class="form-control" value="<%: Model.import_date %>" readonly/>

             </td>
    <%--   buje6--%>
                </tr>



           <tr class="<%: Session["Position"] %>">
<%--       hide muna 4/7/2020   buje4--%> 

                        <td>Qty. Waiting for Delivered</td>
             <td>


                 <input type="text" class="form-control" value="<%: Model.qty_waiting %>" readonly/>

                   



             </td>

         <td>Total Received</td>
                    <td>


                               <input type="text" class="form-control" id="num3" name="qty_total_delivered" value="<%: Model.qty_delivered%>" readonly/>

                    </td>
                </tr>





         <tr>
              <%--   No. Qty Actual Neededbuje8--%>
                    <td>Actual Remaining</td>
             <td>



                                                 
                      

                         <input type="text" id="remaining" value="<%: Model.qty_remarks%>" class="form-control" readonly />

                 <b style="display:none">
                         <option value="Damage">Damaged </option>

                            <select class="form-control" name="remarksof_reject1" style="background-color:yellow;">
                                                  
                                       <option value="Damage">Damaged </option>

                                                                        </select>
                 
                            <select class="form-control" name="remarksof_reject2" style="background-color:yellow;">
                                                          <option value="Damage">Damaged </option>
                               
                                        </select>
                                
                            <select class="form-control" name="remarksof_reject3" style="background-color:yellow;">
                                        <option value="Damage">Damaged </option>
                                                  
                                       </select>

                                
                            <select class="form-control" name="remarksof_reject4" style="background-color:yellow;">
                                                       <option value="Damage">Damaged </option>   
                                       </select>
                                
                            <select class="form-control" name="remarksof_reject5" style="background-color:yellow;">
                                                         <option value="Damage">Damaged </option> 
                               
                                        </select>
                                
                            <select class="form-control" name="remarksof_reject6" style="background-color:yellow;">
                                                  
                               
                                        <option value="Damage">Damaged </option>
                                                             
                                                                        </select>

                   <select class="form-control" name="rejectqty1" style="background-color:yellow;">
                                                  
                               
                               <option value="Damage">Damaged </option>
                                                             
                                                                        </select>

                   <select class="form-control" name="rejectqty2" style="background-color:yellow;">
                                                  
                                       <option value="Damage">Damaged </option>

                                                             
                                                                        </select>

                   <select class="form-control" name="rejectqty3" style="background-color:yellow;">
                                                  
                               
                               <option value="Damage">Damaged </option>
                                                             
                                                                        </select>

                   <select class="form-control" name="rejectqty4" style="background-color:yellow;">
                                                 <option value="Damage">Damaged </option>   
                       
                               </select>
                               
                   <select class="form-control" name="rejectqty5" style="background-color:yellow;">
                                                  
                                       <option value="Damage">Damaged </option>
                       </select>
                       
                   <select class="form-control" name="rejectqty6" style="background-color:yellow;">
                                                  
                               
                               <option value="Damage">Damaged </option>

                                                             
                                                                        </select>


                     </b>




             
                    <%--      <%: Html.TextBoxFor(model => model.qty_waiting, new { @class = "form-control", @placeholder="Enter Quantity Delivered"}) %>--%>
     <%--            <input type="number" name="qty_waiting" class="form-control" min="0"  id="subt" readonly/>--%>
                               <%: Html.TextBoxFor(model => model.qty_waiting, new { @class = "form-control", @placeholder="Qty Waiting", @required = "true", @id="subt",ReadOnly ="true",@style="display:none"}) %>
                                <%: Html.ValidationMessageFor(model => model.qty_waiting, "", new { @class = "text-danger" }) %>
                 
                 
                 
                 <%-- <span id="sum">0</span>--%>

             </td>


                      <td>                   Actual Count Updated</td>
        
                   <td>                                <%: Html.TextBoxFor(model => model.batch_number, new { @class = "form-control requiredfilled", @placeholder="Actual Count",@id="total",@autocomplete="off",@ReadOnly="true"}) %>
                           <%: Html.ValidationMessageFor(model => model.batch_number, "", new { @class = "text-danger" }) %>

                   </td>
                </tr>




          <tr class="<%: Session["Position"] %>">
                <td>No. Of Items Qty Good</td>
                    <td>
                             


              <%: Html.TextBoxFor(model => model.Password, new { @class = "form-control", @placeholder="Enter No. of Good", @required = "true", @id="reject",ReadOnly ="true",@min="0"}) %>
                                <%: Html.ValidationMessageFor(model => model.Password, "", new { @class = "text-danger" }) %>

                                       <input type="text" id="QtyGoodx1" placeholder="Qtyx1" class="form-control"/>
                         <input type="text" id="actualGood" value="<%: Model.qty_good %>" class="form-control" readonly />
                                  <input type="text" id="totalQtyGood" name="qty_good" placeholder="totalQty" class="form-control"/>
                           
                        <input type="text" id="OrderVsGood" placeholder="totalQty" class="form-control"/>
                                       <input type="text" id="OrderVsGoodValidation" placeholder="totalQty" class="form-control"/>



                    </td>
                    <td>Confrim No. Of Items Qty  Good</td>
             <td>
                             <%: Html.TextBoxFor(model => model.CPassword, new { @class = "form-control", @placeholder = "Confirm No. of Good", id = "CPassword", @required = "true",ReadOnly ="true" }) %>
                                <%: Html.ValidationMessageFor(model => model.CPassword, "", new { @class = "text-danger" }) %>

                                                        <input type="text" id="QtyRejectx1" placeholder="RejectQtyx1" class="form-control"/>
                         <input type="text" id="actualReject" value="<%: Model.qty_void %>" class="form-control" readonly />
                                  <input type="text" id="totalQtyReject" name="qty_void" placeholder="totalQtyReject" class="form-control"/>

<%--                    <input type="text" id="Proc1GoodMinusOrdered" placeholder="totalQtyReject" class="form-control"/>
                                                   <input type="text" id="GoodMinusOrdered" value="<%: Model.qty_remarks %>" placeholder="totalQtyReject" class="form-control"/>--%>
                      <input type="text" id="GoodMinusOrderedTotal" name="qty_remarks" placeholder="totalQtyReject" class="form-control"/>

<%--                                                      <input type="text" id="FinalFormulaNegative" class="form-control"/>--%>
                      <%: Html.TextBoxFor(model => model.FinalFormulaNegative, new { @class = "form-control", @placeholder = "Confirm No. of Good", id = "FinalFormulaNegative", @required = "true",ReadOnly ="true",min="0" }) %>
                                <%: Html.ValidationMessageFor(model => model.FinalFormulaNegative, "", new { @class = "text-danger" }) %>
             </td>

              
            
                </tr>

            </table>




<!-- 2nd na besss -->
                                                      <div class="form-group">
<%--break na gerard--%>









                            </div>





                            </div>




                            <!-- HERE 2 -->


                                                                   <div align="right">
  <%--                              <input type="submit" onclick="myFunction()">--%>
              
                    <button type="submit" onclick="myFunction()" class="btn btn-primary">Cancel Partial Receiving</button>
                            <button type="submit" onclick="myFunctionCancel()" class="btn btn-warning">Back</button>

                </div>



                        </div>





 







                        <div class="col-md-6">

<%--                            <i>Upon arrival </i>--%>
<table class="table table-bordered" style="visibility:hidden">
      <tr style="background-color:#3c8dbc;color:white;">
      <th scope="col">TRUCK INSPECTION</th>
      <th scope="col" style="text-align:center;">&#10004; /&nbsp;</th>
      <th scope="col">REMARKS</th>
  
    </tr>
                <tr>
                    <td>Partial Receiving</td>
                    <td style="width:100px">
           <fieldset id="truck_approval1" class="radio-inline">

    
  
      <input type="text" id="partial" value="<%: Model.stacking_level %>">
                     <input type="text" id="partial2" value="<%: Model.stacking_level %>">
                                    <input type="text" id="totalpartial" name="truck_approval1">
    </fieldset>


                    </td>
                    <td>   
                          
      <input type="text" id="qtydelivered" value="<%: Model.qty_total_delivered %>">
                              <input type="text" id="totalqtydelivered" name="truck_remarks1">
<%--           <%: Html.TextBoxFor(model => model.truck_remarks1, new { @class = "form-control requiredfilled", @placeholder="Enter Some Text", @required ="true",autocomplete="true"}) %>
                          <%: Html.ValidationMessageFor(model => model.truck_remarks1, "", new { @class = "text-danger" }) %>--%>


                    </td>
        
                   
                </tr>
                <tr>
                    <td>Floorboards are dry and clean</td>
                    <td>           <fieldset id="truck_approval2" class="radio-inline">
                              <input type="text" id="qty_good" value="<%: Model.qty_good %>"><b>qtygood</b>
                               <input type="text" id="qty_good2" value="<%: Model.Password %>"><b>qtygood</b>
                               <input type="text" id="total_qty_good" name="truck_approval2"><b>totalqtygood</b>

   

    </fieldset>                       </td>
                    <td>
                              <input type="text" id="qty_rejectfinal" value="<%: Model.qty_void %>"><b>reject1</b>
                                  <input type="text" id="qty_rejectfinal2" value="<%: Model.qty_reject %>"><b>reject2</b>
                              <input type="text" id="total_qty_rejectfinal" name="truck_remarks2"><b>finalreject</b>
       <%--                            <%: Html.TextBoxFor(model => model.truck_remarks2, new { @class = "form-control requiredfilled", @placeholder="Enter Some Text", @required ="true",@autocomplete="off"}) %>
                          <%: Html.ValidationMessageFor(model => model.truck_remarks2, "", new { @class = "text-danger" }) %>--%>


                    </td>
             
                </tr>
                <tr>
                    <td>No evidence of chemical spills, garbage, waste or spoiled foods</td>
                    <td>           <fieldset id="truck_approval3" class="radio-inline">

    
  
      <input type="radio" name="truck_approval3" value="DisApproved">&#967;
    </fieldset></td>
                    <td>
                                   <input type="text" value="wala" name="truck_remarks3"><b>finalreject</b>

                    </td>
               
                </tr>
         <tr>
                    <td>No insect and rodent activity</td>
                    <td>                                            
                                   <fieldset id="group4" class="radio-inline">
      <input type="radio" name="truck_approval4" value="Approved" checked>
&#10004;
    
  
      <input type="radio" name="truck_approval4" value="DisApproved">&#967;
    </fieldset>
                    </td>
                    <td>
                                                      <input type="text" value="wala" name="truck_remarks4"><b>finalreject</b>
           <%--            <%: Html.TextBoxFor(model => model.truck_remarks4, new { @class = "form-control requiredfilled", @placeholder="Enter Some Text", @required ="true",@autocomplete="off"}) %>
                          <%: Html.ValidationMessageFor(model => model.truck_remarks4, "", new { @class = "text-danger" }) %>--%>

                    </td>
               
                </tr>
       
            </table>






                            <div class="form-group" style="visibility:hidden">


                                  <input type="text" name="unload_approval1" value="Approved" >
                                  <input type="text" name="unload_approval2" value="Approved" >
                                  <input type="text" name="unload_approval3" value="Approved" >
                                  <input type="text" name="unload_approval4" value="<%: Model.papa %>" >
                               <input type="text" name="unload_remarks1" value="Approved">
                               <input type="text" name="unload_remarks2" value="Approved">
                               <input type="text" name="unload_remarks3" value="Approved">
                               <input type="text" name="unload_remarks4" value="Approved">


                            <!-- 3rd  FINAL REMARKS-->
                                <input type="text" name="checking_approval1" value="Final" >
                                                       <input type="text" name="checking_approval2" value="Final" >
                                                       <input type="text" name="checking_remarks1" value="Final" >
                                                       <input type="text" name="checking_remarks2" value="Final" >

                            <!-- ENND  #3C8DBC#3C8DBC-->
                                                        <input type="text" name="qty_reject" value="Finalreject" >
                             <input type="text" name="CQTYReject" value="Finalreject" >

<%--                            <4th>--%>
                            </div>
                                                 <!-- 3rd -->
                            
                                                                            <div class="form-group" style="visibility:hidden;">
<i>Based on your Quality Assurance the Item is ready for Production or Rejection? </i>
<table class="table table-bordered">
      <tr style="background-color:#3c8dbc;color:white;">
      <th scope="col">QA Checklist Approval (if applicable)</th>
      <th scope="col" style="text-align:center;">&#10004; /&nbsp; <b>X</b></th>
      <th scope="col">REMARKS</th>
  
    </tr>
                <tr>
                    <td>The item selected, if Approved in our QA Basis Mark as Approved or Else Rejection</td>
                    <td style="width:100px">
           <fieldset id="checklist_approval" class="radio-inline">
      <input type="radio" name="checklist_approval" value="Approved" checked>
&#10004;
    
  
      <input type="radio" name="checklist_approval" value="Rejection">&#967;
    </fieldset>


                    </td>
     
        
                   
                </tr>

                
            </table>



                            </div>
                            <!-- ENND -->


                            
                                                 <!-- 3rd last logs -->
                            
                                                                            <div class="form-group" style="display:none;">
<i>Based on your Quality Assurance the Item is ready for Production or Rejection? </i>
<table class="table table-bordered">
      <tr style="background-color:whitesmoke;color:black;">
      <th scope="col">QA Checklist Approval (if applicable)</th>
      <th scope="col" style="text-align:center;">&#10004; /&nbsp; <b>X</b></th>
      <th scope="col" colspan="2">REMARKS</th>
  
    </tr>
                <tr>
                    <td>The Last Information</td>
                    <td style="width:220px">
           <fieldset id="checklist_approvals" class="radio-inline">
   <%--   <input type="radio" name="checklist_approval" value="Approved" checked>
&#10004;--%>
    
  
      <input type="radio"  value="Rejection" checked>&#967;
    </fieldset>


                    </td>
                    <td colspan="2">
                                 <input type="text" name="reverse_remarks" value="NULL" class="form-control"/>

                    </td>
        
                   
                </tr>

                




        <tr>
           <%--     buje 5--%>


                    <td>  Mfg. Date</td>
             <td style="font-size:20px">           <%--       <input type="date" name="mfg_date" class="form-control"/>   --%>

                    <input type="text" name="reverse_mfg_date" value="NULL" class="form-control"/>

        
             </td>


                   <td>  Expiry Date</td>
             <td style="font-size:20px"><%--<input type="date" name="expiry_date" class="form-control"/>   --%> <%--cooment ko muna ito hehe--%>
                 <input type="text" name="reverse_expiry_date" value="NULL" class="form-control"/>
             </td>


                </tr>






        <tr>
           <%--     buje 5--%>


                    <td>  Good Quantity</td>
             <td style="font-size:20px">           <%--       <input type="date" name="mfg_date" class="form-control"/>   --%>

                 <input type="text" name="reverse_good_qty" value="NULL" class="form-control"/>

       
             </td>


                   <td>  Actual Delivered</td>
             <td style="font-size:20px"><%--<input type="date" name="expiry_date" class="form-control"/>   --%> <%--cooment ko muna ito hehe--%>
                    <input type="text" name="reverse_actual_delivered"  value="NULL" class="form-control"/>

     
             </td>


                </tr>



        <tr>
           <%--     buje 5--%>


                    <td>  Rejection Date</td>
             <td style="font-size:20px">           <%--       <input type="date" name="mfg_date" class="form-control"/>   --%>
            <input type="text" name="reverse_reject_date" value="NULL" class="form-control"/>

             </td>


                   <td>  Restockin Date</td>
             <td style="font-size:20px"><%--<input type="date" name="expiry_date" class="form-control"/>   --%> <%--cooment ko muna ito hehe--%>

                  <%: Html.TextBoxFor(x=> x.mfg_date, new { @Value = @DateTime.Now.ToShortDateString(), @class="form-control", ReadOnly="true" })%>

             </td>


                </tr>

            </table>



                            </div>













                            <div class="form-group" style="display:none">
                                <label for="exampleInputFile">File input</label>
                                <input type="file" id="ImageData" name="ImageData">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->

                <div class="box-footer" align="right" style="visibility:hidden">
  <%--                              <input type="submit" onclick="myFunction()">--%>
              
                    <button type="submit" onclick="myFunction()" class="btn btn-primary">Cancel Partial Receiving</button>
                            <button type="submit" onclick="myFunctionCancel()" class="btn btn-warning">Back</button>

                </div>
                <% } %>
            </div>
            <!-- /.box -->

        </div>
        <!--/.col (left) -->

    </div>
    <!-- /.row -->









    <script>

        $(function () {
            $("#num1, #ActualDelivered, #num3, #num4, #subt,#master1, #master2,#ten, #expected, #reject, #OrderVsGood").on("keydown keyup", sum);
            function sum() {
     
                $("#subt").val(Number($("#num1").val()) - Number($("#ActualDelivered").val()) - Number($("#num3").val()));
                $("#reject").val(Number($("#ActualDelivered").val()) - Number($("#num4").val()));
                $("#waiting").val(Number($("#num1").val()) - Number($("#subt").val()));
                $("#addition").val(Number($("#ActualDelivered").val()) + Number($("#num3").val()));
                $("#tenPercentMinusActual").val(Number($("#tenPercentComputation").val()) - Number($("#ActualDelivered").val()));
                $("#missing").val(Number($("#ActualDelivered").val()) - Number($("#expected").val()));
                $("#CPassword").val(Number($("#reject").val()) * 1);
                //const x = Number($("#ten").val()) * Number($("#expected").val());
                $("#tenPercentComputation").val(1.10 * Number($("#expected").val()));
                //$("#tenPercentComputationtimes1").val(1 * Number($("#tenPercentComputation").val()));
               
                $("#CompareActualDelivedtoReject").val(Number($("#ActualDelivered").val()) - Number($("#num4").val()));

                $("#QtyGoodx1").val(Number($("#reject").val()) * 1);

        
                $("#totalQtyGood").val(Number($("#actualGood").val()) + Number($("#QtyGoodx1").val()));

                $("#QtyRejectx1").val(Number($("#num4").val()) * 1);

                $("#totalQtyReject").val(Number($("#actualReject").val()) + Number($("#QtyRejectx1").val()));


                //$("#Proc1GoodMinusOrdered").val(Number($("#num1").val()) - Number($("#reject").val()));
                //$("#GoodMinusOrderedTotal").val(Number($("#actualGood").val()) - Number($("#GoodMinusOrdered").val()));

                $("#OrderVsGood").val(Number($("#num1").val()) - Number($("#actualGood").val()));
                $("#GoodMinusOrderedTotal").val(Number($("#num1").val()) - Number($("#totalQtyGood").val()));
         

                $("#FinalFormulaNegative").val(Number($("#OrderVsGood").val()) - Number($("#ActualDelivered").val()));



                const tenPercentAcceptable = $("#ten").val();
                const expectedDelivery = $("#expected").val();
                //const expecte = $("#expected").val();

                console.log(tenPercentAcceptable);
                console.log("eeto expected delivery: "+expectedDelivery);


                 console.log(zeroten);
                //const zeroten= parseFloat(tenPercentAcceptable) * parseFloat(expectedDelivery);
               expectedDelivery = parseFloat(expectedDelivery) * 1.10;

                //console.log(x.toFixed(2));
   
                $("#masterpogi2").val(String($("#master2").val()));

                   

            }
        });


        function add_number() {

            var first_number = parseInt(document.getElementById("remaining").value);
            var second_number = parseInt(document.getElementById("partial").value);
            var result = first_number + second_number;

            document.getElementById("total").value = result;
        }









        function parseDate(str) {
            var mdy = str.split('-');
            //return new Date(mdy[2], mdy[0] - 1, mdy[1]);
            return new Date(mdy[0] - 1, mdy[1], mdy[2]);
        }

        function datediff(dateToday, master2) {
            // Take the difference between the dates and divide by milliseconds per day.
            // Round to nearest whole number to deal with DST.
            return Math.round((master2 - dateToday) / (1000 * 60 * 60 * 24));
        }

        function myFunctionCancel() {

            if (confirm("Cancel The Transaction ?")) {
                ($('#QaApprovalRemarks').val(""));
                //<a href="/Home/Index">
                location.href = "/Home/Index";
            }

            else
            {

                ($('#QaApprovalRemarks').val(""));

            }
            }









        function myFunction() {
            var first_number = parseInt(document.getElementById("remaining").value);
            var second_number = parseInt(document.getElementById("partial").value);
            var partial2 = parseInt(document.getElementById("partial2").value);
            var qtydelivered = parseInt(document.getElementById("qtydelivered").value);
            var qty_good = parseInt(document.getElementById("qty_good").value);
            var qty_good2 = parseInt(document.getElementById("qty_good2").value);
            var qty_rejectfinal = parseInt(document.getElementById("qty_rejectfinal").value);
            var qty_rejectfinal2 = parseInt(document.getElementById("qty_rejectfinal2").value);
            //var result = first_number + second_number;
            //var result = first_number + qty_good;
            var result = first_number + qty_good2;
            var resultorder = second_number - qtydelivered;
            var total_qty_good = qty_good - qty_good2;
            var total_qty_rejectfinal = qty_rejectfinal - qty_rejectfinal2;
            var totalpartial = second_number - partial2;
            document.getElementById("total").value = result;

            document.getElementById("totalqtydelivered").value = resultorder;

            document.getElementById("total_qty_good").value = total_qty_good;
            document.getElementById("total_qty_rejectfinal").value = total_qty_rejectfinal;
            document.getElementById("totalpartial").value = totalpartial;

            if (confirm("Are You sure That you want to Cancel the Partial Receiving ? ")) {












                if ($('#FinalFormulaNegative').val() < 0) {
                    //$("#master1").hide();

                    //alert("gf")
                    alert("Warning Actual Delivered Less Than the Actual Good !   : " + $('#FinalFormulaNegative').val())
                    //    ($('#num4').val("")); // clear muna lahat to 4/7/020
                    //($('#CQTYReject').val("")); // clear muna lahat to 4/7/020

                }

                //if ($('#ActualDelivered').val() < $('#num4').val()) {

                //    alert("Warning Actual Delivered is not Match at your Qty Reject !");

                //}
                else {
                    //alert("Pasok sa banga!")
                }








                    if ($('#reject').val() < 0) {
                        //$("#master1").hide();
                        ($('#CQTYReject ').val("")); // clear muna lahat to 4/7/020
                 
                        //alert("gf")
                        alert("Warnings Actual Delivered is not Match at your Qty Reject !   : " + $('#CompareActualDelivedtoReject').val())
                         
                    }

                    //if ($('#ActualDelivered').val() < $('#num4').val()) {

                    //    alert("Warning Actual Delivered is not Match at your Qty Reject !");

                    //}
                    else {
                        //alert("Pasok sa banga!")
                    }





             

            }
            else {

                ($('#ActualDelivered').val(""));

            }


        }












	$(document).ready(function(){

		//iterate through each textboxes and add keyup
		//handler to trigger sum event
		$(".txt").each(function() {

			$(this).keyup(function(){
				calculateSum();
			});
		});

	});

	function calculateSum() {

		var sum = 0;
		//iterate through each textboxes and add the values
		$(".txt").each(function() {

			//add only if the value is number
			if(!isNaN(this.value) && this.value.length!=0) {
				sum += parseFloat(this.value);
			}

		});
		//.toFixed() method will roundoff the final sum to 2 decimal places
        //$("#sum").html(sum.toFixed(2));
        $("#sum").val(sum.toFixed(2));
        //$("#sum").val(sum.toFixed(2));
        ////var txt = document.ready("#Inputs").value; //get the text
        //$("#suma").html(sum.toFixed(2)).value;
        }





        $("#master2").mouseover(function () {
            if ($(this).val()) {
                //$("#master1").hide();
                $('#days').val(datediff(parseDate(dateToday.value), parseDate(master2.value)));
    

                if ($('#missing').val() < 0) {
                    //$("#master1").hide();

                    ////confirm("Negative Value is not alloweds"); 3/27/2020
         
                }

                if ($('#days').val() < 60) {
                    //$("#master1").hide();
                    $('#days').val(datediff(parseDate(dateToday.value), parseDate(master2.value)));


                    if (confirm("Expiration Date is 60 Days Below The Standard")) {
                        // Save it!
                    } else {
                        // Do nothing!
                        ($('#master2').val(""));
                    }
                    //break;
                }
                else {
                    //alert("NO");
                }
            
            }
            else {
                $('#days').val(datediff(parseDate(dateToday.value), parseDate(master2.value)));


       





                if ($('#days').val() < 60) {
                    //$("#master1").hide();
                    $('#days').val(datediff(parseDate(dateToday.value), parseDate(master2.value)));


                }
                else {

                }



            }


        });





        $("#expected").click(function () {
            if ($(this).val()) {
              
                //alert("babe");
            }
            else {


                if ($('#days').val() < 60) {
                    //$("#master1").hide();
                    $('#days').val(datediff(parseDate(dateToday.value), parseDate(master2.value)));


                    if (confirm("Expiration Date is 60 Days Below the Standard")) {
                        // Save it!
                    } else {
                        // Do nothing!
                        ($('#master2').val(""));
                    }
                    //break;
                }
                else {
                    //alert("NO");
                }

            }


        });

  












        //Clear the Textbox
        ($('#QaApprovalRemarks').val(""));
        ($('#ActualDelivered').val(""));

        //rejection code validated the actual deliver

        $("#num4").focusout(function () {


            if ($('#reject').val() < 0) {
                //$("#master1").hide();

                //alert("gf")
                alert("ACTUAL DELIVERED IS HIGHER THAN YOUR ACTUAL REJECT!")

            }

            //if ($('#ActualDelivered').val() < $('#num4').val()) {

            //    alert("Warning Actual Delivered is not Match at your Qty Reject !");

            //}
            else
            {
                //alert("Pasok sa banga!")
            }


        });









        //date TODAY SHowing

        var date = new Date();

        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();

        if (month < 10) month = "0" + month;
        if (day < 10) day = "0" + day;

        var today = year + "-" + month + "-" + day;


        document.getElementById('dateToday').value = today;





    


</script>
 
        <style>
                .Senior.Automation{
            display:none;
        }
    </style>

</asp:Content>
