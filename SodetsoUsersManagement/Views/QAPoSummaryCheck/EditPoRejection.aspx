<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<SodetsoUsersManagement.Models.EditUserModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
      <%: ViewBag.PageTitle = "Edit Feedmill PO Summary & Details Of Delivery" %>
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
                <% using (Html.BeginForm("UpdatePoRejection", null, FormMethod.Post, new { role = "form", id = "FormUser", enctype = "multipart/form-data" }))
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
                 
                   
                     <td>Quantity Ordered</td>
                    <td>                        <input type="text" id="num1" name="qty_ordered" class="form-control" value="<%: Model.qty_ordered %>" readonly/> </td>
                   
                   
                   <td>UOM</td>
              <td> <%: Html.TextBoxFor(model => model.qty_uom, new { @class = "form-control", @placeholder="Enter UOM", ReadOnly="true"}) %>        </td>




                </tr>
                

    <tr>
           <%--     buje 5--%>


                    <td>  Mfg. Date</td>
             <td style="font-size:20px">  
                 
<%--                   <%: Html.TextBoxFor(model => model.mfg_date, new { @class = "form-control", @required ="true",@id="master1"}) %>--%>
                     <%: Html.TextBoxFor(model => model.mfg_date, new { @class = "form-control", @placeholder="Manufacturing Date", @required ="true",@id="master1",@autocomplete="off",@ReadOnly="true" }) %>
                       <%: Html.ValidationMessageFor(model => model.mfg_date, "", new { @class = "text-danger" }) %>
              <%--          <input type="text" name="mfg_date" id="master1" class="form-control"/>   --%>
                        <input type="hidden" id="mastepogi1" class="form-control"/>    

                                    <input type="hidden" id="days" class="form-control"/>    
          

 <%--                   <%: Html.ValidationMessageFor(model => model.mfg_date) %>--%>



             </td>


                   <td>  Expiry Date</td>
             <td style="font-size:20px">
<%: Html.TextBoxFor(model => model.expiry_date, new { @class = "form-control", @placeholder="Expiry Date", @required ="true", @autofocus="autofocus",@id="master2",@autocomplete="off",@ReadOnly="true"}) %>
                                   <%: Html.ValidationMessageFor(model => model.expiry_date, "", new { @class = "text-danger" }) %>

<%--                 <input type="text" name="expiry_date" id="master2" class="form-control" autocomplete="off" />    --%>
                                  <input type="hidden" id="masterpogi2" class="form-control"/>    

<%--                    <%: Html.ValidationMessageFor(model => model.expiry_date) %>--%>
             </td>


                </tr>

      <tr>
                

                                       <td>  Expected Delivery</td>
                                      <td>                       
          <%: Html.TextBoxFor(model => model.stacking_level, new { @class = "form-control", @placeholder="Expected Delivery",@type="number", @required ="true",@id="mainexpected",@min="0",ReadOnly="true"}) %>
                                   <%: Html.ValidationMessageFor(model => model.stacking_level, "", new { @class = "text-danger" }) %>

<input type="hidden" id="expected" name="rejectioncontrol" value="<%: Model.stacking_level %>" class="form-control"/>
                               <input type="hidden" id="tenPercentComputation" value="0" class="form-control"/>    


