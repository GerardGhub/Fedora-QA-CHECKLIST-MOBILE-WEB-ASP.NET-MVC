<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<SodetsoUsersManagement.Models.EditUserModel>" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
      <%: ViewBag.PageTitle = "Partial Receiving of Micro PO Summarys" %>

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
                <% using (Html.BeginForm("UpdatePo", null, FormMethod.Post, new { role = "form", id = "FormUser", enctype = "multipart/form-data" }))
                   { %>

                <div class="box-body">
                    <div class="row">
                        <div class="col-md-6">

                            <!-- HERE 1 -->

                                       <div class="form-group">

<table class="table table-bordered" style="font-size:13px">

    <thead>
        <tr>
            <th colspan="4" class="edittextBoxBorder">RAW MATERIAL INFORMATION'S</th>

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

                    </td>
                </tr>
                <tr>
            <td>Supplier</td>
                    <td>        <%: Html.TextBoxFor(model => model.vendor_name, new { @class = "form-control", @placeholder="Enter Vendor Name", ReadOnly="true"}) %>  </td>



                    <td>Date of Checking</td>
                    <td>
                        

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
                 
                   
                     <td>Quantity Ordered</td>
                    <td>       
                        <input type="text" id="num1" name="qty_ordered" class="form-control" value="<%: Model.qty_ordered %>" readonly/> 

                    </td>
                   
                   
                   <td>UOM</td>
              <td> <%: Html.TextBoxFor(model => model.qty_uom, new { @class = "form-control", @placeholder="Enter UOM", ReadOnly="true"}) %>        
            
 

              </td>

                   



                </tr>
                

    <tr>
           <%--     buje 5--%>


                    <td>  Mfg. Date</td>
             <td style="font-size:20px">  
                 

                     <%: Html.TextBoxFor(model => model.mfg_date, new { @class = "form-control", @placeholder="Manufacturing Date", @required ="true",@id="master1",@autocomplete="off",@ReadOnly="true",@style="background-color:yellow" }) %>
                       <%: Html.ValidationMessageFor(model => model.mfg_date, "", new { @class = "text-danger",@style="font-size:14px;" }) %>
                        <input type="hidden" id="mastepogi1" class="form-control"/>    

                                    <input type="hidden" id="days" class="form-control"/>    
         

             </td>


                                               <td>  Expiry Date</td>
                                         <td style="font-size:20px">
                            <%: Html.TextBoxFor(model => model.expiry_date, new { @class = "form-control", @placeholder="Expiry Date", @required ="true", @autofocus="autofocus",@id="master2",@autocomplete="off",@ReadOnly="true",@style="background-color:yellow"}) %>
                                                               <%: Html.ValidationMessageFor(model => model.expiry_date, "", new { @class = "text-danger", @style="font-size:14px;" }) %>

                                                              <input type="hidden" id="masterpogi2" class="form-control"/>    


                                         </td>


                </tr>

      <tr>
                

                                       <td>  Expected Delivery</td>
                                      <td>                       
          <%: Html.TextBoxFor(model => model.stacking_level, new { @class = "form-control requiredfilled", @placeholder="Expected Delivery",@required ="true",@id="expected",@autocomplete="off",@maxlength="15"}) %>
<%--                               <%: Html.TextBoxFor(model => model.stacking_level, new { @class = "form-control requiredfilled number-separator", @placeholder="Expected Delivery",@required ="true",@id="expected",@autocomplete="off",@maxlength="15"}) %>--%>
                                          <%: Html.ValidationMessageFor(model => model.stacking_level, "", new { @class = "text-danger" }) %>

                               <input type="hidden" id="tenPercentComputation" value="0" class="form-control"/>    




                             </td>
          
                                 <td>Qty. Actual Delivered</td>
                                  <td>

                                                                             <%: Html.TextBoxFor(model => model.qty_total_delivered, new { @class = "form-control requiredfilled", @placeholder="Qty Actual Delivered", @required = "true", @id="ActualDelivered",@autocomplete="off"}) %>

<%--                                       <%: Html.TextBoxFor(model => model.qty_total_delivered, new { @class = "form-control requiredfilled number-separator", @placeholder="Qty Actual Delivered", @required = "true", @id="ActualDelivered",@autocomplete="off"}) %>--%>
                                            <%: Html.ValidationMessageFor(model => model.qty_total_delivered, "", new { @class = "text-danger" }) %>




                                            <input type="hidden" id="tenPercentMinusActualCopy"/>                  <%--                      alucard--%>
                                            <%: Html.TextBoxFor(model => model.tenPercentAllow, new{ @class = "form-control", @placeholder="Allowable ten", @required ="true",@id="tenPercentMinusActual",@min="0",@style="display:none"}) %>
               
                                                  <%: Html.ValidationMessageFor(model => model.tenPercentAllow, "", new { @class = "text-danger" }) %>







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
                    <td>No. Qty Actual Good Needed</td>
             <td>



                                                                <% 
                      
                      if (Model.qty_remarks == "0")

                      {%>  
                         <input type="text" value="<%: Model.qty_ordered%>" class="form-control" readonly />

<%--                                <td><%: Html.DisplayFor(m => item.qty_ordered) %></td>--%>

                       <% }
                      else
                      {  %>
<%--                                  <td><%: Html.DisplayFor(m => item.qty_remarks) %></td>--%>
                         <input type="text" value="<%: Model.qty_remarks%>" class="form-control" readonly />

                     <%  } %>









             

                               <%: Html.TextBoxFor(model => model.qty_waiting, new { @class = "form-control", @placeholder="Qty Waiting", @required = "true", @id="subt",ReadOnly ="true",@style="display:none"}) %>
                                <%: Html.ValidationMessageFor(model => model.qty_waiting, "", new { @class = "text-danger" }) %>
                 
                 
                 
                 <%-- <span id="sum">0</span>--%>

             </td>


                      <td>                   Batch No.</td>
        
                   <td>                                <%: Html.TextBoxFor(model => model.batch_number, new { @class = "form-control requiredfilled", @placeholder="Enter Batch Number",@autocomplete="off"}) %>
                           <%: Html.ValidationMessageFor(model => model.batch_number, "", new { @class = "text-danger" }) %>

                   </td>
                </tr>





            <thead>
        <tr>
            <th colspan="3" style="text-align:center;font-size:14px; background-color:#3c8dbc;color:white;">REJECTION INFORMATION'S</th>
                       <th style="text-align:center;font-size:14px; background-color:#3c8dbc;color:white;">  
                           <b onclick="myFunctionshowtext1()" id="btn1" class="btn btn-danger">Add New Row</b></>
         <b onclick="myFunctionshowtext2()" id="btn2" class="btn btn-danger">Add New Row</b></>

            </th>
   
        </tr>
    </thead>
    <tr>
              <tr style="background-color:#3c8dbc;color:white;">
      <th scope="col">QUANTITY</th>
      <th scope="col" style="text-align:center;">&#10004; &nbsp; <b>REMARKS</b></th>
      <th scope="col">QUANTITY</th>
     <th scope="col" style="text-align:center;">&#10004; &nbsp; <b>REMARKS</b></th>
    </tr>

          <td>
<%--            <input type="number" name="rejectqty1" value="0" class="rejectsum form-control"/>--%>

                          <%: Html.TextBoxFor(model => model.rejectqty1, new { @class = "form-control rejectsum", @placeholder="Qty Actual Reject",@type="number",@required="true",@min="0",@autocomplete="off"}) %> 
                        <%: Html.ValidationMessageFor(model => model.rejectqty1, "", new { @class = "text-danger" }) %>

        </td>
        <td>


                                <select class="form-control" name="remarksof_reject1" style="background-color:yellow;">
                                                  

                                                        <option value="Walang PO/PR">Walang PO/PR </option>
                                                        <option value="Walang COA">Walang COA</option>
                                                                <option value="Mali ang COA">Mali ang COA</option>
                                        <option value="Sira ang packaging">Sira ang packaging</option>
                                        <option value="Kulang sa timbang">Kulang sa timbang</option>
                                        <option value="Sobra sa naka PR na qty">Sobra sa naka PR na qty</option>
                                       <option value="Basa ang raw material">Basa ang raw material</option>
                                <option value="Madumi ang packaging">Madumi ang packaging</option>
                                                                       <option value="Others">Others</option>

                                                                        </select>




        </td>
      
        
               <td>
                   
  <%--          <input type="number" min="0" name="rejectqty2" value="0"  class="rejectsum form-control"/>
                   --%>
                        <%: Html.TextBoxFor(model => model.rejectqty2, new { @class = "form-control rejectsum", @placeholder="Qty Actual Reject",@type="number",@required="true",@min="0",@autocomplete="off"}) %> 
                            <%: Html.ValidationMessageFor(model => model.rejectqty2, "", new { @class = "text-danger" }) %>
                   </td>
        <td>




                                <select class="form-control" name="remarksof_reject2" style="background-color:yellow;">
                                                  
       
                                                        <option value="Walang PO/PR">Walang PO/PR </option>
                                                        <option value="Walang COA">Walang COA</option>
                                                                <option value="Mali ang COA">Mali ang COA</option>
                                        <option value="Sira ang packaging">Sira ang packaging</option>
                                        <option value="Kulang sa timbang">Kulang sa timbang</option>
                                        <option value="Sobra sa naka PR na qty">Sobra sa naka PR na qty</option>
                                       <option value="Basa ang raw material">Basa ang raw material</option>
                                <option value="Madumi ang packaging">Madumi ang packaging</option>
                                                                       <option value="Others">Others</option>

                                                                        </select>
        </td>





    </tr>
    <tr id="text1">

                <td>
                                       
      <%--      <input type="number" min="0" name="rejectqty3" value="0"  class="rejectsum form-control"/>--%>
                         <%: Html.TextBoxFor(model => model.rejectqty3, new { @class = "form-control rejectsum", @placeholder="Qty Actual Delivered",@Value="0",@required="true",@type="number",@min="0",@autocomplete="off"}) %> 
                             <%: Html.ValidationMessageFor(model => model.rejectqty3, "", new { @class = "text-danger" }) %>
                </td>
        <td>




                                <select class="form-control" name="remarksof_reject3" style="background-color:yellow;">
                                                  
                                   
                                                        <option value="Walang PO/PR">Walang PO/PR </option>
                                                        <option value="Walang COA">Walang COA</option>
                                                                <option value="Mali ang COA">Mali ang COA</option>
                                        <option value="Sira ang packaging">Sira ang packaging</option>
                                        <option value="Kulang sa timbang">Kulang sa timbang</option>
                                        <option value="Sobra sa naka PR na qty">Sobra sa naka PR na qty</option>
                                       <option value="Basa ang raw material">Basa ang raw material</option>
                                <option value="Madumi ang packaging">Madumi ang packaging</option>
                                                                       <option value="Others">Others</option>

                                                                        </select>
        </td>

               <td>
                <%--               <input type="number" name="rejectqty4" value="0"  min="0" class="rejectsum form-control"/>--%>

                        <%: Html.TextBoxFor(model => model.rejectqty4, new { @class = "form-control rejectsum", @placeholder="Qty Actual Delivered",@required="true",@type="number",@Value="0",@min="0",@autocomplete="off"}) %> 
                            <%: Html.ValidationMessageFor(model => model.rejectqty4, "", new { @class = "text-danger" }) %>
               </td>
        <td>

 



                                <select class="form-control" name="remarksof_reject4" style="background-color:yellow;">
                                                  
                               
                                                        <option value="Walang PO/PR">Walang PO/PR </option>
                                                        <option value="Walang COA">Walang COA</option>
                                                                <option value="Mali ang COA">Mali ang COA</option>
                                        <option value="Sira ang packaging">Sira ang packaging</option>
                                        <option value="Kulang sa timbang">Kulang sa timbang</option>
                                        <option value="Sobra sa naka PR na qty">Sobra sa naka PR na qty</option>
                                       <option value="Basa ang raw material">Basa ang raw material</option>
                                <option value="Madumi ang packaging">Madumi ang packaging</option>
                                                                       <option value="Others">Others</option>

                                                                        </select>
        </td>


    </tr>

    <tr id="text2"
        >

                <td>
        <%--                               <input type="number" min="0" name="rejectqty5" value="0"  class="rejectsum form-control"/>--%>

                         <%: Html.TextBoxFor(model => model.rejectqty5, new { @class = "form-control rejectsum", @placeholder="Qty Actual Delivered",@required="true",@type="number",@Value="0",@min="0",@autocomplete="off"}) %> 
                             <%: Html.ValidationMessageFor(model => model.rejectqty5, "", new { @class = "text-danger" }) %>
                </td>
        <td>

 

                                <select class="form-control" name="remarksof_reject5" style="background-color:yellow;">
                                                  
                
                                                        <option value="Walang PO/PR">Walang PO/PR </option>
                                                        <option value="Walang COA">Walang COA</option>
                                                                <option value="Mali ang COA">Mali ang COA</option>
                                        <option value="Sira ang packaging">Sira ang packaging</option>
                                        <option value="Kulang sa timbang">Kulang sa timbang</option>
                                        <option value="Sobra sa naka PR na qty">Sobra sa naka PR na qty</option>
                                       <option value="Basa ang raw material">Basa ang raw material</option>
                                <option value="Madumi ang packaging">Madumi ang packaging</option>
                                                                       <option value="Others">Others</option>

                                                                        </select>
        </td>

               <td>
          <%--             <input type="number" min="0" name="rejectqty6" value="0"  class="rejectsum form-control"/>--%>
                        <%: Html.TextBoxFor(model => model.rejectqty6, new { @class = "form-control rejectsum", @placeholder="Qty Actual Delivered",@required="true",@Value="0",@type="number",@min="0",@autocomplete="off"}) %> 
                            <%: Html.ValidationMessageFor(model => model.rejectqty6, "", new { @class = "text-danger" }) %>
               </td>
        <td>

      



                                <select class="form-control" name="remarksof_reject6" style="background-color:yellow;">
                                                  

                                                        <option value="Walang PO/PR">Walang PO/PR </option>
                                                        <option value="Walang COA">Walang COA</option>
                                                                <option value="Mali ang COA">Mali ang COA</option>
                                        <option value="Sira ang packaging">Sira ang packaging</option>
                                        <option value="Kulang sa timbang">Kulang sa timbang</option>
                                        <option value="Sobra sa naka PR na qty">Sobra sa naka PR na qty</option>
                                       <option value="Basa ang raw material">Basa ang raw material</option>
                                <option value="Madumi ang packaging">Madumi ang packaging</option>
                                                                       <option value="Others">Others</option>

                                                                        </select>
        </td>








    </tr>
    <tr>
                    <td>No. Of Reject</td>
                    <td>
                            <%: Html.TextBoxFor(model => model.qty_reject, new { @class = "form-control requiredfilled",@type="number", @placeholder="Enter No. of Reject", @required = "false",@id="num4",@min="0",@autocomplete="off",ReadOnly="true"}) %>
                                <%: Html.ValidationMessageFor(model => model.qty_reject, "", new { @class = "text-danger" }) %>
                    </td>
                    <td>Confrim No. Of Reject</td>
             <td>

         <%: Html.TextBoxFor(model => model.CQTYReject, new { @class = "form-control requiredfilled",@type="number", @placeholder = "Confirm No. of Qty Reject", id = "CQTYReject", @required = "false",@autocomplete="off" }) %>
                                <%: Html.ValidationMessageFor(model => model.CQTYReject, "", new { @class = "text-danger" }) %>

             </td>
    </tr>


          <tr class="<%: Session["Position"] %>">
<%--              <tr>  Karat man --%>
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

                                                        <input type="text" id="QtyRejectx1" placeholder="RejectQtyx1" class="form-control"/>``
                         <input type="text" id="actualReject" value="<%: Model.qty_void %>" class="form-control" readonly />
                                  <input type="text" id="totalQtyReject" name="qty_void" placeholder="totalQtyReject" class="form-control"/>

<%--                    <input type="text" id="Proc1GoodMinusOrdered" placeholder="totalQtyReject" class="form-control"/>
                                                   <input type="text" id="GoodMinusOrdered" value="<%: Model.qty_remarks %>" placeholder="totalQtyReject" class="form-control"/>--%>
                      <input type="text" id="GoodMinusOrderedTotal" name="qty_remarks" placeholder="totalQtyRemarksman" class="form-control"/>

<%--                                       <%: Html.TextBoxFor(model => model.qty_remarks, new { @class = "form-control", @placeholder = "TotalQtyRemarks", id = "GoodMinusOrderedTotal",ReadOnly ="true",min="0" }) %>
--%>





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





                        </div>














                     <div class="col-md-6">

                    <i>Upon arrival of the vehicle of medication/material at unloading area, inspect the following</i>
                    <table class="table table-bordered">
                  <tr style="background-color:#3c8dbc;color:white;">
                  <th scope="col">TRUCK INSPECTION</th>
                  <th scope="col" style="text-align:center;">&#10004; /&nbsp; <b>X</b></th>
                  <th scope="col">REMARKS</th>
  
                 </tr>
                  <tr>
                    <td>The trucks are covered and closed</td>
                    <td style="width:100px">
<%--           <fieldset id="truck_approval1" class="radio-inline">
      <input type="radio" name="truck_approval1" value="Approved" checked>
&#10004;
    
  
      <input type="radio" name="truck_approval1" value="DisApproved">&#967;
    </fieldset>--%>
                                <%: @Html.RadioButtonFor(model => model.truck_approval1, "Approved")  %> <span class="fa fa-check"></span>
            
       
                  <%: @Html.RadioButtonFor(model => model.truck_approval1, "DisApproved") %> <span class="fa fa-times"></span>
           
              <%: @Html.ValidationMessageFor(model => model.truck_approval1, "", new { @class = "text-danger" }) %>


                    </td>
                    <td>                 
           <%: Html.TextBoxFor(model => model.truck_remarks1, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",autocomplete="off"}) %>
                          <%: Html.ValidationMessageFor(model => model.truck_remarks1, "", new { @class = "text-danger" }) %>


                    </td>
        
                   
                </tr>
                <tr>
                    <td>Floorboards are dry and clean</td>
                    <td>       
<%--                        <fieldset id="truck_approval2" class="radio-inline">
      <input type="radio" name="truck_approval2" value="Approved" checked>
&#10004;
   
  
      <input type="radio" name="truck_approval2" value="DisApproved">&#967;
    </fieldset>          --%>        
                      <%: @Html.RadioButtonFor(model => model.truck_approval2, "Approved")  %> <span class="fa fa-check"></span>
            
       
                  <%: @Html.RadioButtonFor(model => model.truck_approval2, "DisApproved") %> <span class="fa fa-times"></span>
           
              <%: @Html.ValidationMessageFor(model => model.truck_approval2, "", new { @class = "text-danger" }) %>

                    </td>
                    <td>
                                   <%: Html.TextBoxFor(model => model.truck_remarks2, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                          <%: Html.ValidationMessageFor(model => model.truck_remarks2, "", new { @class = "text-danger" }) %>


                    </td>
             
                </tr>
                <tr>
                    <td>No evidence of chemical spills, garbage, waste or spoiled foods</td>
                    <td>
<%--                        <fieldset id="truck_approval3" class="radio-inline">
      <input type="radio" name="truck_approval3" value="Approved" checked>
&#10004;
    
  
      <input type="radio" name="truck_approval3" value="DisApproved">&#967;
    </fieldset>--%>

                     <%: @Html.RadioButtonFor(model => model.truck_approval3, "Approved")  %> <span class="fa fa-check"></span>
            
       
                  <%: @Html.RadioButtonFor(model => model.truck_approval3, "DisApproved") %> <span class="fa fa-times"></span>
           
              <%: @Html.ValidationMessageFor(model => model.truck_approval3, "", new { @class = "text-danger" }) %>



                    </td>
                    <td>
                           <%: Html.TextBoxFor(model => model.truck_remarks3, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                          <%: Html.ValidationMessageFor(model => model.truck_remarks3, "", new { @class = "text-danger" }) %>

                    </td>
               
                </tr>
         <tr>
                    <td>No insect and rodent activity</td>
                    <td>                                            
<%--                                   <fieldset id="group4" class="radio-inline">
      <input type="radio" name="truck_approval4" value="Approved" checked>
&#10004;
    
  
      <input type="radio" name="truck_approval4" value="DisApproved">&#967;
    </fieldset>--%>
                       <%: @Html.RadioButtonFor(model => model.truck_approval4, "Approved")  %> <span class="fa fa-check"></span>
            
       
                  <%: @Html.RadioButtonFor(model => model.truck_approval4, "DisApproved") %> <span class="fa fa-times"></span>
           
              <%: @Html.ValidationMessageFor(model => model.truck_approval4, "", new { @class = "text-danger" }) %>

                    </td>
                    <td>
                       <%: Html.TextBoxFor(model => model.truck_remarks4, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                          <%: Html.ValidationMessageFor(model => model.truck_remarks4, "", new { @class = "text-danger" }) %>

                    </td>
               
                </tr>
       
            </table>













                                                <div class="form-group">
<i>Upon unloading of medication / material, inspect the following</i>
<table class="table table-bordered">
      <tr style="background-color:#3c8dbc;color:white">
      <th scope="col">UNLOADING OF RAW MATERIALS</th>
      <th scope="col" style="text-align:center;">&#10004; /&nbsp; <b>X</b></th>
      <th scope="col">REMARKS</th>
  
    </tr>
                <tr>
                    <td>All products are on clean pallets (if.applicable)</td>
                    <td style="width:100px">
<%--           <fieldset id="unload_approval1" class="radio-inline">
      <input type="radio" name="unload_approval1" value="Approved" checked>
&#10004;
    
  
      <input type="radio" name="unload_approval1" value="DisApproved">&#967;
    </fieldset>--%>

                  <%: @Html.RadioButtonFor(model => model.unload_approval1, "Approved")  %> <span class="fa fa-check"></span>
            
       
                  <%: @Html.RadioButtonFor(model => model.unload_approval1, "DisApproved") %> <span class="fa fa-times"></span>
           
              <%: @Html.ValidationMessageFor(model => model.unload_approval1, "", new { @class = "text-danger" }) %>


                    </td>
                    <td>

                       <%: Html.TextBoxFor(model => model.unload_remarks1, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                          <%: Html.ValidationMessageFor(model => model.unload_remarks1, "", new { @class = "text-danger" }) %>
                    </td>
        
                   
                </tr>
                <tr>
                    <td>No damaged packaging</td>
                    <td>         
<%--                        <fieldset id="unload_approval2" class="radio-inline">
      <input type="radio" name="unload_approval2" value="Approved" checked>
&#10004;
   
  
      <input type="radio" name="unload_approval2" value="DisApproved">&#967;
    </fieldset>    --%>
                   <%: @Html.RadioButtonFor(model => model.unload_approval2, "Approved")  %> <span class="fa fa-check"></span>
            
       
                  <%: @Html.RadioButtonFor(model => model.unload_approval2, "DisApproved") %> <span class="fa fa-times"></span>
           
              <%: @Html.ValidationMessageFor(model => model.unload_approval2, "", new { @class = "text-danger" }) %>


                    </td>
                    <td>  
           <%: Html.TextBoxFor(model => model.unload_remarks2, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                          <%: Html.ValidationMessageFor(model => model.unload_remarks2, "", new { @class = "text-danger" }) %>

                    </td>
             
                </tr>
                <tr>
                    <td>All packaging are clean</td>
                    <td>        
<%--                        <fieldset id="unload_approval3" class="radio-inline">
      <input type="radio" name="unload_approval3" value="Approved" checked>
&#10004;
    
  
      <input type="radio" name="unload_approval3" value="DisApproved">&#967;
    </fieldset>--%>
                   <%: @Html.RadioButtonFor(model => model.unload_approval3, "Approved")  %> <span class="fa fa-check"></span>
            
       
                  <%: @Html.RadioButtonFor(model => model.unload_approval3, "DisApproved") %> <span class="fa fa-times"></span>
           
              <%: @Html.ValidationMessageFor(model => model.unload_approval3, "", new { @class = "text-danger" }) %>


                    </td>
                    <td> 
                      <%: Html.TextBoxFor(model => model.unload_remarks3, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                          <%: Html.ValidationMessageFor(model => model.unload_remarks3, "", new { @class = "text-danger" }) %>


                    </td>
               
                </tr>
         <tr>
                    <td style="font-size:11px;">Batch Number, Manufacturing Date, and Expiry Date are same as written in the Certificate of Analysis (COA) provided by the supplier</td>
                    <td>                                            
<%--                                   <fieldset id="unload_approval4" class="radio-inline">
      <input type="radio" name="unload_approval4" value="Approved" checked>
&#10004;
    
  
      <input type="radio" name="unload_approval4" value="DisApproved">&#967;
    </fieldset>--%>

                                     <%: @Html.RadioButtonFor(model => model.unload_approval4, "Approved")  %> <span class="fa fa-check"></span>
            
       
                  <%: @Html.RadioButtonFor(model => model.unload_approval4, "DisApproved") %> <span class="fa fa-times"></span>
           
              <%: @Html.ValidationMessageFor(model => model.unload_approval4, "", new { @class = "text-danger" }) %>

                    </td>
                    <td> 
                        
                    <%: Html.TextBoxFor(model => model.unload_remarks4, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                          <%: Html.ValidationMessageFor(model => model.unload_remarks4, "", new { @class = "text-danger" }) %>

                    </td>
               
                </tr>
       
            </table>










                            </div>

                            <!-- 3rd -->
                            
                                                                            <div class="form-group">
<i>Upon checking of physical appearance / sampling, inspect the following</i>
<table class="table table-bordered">
      <tr style="background-color:#3c8dbc;color:white;">
      <th scope="col">CHECKING OF PHYSICAL APPEARANCE/SAMPLING (if applicable)</th>
      <th scope="col" style="text-align:center;">&#10004; /&nbsp; <b>X</b></th>
      <th scope="col">REMARKS</th>
  
    </tr>
                <tr>
                    <td>The delivered raw material(s) has the same color/appearance in BASEMIX brochure</td>
                    <td style="width:100px">
<%--           <fieldset id="checking_approval1" class="radio-inline">
      <input type="radio" name="checking_approval1" value="Approved" checked>
&#10004;
    
  
      <input type="radio" name="checking_approval1" value="DisApproved">&#967;
    </fieldset>--%>
          <%: @Html.RadioButtonFor(model => model.checking_approval1, "Approved")  %> <span class="fa fa-check"></span>
            
       
                  <%: @Html.RadioButtonFor(model => model.checking_approval1, "DisApproved") %> <span class="fa fa-times"></span>
           
              <%: @Html.ValidationMessageFor(model => model.checking_approval1, "", new { @class = "text-danger" }) %>



                    </td>
                    <td>
                        <%: Html.TextBoxFor(model => model.checking_remarks1, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                          <%: Html.ValidationMessageFor(model => model.checking_remarks1, "", new { @class = "text-danger" }) %>


                    </td>
        
                   
                </tr>
                <tr>
                    <td>No foreign materials in the packaging and in the content of the raw material</td>
                    <td>  
<%--                        <fieldset id="checking_approval2" class="radio-inline">
      <input type="radio" name="checking_approval2" value="Approved" checked>
&#10004;
   
  
      <input type="radio" name="checking_approval2" value="DisApproved">&#967;
    </fieldset>     --%>      

                                  <%: @Html.RadioButtonFor(model => model.checking_approval2, "Approved")  %> <span class="fa fa-check"></span>
            
       
                  <%: @Html.RadioButtonFor(model => model.checking_approval2, "DisApproved") %> <span class="fa fa-times"></span>
           
              <%: @Html.ValidationMessageFor(model => model.checking_approval2, "", new { @class = "text-danger" }) %>


                    </td>
                    <td>
      <%: Html.TextBoxFor(model => model.checking_remarks2, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                          <%: Html.ValidationMessageFor(model => model.checking_remarks2, "", new { @class = "text-danger" }) %>



                    </td>
             
                </tr>
                
            </table>














                            </div>
                            <!-- ENND  #3C8DBC#3C8DBC-->



<%--                            <4th>--%>

                                                 <!-- 3rd -->
                            
                                                                            <div class="form-group">
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
    

  
      <input type="radio" name="checklist_approval" value="Approved">&#967;
    </fieldset>


                    </td>
                    <td>
                        <%: Html.TextBoxFor(model => model.checklist_remarks, new { @class = "form-control requiredfilled", @placeholder="Required!", @required ="true",@id="QaApprovalRemarks",@autocomplete="off"}) %>
                          <%: Html.ValidationMessageFor(model => model.checklist_remarks, "", new { @class = "text-danger" }) %>


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
             <td style="font-size:20px">
                    <input type="text" name="reverse_actual_delivered"  value="NULL" class="form-control"/>
             </td>


                </tr>



        <tr>


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

                <div class="box-footer" align="right">
                          
              
                    <button type="submit" onclick="myFunction()" class="btn btn-primary">Save</button>
                            <button type="submit" onclick="myFunctionCancel()" class="btn btn-warning">Cancel</button>

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
            $("#num1, #ActualDelivered, #num3, #num4, #subt,#master1, #master2,#ten, #expected, #reject, #OrderVsGood, #reject1, #reject2").on("keydown keyup", sum);
            function sum() {
     
                $("#subt").val(Number($("#num1").val()) - Number($("#ActualDelivered").val().replace(/,/g, '')) - Number($("#num3").val()));
                $("#reject").val(Number($("#ActualDelivered").val().replace(/,/g, '')) - Number($("#num4").val()));
                $("#waiting").val(Number($("#num1").val()) - Number($("#subt").val()));
                $("#addition").val(Number($("#ActualDelivered").val().replace(/,/g, '')) + Number($("#num3").val()));
                $("#tenPercentMinusActual").val(Number($("#tenPercentComputation").val()) - Number($("#ActualDelivered").val().replace(/,/g, '')));


                // VALUE MULTIPLY BY 1.10 DUAL COPY
                $("#tenPercentMinusActualCopy").val(Number($("#tenPercentComputation").val()) * 1);



                $("#missing").val(Number($("#ActualDelivered").val().replace(/,/g, '')) - Number($("#expected").val().replace(/,/g, '')));
                $("#CPassword").val(Number($("#reject").val()) * 1);
 
                // VALUE MULTIPLY BY 1.10
                $("#tenPercentComputation").val(1.10 * Number($("#expected").val().replace(/,/g, '')));


                $("#CompareActualDelivedtoReject").val(Number($("#ActualDelivered").val().replace(/,/g, '')) - Number($("#num4").val()));

                $("#QtyGoodx1").val(Number($("#reject").val()) * 1);

        
                $("#totalQtyGood").val(Number($("#actualGood").val()) + Number($("#QtyGoodx1").val()));

                $("#QtyRejectx1").val(Number($("#num4").val()) * 1);

                $("#totalQtyReject").val(Number($("#actualReject").val()) + Number($("#QtyRejectx1").val()));



                $("#OrderVsGood").val(Number($("#num1").val()) - Number($("#actualGood").val()));
                $("#GoodMinusOrderedTotal").val(Number(Math.round($("#num1").val())) - Number(Math.round($("#totalQtyGood").val())));
         

                $("#FinalFormulaNegative").val(Number($("#OrderVsGood").val()) - Number($("#ActualDelivered").val().replace(/,/g, '')));

   
                $("#masterpogi2").val(String($("#master2").val()));

                   

            }
        });

                   $("#text1").hide();
        $("#text2").hide();
        $("#btn2").hide();







        ($('#expected').val(""));

        ($('#master2').val(""));

        //insert muna this
        $(document).ready(function () {

            $("#dt1").datepicker({
                dateFormat: "dd-M-yy",
                minDate: 0,
                onSelect: function (date) {
                    var dt2 = $('#dt2');
                    var startDate = $(this).datepicker('getDate');
                    var minDate = $(this).datepicker('getDate');
                    dt2.datepicker('setDate', minDate);
                    startDate.setDate(startDate.getDate() + 30);
                    //sets dt2 maxDate to the last day of 30 days window
                    dt2.datepicker('option', 'maxDate', startDate);
                    dt2.datepicker('option', 'minDate', minDate);
                    $(this).datepicker('option', 'minDate', minDate);
                }
            });
            $('#dt2').datepicker({
                dateFormat: "dd-M-yy"
            });
        });


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

            if (confirm("Cancel The Transaction?")) {
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

            if (confirm(datediff(parseDate(dateToday.value), parseDate(master2.value)) + " Days Between Mfg.Date And Expiry Date Do you want to Proceed The Checklist ?")) {




                if ($('#FinalFormulaNegative').val() < 0) {
                    //$("#master1").hide();

                    //alert("gf")
                    //alert("Warning Actual Delivered Less Than the Actual Good !   : " + $('#FinalFormulaNegative').val()) verybad
                    //    ($('#num4').val("")); // clear muna lahat to 4/7/020
                    //($('#CQTYReject').val("")); // clear muna lahat to 4/7/020

                }


                else {
                    //alert("Pasok sa banga!")
                }








                    if ($('#reject').val() < 0) {
                        //$("#master1").hide();
                        ($('#CQTYReject ').val("")); // clear muna lahat to 4/7/020
                 
                        //alert("gf")
                        alert("Warnings Actual Delivered is not Match at your Qty Reject !   : " + $('#CompareActualDelivedtoReject').val())
                         
                    }


                    else {
                        //alert("Pasok sa banga!")
                    }



       

                //START
                var ActualDelivery = $('#ActualDelivered').val().replace(/,/g, '');

                var tenPercentequalone = $('#tenPercentComputation').val();

                if (ActualDelivery < 10) {



                    //alert("Fresh Morning");
                }
                else {



                    //alert("Fresh Nays");


                    var sample = $('#tenPercentMinusActual').val();
                    //if ($('#ActualDelivered').val().replace(/,/g, '') > $('#tenPercentMinusActualCopy').val()) {



                    //    alert("Error Maximum 10 Percent Allowable Exceed!1"); //1
                    //    ($('#ActualDelivered').val(""));
                    //}

                    if (parseFloat($("#tenPercentMinusActualCopy").val()) == parseFloat($("#ActualDelivered").val())) {
                        //alert("Data is the same");
                    }
                    else {

                        if (parseFloat($("#tenPercentMinusActualCopy").val()) > parseFloat($("#ActualDelivered").val())) {
                            $(".error").css("display", "block").css("color", "red");
                            //$("#submit").prop('disabled', true);
                            //alert("Wala pa sa 10 Percent");
                        }
                        else {
                            $(".error").css("display", "none");
                            //$("#submit").prop('disabled', false);
                            alert("Maximum 10 Percent Allowable Exceed!!");
                            ($('#ActualDelivered').val(""));
                        }
                    }


                }






            }
            else {

                ($('#QaApprovalRemarks').val(""));

            }

            //$("#masterpogi1").val(datediff(parseDate(master1.value), parseDate(master2.value)).val());
        }




        //my jquery
        $(document).on("change", ".rejectsum", function () {
            var sum = 0;
            $(".rejectsum").each(function () {
                sum += +$(this).val();
            });
            $("#num4").val(sum);
        });


        $("#num4").val("0");


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
        $("#sum").val(sum.toFixed(2));
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

  




        $("#ActualDelivered").mouseout(function () {
            if ($(this).val()) {

                if ($('#missing').val() < 0) {
                    //$("#master1").hide();

                    //confirm($('#missing').val() +"Negative Value is not alloweds"); comment muna pulido na this at 3/26/2020
                    //return false;
                    //break;
                }

                //if (($('#tenPercentMinusActualCopy').val()) > ($('#ActualDelivered').val().replace(/,/g, ''))) {


                //    alert("Error Maximum 10 Percent Allowable Exceed!200");
                //    ($('#ActualDelivered').val(""));

                //}
                //else {
                //   
                //}

            


                var ActualDelivery = $('#ActualDelivered').val().replace(/,/g, '');

                var tenPercentequalone = $('#tenPercentComputation').val();

                if (ActualDelivery < 10)
        {



                    //alert("Fresh Morning");
                }
                else {



                    //alert("Fresh Nays");


                var sample = $('#tenPercentMinusActual').val();
                    //if ($('#ActualDelivered').val().replace(/,/g, '') > $('#tenPercentMinusActualCopy').val())
                    //if ($('#tenPercentMinusActualCopy').val() > $('#ActualDelivered').val().replace(/,/g, '')) {


                    //    alert("Error Maximum 10 Percent Allowable Exceed!200");
                    //    ($('#ActualDelivered').val(""));

                    //}
                    if (parseFloat($("#tenPercentMinusActualCopy").val()) == parseFloat($("#ActualDelivered").val())) {
                        //alert("Data is the same");
                    }
                    else {

                        if (parseFloat($("#tenPercentMinusActualCopy").val()) > parseFloat($("#ActualDelivered").val())) {
                            $(".error").css("display", "block").css("color", "red");
                            //$("#submit").prop('disabled', true);
                            //alert("Wala pa sa 10 Percent");
                        }
                        else {
                            $(".error").css("display", "none");
                            //$("#submit").prop('disabled', false);
                            alert("Maximum 10 Percent Allowable Exceed!!");
                            ($('#ActualDelivered').val(""));
                        }
                    }
                  



                }




            }


        });


        //Clear the Textbox
        ($('#QaApprovalRemarks').val(""));
        ($('#ActualDelivered').val(""));

        //rejection code validated the actual deliver

        $("#num4").focusout(function () {


            if ($('#reject').val() < 0) {

                alert("ACTUAL DELIVERED IS HIGHER THAN YOUR ACTUAL REJECT!")

            }


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
    <script>



  
        $(function () {
            $("#master1").datepicker({
                format: "dd/mm/yyyy",
                autoclose: true,
                todayHighlight: true,
                showOtherMonths: true,
                selectOtherMonths: true,
                autoclose: true,
                changeMonth: true,
                changeYear: true,
                maxDate: new Date()



            });
        });












        //format: "mm/yyyy/dd",

        $(function () {
            $("#master2").datepicker({
                //format: "yyyy-mm-dd",
                dateFormat: 'yy-mm-dd',
                autoclose: true,
                todayHighlight: true,
                showOtherMonths: true,
                selectOtherMonths: true,
                autoclose: true,
                changeMonth: true,
                changeYear: true,
                minDate: new Date()



            });
        });


        function myFunctionshowtext1() {
            $("#text1").show();
            $("#btn1").hide();
            $("#btn2").show();

            ($('#QaApprovalRemarks').val(""));
        }

        function myFunctionshowtext2() {
            $("#text2").show();
            $("#btn2").hide();
            ($('#QaApprovalRemarks').val(""));
        }



    </script>
    <script src="../../Scripts/easy-number-separator.js"></script>
        <style>
                .Senior.Automation{
            display:none;
        }
    </style>

</asp:Content>