<%--               <%: Html.TextBoxFor(model => model.qty_missing, new { @class = "form-control", @placeholder="Qty Missing", @required = "true", @id="tenPercentComputation",ReadOnly ="true",@min="0"}) %>
                                <%: Html.ValidationMessageFor(model => model.qty_missing, "", new { @class = "text-danger" }) %>--%>

                             </td>
          
      <td>Qty. Actual Delivered</td>
                    <td>

            <%: Html.TextBoxFor(model => model.qty_total_delivered, new { @class = "form-control", @placeholder="Qty Actual Delivered",@type="number", @required = "true", @id="ActualDelivered",@autocomplete="off"}) %>
                                <%: Html.ValidationMessageFor(model => model.qty_total_delivered, "", new { @class = "text-danger" }) %>

                  <%--      <input type="text" id="ActualDelivered" class="form-control"/>--%>
                  <%--         <input type="text" id="tenPercentMinusActual" min="0" class="form-control"/>    --%>



                                            <%: Html.TextBoxFor(model => model.tenPercentAllow, new{ @class = "form-control", @placeholder="Allowable ten", @required ="true",@id="tenPercentMinusActual",@min="0",@style="display:none"}) %>
               
                    <%: Html.ValidationMessageFor(model => model.tenPercentAllow, "", new { @class = "text-danger" }) %>







<%--                                                   <%: Html.TextBoxFor(model => model.tenprecentallowableused, new { @class = "form-control", @placeholder="Qty Missing", @required = "true", @id="tenPercentMinusActual",ReadOnly ="true",style = "display: none;"}) %>--%>
                    </td>
                </tr>

          <tr class="<%: Session["Position"] %>">
                

                       <td>  Quantity Missing</td>
             <td>                       
                    <%: Html.TextBoxFor(model => model.qty_missing, new { @class = "form-control", @placeholder="Qty Missing", @required = "true", @id="missing",ReadOnly ="true",@min="0"}) %>
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



           <tr>
<%--          buje4--%>

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
              <%--   buje8--%>
                    <td>No. Qty Actual Needed</td>
             <td>
                    <%--      <%: Html.TextBoxFor(model => model.qty_waiting, new { @class = "form-control", @placeholder="Enter Quantity Delivered"}) %>--%>
     <%--            <input type="number" name="qty_waiting" class="form-control" min="0"  id="subt" readonly/>--%>
                               <%: Html.TextBoxFor(model => model.qty_waiting, new { @class = "form-control", @placeholder="Qty Waiting", @required = "true", @id="subt",ReadOnly ="true"}) %>
                                <%: Html.ValidationMessageFor(model => model.qty_waiting, "", new { @class = "text-danger" }) %>
                 
                 
                 
                 <%-- <span id="sum">0</span>--%>

             </td>


                      <td>                   Batch No.</td>
        
                   <td>                                <%: Html.TextBoxFor(model => model.batch_number, new { @class = "form-control", @placeholder="Enter Batch Number",@autocomplete="off"}) %>
                           <%: Html.ValidationMessageFor(model => model.batch_number, "", new { @class = "text-danger" }) %>

                   </td>
                </tr>


      <tr>
            <td>No. Of Reject</td>
                    <td>
                            <%: Html.TextBoxFor(model => model.qty_reject, new { @class = "form-control",@type="number", @placeholder="Enter No. of Reject", @required = "false",@id="num4",@min="0"}) %>
                                <%: Html.ValidationMessageFor(model => model.qty_reject, "", new { @class = "text-danger" }) %>
                    </td>
                    <td>Confrim No. Of Reject</td>
             <td>

         <%: Html.TextBoxFor(model => model.CQTYReject, new { @class = "form-control",@type="number", @placeholder = "Confirm No. of Qty Reject", id = "CQTYReject", @required = "false",@autocomplete="off" }) %>
                                <%: Html.ValidationMessageFor(model => model.CQTYReject, "", new { @class = "text-danger" }) %>

             </td>
                  
                </tr>

          <tr class="<%: Session["Position"] %>">
                <td>No. Of Items Qty Good</td>
                    <td>


              <%: Html.TextBoxFor(model => model.Password, new { @class = "form-control", @placeholder="Enter No. of Good", @required = "true", @id="reject",ReadOnly ="true",@min="0"}) %>
                                <%: Html.ValidationMessageFor(model => model.Password, "", new { @class = "text-danger" }) %>



                    </td>
                    <td>Confrim No. Of Items Qty  Good</td>
             <td>
                             <%: Html.TextBoxFor(model => model.CPassword, new { @class = "form-control", @placeholder = "Confirm No. of Good", id = "CPassword", @required = "true",ReadOnly ="true" }) %>
                                <%: Html.ValidationMessageFor(model => model.CPassword, "", new { @class = "text-danger" }) %>

             </td>

              `
            
                </tr>

            </table>


  <!-- 3rd last logs -->
                            
                                                                            <div class="form-group">
<i>Based on your Quality Assurance the Item is ready for Production or Rejection? </i>
<table class="table table-bordered">
      <tr style="background-color:#3c8dbc;color:white;">
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
            <%--            <%: Html.TextBoxFor(model => model.checklist_remarks, new { @class = "form-control", @placeholder="Remarks is required!", @required ="true"}) %>
                          <%: Html.ValidationMessageFor(model => model.checklist_remarks, "", new { @class = "text-danger" }) %>--%>
                                 <input type="text" name="reverse_remarks" value="<%: Model.checklist_remarks %>" class="form-control" readonly/>

                    </td>
        
                   
                </tr>

                




        <tr>
           <%--     buje 5--%>


                    <td>  Mfg. Date</td>
             <td style="font-size:20px">        

                    <input type="text" name="reverse_mfg_date" value="<%: Model.mfg_date %>" class="form-control" readonly/>

             </td>


                   <td>  Expiry Date</td>
             <td style="font-size:20px">
                 <input type="text" name="reverse_expiry_date" value="<%: Model.expiry_date %>" class="form-control" readonly/>
             </td>


                </tr>






        <tr>
           <%--     buje 5--%>


                    <td>  Good Quantity</td>
             <td style="font-size:20px">           

                 <input type="text" name="reverse_good_qty" value="<%: Model.Password %>" class="form-control" readonly/>

        
             </td>


                   <td>  Actual Delivered</td>
             <td style="font-size:20px">
                    <input type="text" name="reverse_actual_delivered"  value="<%: Model.stacking_level %>" class="form-control" readonly/>

             </td>


                </tr>



        <tr>
           <%--     buje 5--%>


                    <td>  Rejection Date</td>
             <td style="font-size:20px">           <%--       <input type="date" name="mfg_date" class="form-control"/>   --%>
            <input type="text" name="reverse_reject_date" value="<%: Model.DateChecklistCreated %>" class="form-control", Readonly="true"/>
  
             </td>


                   <td>  Restockin Date</td>
             <td style="font-size:20px">

                           <input type="text" name="mfg_date" id="dateToday" class="form-control" readonly />

             </td>


                </tr>

            </table>



                            </div>



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
           <fieldset id="truck_approval1" class="radio-inline">
      <input type="radio" name="truck_approval1" value="Approved" checked>
&#10004;
    
  
      <input type="radio" name="truck_approval1" value="DisApproved">&#967;
    </fieldset>


                    </td>
                    <td>                 
           <%: Html.TextBoxFor(model => model.truck_remarks1, new { @class = "form-control", @placeholder="Enter Some Text", @required ="true",autocomplete="true"}) %>
                          <%: Html.ValidationMessageFor(model => model.truck_remarks1, "", new { @class = "text-danger" }) %>


                    </td>
        
                   
                </tr>
                <tr>
                    <td>Floorboards are dry and clean</td>
                    <td>           <fieldset id="truck_approval2" class="radio-inline">
      <input type="radio" name="truck_approval2" value="Approved" checked>
&#10004;
   
  
      <input type="radio" name="truck_approval2" value="DisApproved">&#967;
    </fieldset>                       </td>
                    <td>
                                   <%: Html.TextBoxFor(model => model.truck_remarks2, new { @class = "form-control", @placeholder="Enter Some Text", @required ="true",@autocomplete="off"}) %>
                          <%: Html.ValidationMessageFor(model => model.truck_remarks2, "", new { @class = "text-danger" }) %>


                    </td>
             
                </tr>
                <tr>
                    <td>No evidence of chemical spills, garbage, waste or spoiled foods</td>
                    <td>           <fieldset id="truck_approval3" class="radio-inline">
      <input type="radio" name="truck_approval3" value="Approved" checked>
&#10004;
    
  
      <input type="radio" name="truck_approval3" value="DisApproved">&#967;
    </fieldset></td>
                    <td>
                           <%: Html.TextBoxFor(model => model.truck_remarks3, new { @class = "form-control", @placeholder="Enter Some Text", @required ="true",@autocomplete="off"}) %>
                          <%: Html.ValidationMessageFor(model => model.truck_remarks3, "", new { @class = "text-danger" }) %>

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
                       <%: Html.TextBoxFor(model => model.truck_remarks4, new { @class = "form-control", @placeholder="Enter Some Text", @required ="true",@autocomple="off"}) %>
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
           <fieldset id="unload_approval1" class="radio-inline">
      <input type="radio" name="unload_approval1" value="Approved" checked>
&#10004;
    
  
      <input type="radio" name="unload_approval1" value="DisApproved">&#967;
    </fieldset>


                    </td>
                    <td>

                       <%: Html.TextBoxFor(model => model.unload_remarks1, new { @class = "form-control", @placeholder="Enter Some Text in the Field", @required ="true",@autocomplete="true"}) %>
                          <%: Html.ValidationMessageFor(model => model.unload_remarks1, "", new { @class = "text-danger" }) %>
                    </td>
        
                   
                </tr>
                <tr>
                    <td>No damaged packaging</td>
                    <td>           <fieldset id="unload_approval2" class="radio-inline">
      <input type="radio" name="unload_approval2" value="Approved" checked>
&#10004;
   
  
      <input type="radio" name="unload_approval2" value="DisApproved">&#967;
    </fieldset>                       </td>
                    <td>  
           <%: Html.TextBoxFor(model => model.unload_remarks2, new { @class = "form-control", @placeholder="Enter Some Text in the Field", @required ="true",@autocomplete="off"}) %>
                          <%: Html.ValidationMessageFor(model => model.unload_remarks2, "", new { @class = "text-danger" }) %>

                    </td>
             
                </tr>
                <tr>
                    <td>All packaging are clean</td>
                    <td>           <fieldset id="unload_approval3" class="radio-inline">
      <input type="radio" name="unload_approval3" value="Approved" checked>
&#10004;
    
  
      <input type="radio" name="unload_approval3" value="DisApproved">&#967;
    </fieldset></td>
                    <td> 
                      <%: Html.TextBoxFor(model => model.unload_remarks3, new { @class = "form-control", @placeholder="Enter Some Text in the Field", @required ="true",@autocomplete="off"}) %>
                          <%: Html.ValidationMessageFor(model => model.unload_remarks3, "", new { @class = "text-danger" }) %>


                    </td>
               
                </tr>
         <tr>
                    <td style="font-size:11px;">Batch Number, Manufacturing Date, and Expiry Date are same as written in the Certificate of Analysis (COA) provided by the supplier</td>
                    <td>                                            
                                   <fieldset id="unload_approval4" class="radio-inline">
      <input type="radio" name="unload_approval4" value="Approved" checked>
&#10004;
    
  
      <input type="radio" name="unload_approval4" value="DisApproved">&#967;
    </fieldset>
                    </td>
                    <td> 
                        
                    <%: Html.TextBoxFor(model => model.unload_remarks4, new { @class = "form-control", @placeholder="Enter Some Text in the Field", @required ="true",@autocomplete="off"}) %>
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
           <fieldset id="checking_approval1" class="radio-inline">
      <input type="radio" name="checking_approval1" value="Approved" checked>
&#10004;
    
  
      <input type="radio" name="checking_approval1" value="DisApproved">&#967;
    </fieldset>


                    </td>
                    <td>
                        <%: Html.TextBoxFor(model => model.checking_remarks1, new { @class = "form-control", @placeholder="Enter Some Text in the Field", @required ="true",@autocomplete="off"}) %>
                          <%: Html.ValidationMessageFor(model => model.checking_remarks1, "", new { @class = "text-danger" }) %>


                    </td>
        
                   
                </tr>
                <tr>
                    <td>No foreign materials in the packaging and in the content of the raw material</td>
                    <td>           <fieldset id="checking_approval2" class="radio-inline">
      <input type="radio" name="checking_approval2" value="Approved" checked>
&#10004;
   
  
      <input type="radio" name="checking_approval2" value="DisApproved">&#967;
    </fieldset>                       </td>
                    <td>
      <%: Html.TextBoxFor(model => model.checking_remarks2, new { @class = "form-control", @placeholder="Enter Some Text in the Field", @required ="true",@autocomple="off"}) %>
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
    
  
      <input type="radio" name="checklist_approval" value="Rejection">&#967;
    </fieldset>


                    </td>
                    <td>
                        <%: Html.TextBoxFor(model => model.checklist_remarks, new { @class = "form-control", @placeholder="Remarks is required!", @required ="true",@id="QaApprovalRemarks",@autocomplete="off"}) %>
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

             <%--        <%: Html.EditorFor(model => model.mfg_date, new { @class = "form-control"})%>
                    <%: Html.ValidationMessageFor(model => model.mfg_date) %>--%>
          <%--             <%: Html.EditorFor(model => model.mfg_date, new { @class = "form-control"})%>
                    <%: Html.ValidationMessageFor(model => model.mfg_date) %>--%>
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

                <div class="box-footer" align="right">
                    <button type="submit" onclick="myFunction()" class="btn btn-primary">Save</button>
              

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
            $("#num1, #ActualDelivered, #num3, #num4, #subt,#master1, #master2,#ten, #expected, #reject").on("keydown keyup", sum);
            function sum() {

                $("#subt").val(Number($("#num1").val()) - Number($("#ActualDelivered").val()) - Number($("#num3").val()));
                $("#reject").val(Number($("#ActualDelivered").val()) - Number($("#num4").val()));
                $("#waiting").val(Number($("#num1").val()) - Number($("#subt").val()));
                $("#addition").val(Number($("#ActualDelivered").val()) + Number($("#num3").val()));
                $("#tenPercentMinusActual").val(Number($("#tenPercentComputation").val()) - Number($("#ActualDelivered").val()));
                $("#missing").val(Number($("#expected").val()) - Number($("#ActualDelivered").val()));
                $("#CPassword").val(Number($("#reject").val()) * 1);
                //const x = Number($("#ten").val()) * Number($("#expected").val());
                $("#tenPercentComputation").val(1.10 * Number($("#expected").val()));
                //$("#tenPercentComputationtimes1").val(1 * Number($("#tenPercentComputation").val()));

                $("#CompareActualDelivedtoReject").val(Number($("#ActualDelivered").val()) - Number($("#num4").val()));

                $("#mainexpected").val(Number($("#expected").val()) - Number($("#ActualDelivered").val()));


                const tenPercentAcceptable = $("#ten").val();
                const expectedDelivery = $("#expected").val();
                //const expecte = $("#expected").val();

                console.log(tenPercentAcceptable);
                console.log("eeto expected delivery: " + expectedDelivery);


                console.log(zeroten);
                //const zeroten= parseFloat(tenPercentAcceptable) * parseFloat(expectedDelivery);
                expectedDelivery = parseFloat(expectedDelivery) * 1.10;

                //console.log(x.toFixed(2));

                $("#masterpogi2").val(String($("#master2").val()));



            }
        });

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

        function myFunction() {

            if (confirm(datediff(parseDate(dateToday.value), parseDate(master2.value)) + "Days Between Mfg.Date And Expiry Date Do you want to Proceed The Checklist ?")) {

                //alert("pangit");
                //Yes mary me

                //rejection code validated the actual deliver



                if ($('#missing').val() < 0) {
                    //$("#master1").hide();

                    //alert("gf")
                    alert("Warning Expected Delivered is not equal at your actual Received !   : " + $('#missing').val())

                }

                //if ($('#ActualDelivered').val() < $('#num4').val()) {

                //    alert("Warning Actual Delivered is not Match at your Qty Reject !");

                //}
                else {
                    //alert("Pasok sa banga!")
                }



                //remarks 10 percent popup
                if ($('#tenPercentMinusActual').val() > 0) {
                    //$("#master1").hide();

                    ////confirm($('#missing').val() + "tae kaba!");
                    ////alert($('#tenPercentMinusActual').val() + "Maximum 10 Percent Allowable Exceed !");
                    //alert($('#tenPercentMinusActual').val() + "Pasok pa sa 10 Percent!");
                }
                else {
                    alert("Error Maximum 10 Percent Allowable Exceed !");
                }




            }
            else {

                ($('#QaApprovalRemarks').val(""));

            }

            //$("#masterpogi1").val(datediff(parseDate(master1.value), parseDate(master2.value)).val());
        }












        $(document).ready(function () {

            //iterate through each textboxes and add keyup
            //handler to trigger sum event
            $(".txt").each(function () {

                $(this).keyup(function () {
                    calculateSum();
                });
            });

        });

        function calculateSum() {

            var sum = 0;
            //iterate through each textboxes and add the values
            $(".txt").each(function () {

                //add only if the value is number
                if (!isNaN(this.value) && this.value.length != 0) {
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



        //$("#master1").mouseenter(function () {
        //    if ($(this).val()) {
        //        //$("#master1").hide();

        //        //alert("Select Expiry Date");
        //    }
        //    else {
        //        //$("#master2").hide();

        //        //alert(datediff(parseDate(master1.value), parseDate(master2.value)) + "Days Between Mfg.Date And Expiry Date Do you want to Proceed The Checklist ?");
        //    }

        //});
        //$("button").click(function () {
        //    $("input").val();
        //    $(this).hide();
        //});


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


                    if (confirm("Acceptance of Materials 60 days expiry notification")) {
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

                    //if (confirm("Acceptance of Materials 60 days expiry notification")) {
                    //    // Save it!
                    //} else {
                    //    // Do nothing!
                    //    ($('#master2').val(""));
                    //}
                    //break;
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


                    if (confirm("Acceptance of Materials 60 days expiry notification")) {
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





                $("#master1").val("");






        $("#ActualDelivered").mouseout(function () {
            if ($(this).val()) {

                if ($('#missing').val() < 0) {
                    //$("#master1").hide();

                    //confirm($('#missing').val() +"Negative Value is not alloweds"); comment muna pulido na this at 3/26/2020
                    //return false;
                    //break;
                }

                var sample = $('#tenPercentMinusActual').val();
                if ($('#tenPercentMinusActual').val() > 0) {
                    //$("#master1").hide();

                    //confirm($('#missing').val() + "tae kaba!");
                    //alert($('#tenPercentMinusActual').val() + "Maximum 10 Percent Allowable Exceed !");
                    //alert($('#tenPercentMinusActual').val() + "Pasok pa sa 10 Percent!");
                }
                else {
                    alert("Error Maximum 10 Percent Allowable Exceed !");
                }





                //var sample = $('#tenPercentMinusActual').val();
                //if ($('#tenPercentComputation').val() > sample) {
                //    //$("#master1").hide();

                //    //confirm($('#missing').val() + "tae kaba!");
                //    //return false;a
                //    //break;
                //    alert($('#tenPercentMinusActual').val() + "butu!");
                //}
                //else {
                //    alert($('#tenPercentMinusActual').val() + "Maximum 10 Percent Allowable Exceed !");
                //}



            }
            else {
                //alert("ANUIMAL");





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
                alert("Warning Actual Delivered is not Match at your Qty Reject !")

            }

            //if ($('#ActualDelivered').val() < $('#num4').val()) {

            //    alert("Warning Actual Delivered is not Match at your Qty Reject !");

            //}
            else {
                //alert("Pasok sa banga!")
            }


        });



        // date 2
        //var today = new Date();
        //var dd = today.getDate();
        //var mm = today.getMonth() + 1; //January is 0!
        //var yyyy = today.getFullYear();
        //if (dd < 10) {
        //    dd = '0' + dd
        //}
        //if (mm < 10) {
        //    mm = '0' + mm
        //}

        //today = yyyy + '-' + mm + '-' + dd;
        //document.getElementById("master2").setAttribute("min", today);






        //date TODAY SHowing

        var date = new Date();

        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();

        if (month < 10) month = "0" + month;
        if (day < 10) day = "0" + day;

        var today = year + "-" + month + "-" + day;


        document.getElementById('dateToday').value = today;





                //$("#days").mouseout(function () {
        //    datediff(parseDate(master1.value), parseDate(master2.value));
        //    if ($(this).val() < 60) {
        //        //$("#master1").hide();
        //        $('#days').val(datediff(parseDate(master1.value), parseDate(master2.value)));
        //        confirm("Acceptance of Materials 60 days expiry notification");
        //        //break;
        //    }
        //    else {
        //        //alert("NO");
        //    }


        //});




        ////matic number of days !!

        //$(document).ready(function () {

        //    $("#master1,#master2").datepicker({
        //        changeMonth: true,
        //        changeYear: true,
        //        firstDay: 1,
        //        dateFormat: 'mm/dd/yy',
        //    })

        //    $("#master1").datepicker({ dateFormat: 'mm-dd-yy' });
        //    $("#master2").datepicker({ dateFormat: 'mm-dd-yy' });

        //    $('#master2').change(function () {
        //        var start = $('#master1').datepicker('getDate');
        //        var end = $('#master2').datepicker('getDate');

        //        if (start < end) {
        //            var days = (end - start) / 1000 / 60 / 60 / 24;
        //            $('#days').val(days);
        //        }
        //        else {
        //            alert("You cant come back before you have been!");
        //            $('#master1').val("");
        //            $('#master2').val("");
        //            $('#days').val("");
        //        }
        //    }); //end change function
        //}); //end ready


</script>
    <script>



        ////Date 1
        //var today = new Date();
        //var dd = today.getDate();
        //var mm = today.getMonth() + 1; //January is 0!
        //var yy = today.getFullYear();
        //if (dd < 10) {
        //    dd = '0' + dd
        //}

        //if (mm < 10) {
        //    mm = '0' + mm
        //}


        ////today11 = yyyy + '-' + mm + '-' + dd;         today11 = mm + '-' + dd + '-' + yyyy;
        //today11 = yy + '-' + mm + '-' + dd;


        //document.getElementById("master1").setAttribute("min", today11);


        //recoding
        //var maxDate = year + '-' + month + '-' + day;
        //alert(maxDate);
        //$('#master1').attr('min', maxDate);


        //$(function () {
        //    var dtToday = new Date();

        //    var month = dtToday.getMonth() + 1;
        //    var day = dtToday.getDate();
        //    var year = dtToday.getFullYear();
        //    if (month < 10)
        //        month = '0' + month.toString();
        //    if (day < 10)
        //        day = '0' + day.toString();

        //    var maxDate = year + '-' + month + '-' + day;
        //    alert(maxDate);
        //    $('#master1').attr('min', maxDate);
        //});


        //$(document).ready(function () {
        //    $("#master1").datepicker();


        //});

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

    </script>








</asp:Content>
