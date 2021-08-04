<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<SodetsoUsersManagement.Models.EditMacroModel>" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
      <%: ViewBag.PageTitle = "Partial Receiving of Macro PO Summary" %>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


                    <!-- row -->
                    <div class="row">
                    <div class="col-md-6">
                    <% if (TempData["Feedmill Macro PO Summary CheckList Updated Successfully!"] != null)
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
                <% using (Html.BeginForm("UpdateMacroPo", null, FormMethod.Post, new { role = "form", id = "FormUser", enctype = "multipart/form-data" }))
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
                    <td> <%: Html.TextBoxFor(model => model.vendor_name, new { @class = "form-control", @placeholder="Enter Vendor Name", ReadOnly="true"}) %>  </td>

                    <td>Date of Checking</td>
                    <td>
                    <%: Html.TextBoxFor(model => model.date_modified_status, new { @class = "form-control", @placeholder="Manufacturing Date", @required ="true",@id="dateToday",@ReadOnly="true" }) %>
                    <%: Html.ValidationMessageFor(model => model.date_modified_status, "", new { @class = "text-danger" }) %>
                    </td>

                    </tr>
              

                    <tr>
                    <th colspan="4" style="text-align:center; font-size:14px; background-color:#3c8dbc;color:white;">RECEIVING INFORMATION'S</th>

                    </tr>
   



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
                    <td>Qty. Ordered</td>
                    <td>       
                    <input type="text" id="num1" name="qty_ordered" class="form-control" value="<%: Model.qty_ordered %>" readonly/> 

                    </td>
                   
                   
                    <td>Qty. Ordered UOM</td>
                    <td> 

            
                    <select id="uom_data" style="background-color:yellow" class="form-control">
                                                  
                    <option value="kgs">kgs</option>
                    <option value="gms">gms </option>
                                                  
                    <option value="litters">litters</option>
      
                    <option value="boxes">boxes</option>
                    <option value="litters">litters</option>
                    <option value="boxes">boxes</option>
                    <option value="bags/sacks">bags/ascks</option>
                    <option value="drums">drums</option>
                    <option value="others">others</option>
                    </select>
             
                    <%: Html.TextBoxFor(model => model.qty_uom, new { @class = "form-control", @placeholder="Enter UOM",@required="true",@id ="uom-actual-data",@autocomplete="off"}) %>        
                    <%: Html.ValidationMessageFor(model => model.qty_uom, "", new { @class = "text-danger" }) %>
 

                    </td>
                    </tr>
                
                    <tr>

                    <td>  Plate No.</td>
                    <td style="font-size:20px">  
                 

                    <%: Html.TextBoxFor(model => model.plate_no, new { @class = "form-control", @placeholder="Plate No", @required ="true",@autocomplete="off",@style="background-color:yellow" }) %>
                    <%: Html.ValidationMessageFor(model => model.plate_no, "", new { @class = "text-danger",@style="font-size:14px;" }) %>
               
                    </td>

                    <td>Truck Scale Rec No.</td>
                    <td style="font-size:20px">
                    <%: Html.TextBoxFor(model => model.truck_scale_rec_no, new { @class = "form-control", @placeholder="Scale Rec No", @required ="true", @autofocus="autofocus",@autocomplete="off",@style="background-color:yellow",@min="0"}) %>
                    <%: Html.ValidationMessageFor(model => model.truck_scale_rec_no, "", new { @class = "text-danger",@style="font-size:14px;" }) %>
                    </td>
                    </tr>

                    <tr>
                    <td>Vehicle Type</td>
                    <td style="font-size:20px;background-color:yellow">  
                 


                        
                    <select id="vehicle-type-id" class="form-control">
                                                  
                    <option value="forward">forward </option>
                    <option value="ten wheeler">ten wheeler</option>
                    <option value="trailer">elf</option>
      
                    <option value="closed van">closed van</option>
                    <option value="tank truck">tank truck</option>
                    <option value="others">others</option>
                    </select>
           
                    <%: Html.TextBoxFor(model => model.vehicle_type, new { @class = "form-control", @placeholder="Remarks",@required="true",@id ="vehicle-type-data",@autocomplete="off"}) %>        
                    <%: Html.ValidationMessageFor(model => model.vehicle_type, "", new { @class = "text-danger" }) %>


                    </td>

                    <td>Truck Scale Gross Weight</td>
                    <td style="font-size:20px">
                    <%: Html.TextBoxFor(model => model.truck_gross_weight, new { @class = "form-control", @placeholder="Gross Weight", @required ="true", @autofocus="autofocus",@autocomplete="off",@style="background-color:yellow",@id="gross_weight"}) %>
                    <%: Html.ValidationMessageFor(model => model.truck_gross_weight, "", new { @class = "text-danger",@style="font-size:14px;" }) %>
                    </td>
                    </tr>

                    <tr>

                    <td>Truck Scale Tare Weight</td>
                    <td style="font-size:20px">  
                 

                    <%: Html.TextBoxFor(model => model.truck_tare_weight, new { @class = "form-control", @placeholder="Tare Weight", @required ="true",@autocomplete="off",@style="background-color:yellow",@id="tare_weight" }) %>
                    <%: Html.ValidationMessageFor(model => model.truck_tare_weight, "", new { @class = "text-danger",@style="font-size:14px;" }) %>
               
                    </td>

                    <td>Truck Scale Net Weight</td>
                    <td style="font-size:20px">
                    <%: Html.TextBoxFor(model => model.truck_net_weight, new { @class = "form-control", @placeholder="Net Weight", @required ="true", @autofocus="autofocus",@autocomplete="off",@style="background-color:white",@ReadOnly="true",@id="net_weight"}) %>
                    <%: Html.ValidationMessageFor(model => model.truck_net_weight, "", new { @class = "text-danger",@style="font-size:14px;" }) %>

                    </td>
                    </tr>

                    <tr>
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
                    <%: Html.ValidationMessageFor(model => model.expiry_date, "", new { @class = "text-danger",@style="font-size:14px;" }) %>

                    <input type="hidden" id="masterpogi2" class="form-control"/>    
                    </td>
                    </tr>

    
                    <tr>
                

                    <td>  Expected Delivery</td>
                    <td>                       
                    <%: Html.TextBoxFor(model => model.stacking_level, new { @class = "form-control requiredfilled", @placeholder="Expected Delivery",@required ="true",@id="expected",@autocomplete="off",@maxlength="15",@Style="background-color:yellow"}) %>
                                         
                                          
                    <%: Html.ValidationMessageFor(model => model.stacking_level, "", new { @class = "text-danger" }) %>

                    <input type="text" id="tenPercentComputation" value="0" class="form-control"/>    


                          <input type="text" id="tenPercentComputationChange" value="0" class="form-control"/>  

                    </td>
          
                    <td>Qty. Actual Delivered</td>
                    <td>

                    <%: Html.TextBoxFor(model => model.qty_total_delivered, new { @class = "form-control requiredfilled", @placeholder="Qty Actual Delivered", @required = "true", @id="ActualDelivered",@autocomplete="off",@Style="background-color:white",@ReadOnly="true"}) %>
                                         
                    <%: Html.ValidationMessageFor(model => model.qty_total_delivered, "", new { @class = "text-danger" }) %>


                    <input type="hidden" id="tenPercentMinusActualCopy" />  
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

                    </tr>



                    <tr class="<%: Session["Position"] %>">

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
              
                    <td>Actual Needed</td>
                    <td>



                    <% 
                      
                    if (Model.qty_remarks == "0")

                    {%>  
                    <input type="text" value="<%: Model.qty_ordered%>" class="form-control" readonly />

                  

                    <% }
                    else
                    {  %>
                    
                    <input type="text" value="<%: Model.qty_remarks%>" id="ActualNeeded" class="form-control" readonly />

                    <%  } %>


                    <%: Html.TextBoxFor(model => model.qty_waiting, new { @class = "form-control", @placeholder="Qty Waiting", @required = "true", @id="subt",ReadOnly ="true",@style="display:none"}) %>
                    <%: Html.ValidationMessageFor(model => model.qty_waiting, "", new { @class = "text-danger" }) %>
                 
                

                    </td>


                    <td>Batch No.</td>
        
                    <td>                                <%: Html.TextBoxFor(model => model.batch_number, new { @class = "form-control requiredfilled batches", @placeholder="Enter Batch Number",@autocomplete="off"}) %>
                    <%: Html.ValidationMessageFor(model => model.batch_number, "", new { @class = "text-danger" }) %>

                    </td>
                    </tr>




                    <tr>
                    <td>Act. Delivered UOM</td>
                    <td style="font-size:20px;background-color:yellow">  
                 

                    <select id="uom_data-delivered" class="form-control">
                                                  
                    <option value="kgs">kgs</option>
                    <option value="gms">gms </option>
                    <option value="litters">litters</option>
                    <option value="boxes">boxes</option>
                    <option value="litters">litters</option>
                    <option value="boxes">boxes</option>
                    <option value="bags/sacks">bags/ascks</option>
                    <option value="drums">drums</option>
                    <option value="others">others</option>
                    </select>
           
                    <%: Html.TextBoxFor(model => model.actual_delivered_uom, new { @class = "form-control", @placeholder="Enter UOM",@required="true",@id ="uom-actual-data-delivered",@autocomplete="off"}) %>        
                    <%: Html.ValidationMessageFor(model => model.actual_delivered_uom, "", new { @class = "text-danger" }) %>


                    </td>

                    <td>Unloading Date</td>
                    <td style="font-size:20px">
                    <%: Html.TextBoxFor(model => model.unloading_date, new { @class = "form-control", @placeholder="Net Weight", @required ="true", @autofocus="autofocus",@autocomplete="off",@type="date",@style="background-color:yellow"}) %>
                    <%: Html.ValidationMessageFor(model => model.unloading_date, "", new { @class = "text-danger", @style="font-size:14px;" }) %>

                      
                    </td>


                    </tr>


    
                    <tr>
                    <td>Test Date</td>
                    <td style="font-size:20px">  
                 

                    <%: Html.TextBoxFor(model => model.test_date, new { @class = "form-control", @placeholder="Actual UOM", @required ="true",@autocomplete="off",@style="background-color:yellow",@type="date" }) %>
                    <%: Html.ValidationMessageFor(model => model.test_date, "", new { @class = "text-danger",@style="font-size:14px;" }) %>
                    </td>

                    <td>Lot No</td>
                    <td style="font-size:20px">
                    <%: Html.TextBoxFor(model => model.lot_no, new { @class = "form-control", @placeholder="Lot No", @required ="true", @autofocus="autofocus",@autocomplete="off",@type="text",@style="background-color:yellow"}) %>
                    <%: Html.ValidationMessageFor(model => model.lot_no, "", new { @class = "text-danger",@style="font-size:14px;" }) %>
                    </td>


                    </tr>




                  
                    <tr>
                    <th colspan="3" style="text-align:center;font-size:14px; background-color:#3c8dbc;color:white;">REJECTION INFORMATION'S</th>
                    <th style="text-align:center;font-size:14px; background-color:#3c8dbc;color:white;">  
                    <b onclick="myFunctionshowtext1()" id="btn1" class="btn btn-danger add-row">Add New Row</b></>
                    <b onclick="myFunctionshowtext2()" id="btn2" class="btn btn-danger">Add New Row</b></>
                    </th>
                    </tr>
                                       

                    <tr style="background-color:#3c8dbc;color:white;">
                    <th scope="col" style="text-align:center">QTY</th>
                    <th scope="col" style="text-align:center;">&#10004; &nbsp; <b>REMARKS</b></th>
                    <th scope="col" style="text-align:center">QTY</th>
                    <th scope="col" style="text-align:center;">&#10004; &nbsp; <b>REMARKS</b></th>
                    </tr>


                    <tr>
                    <td>Delivery Acceptance</td>
                    <td style="font-size:20px;background-color:yellow">  
                 

                    <select id="delivery-acceptance" class="form-control">
                                                  
                    <option value="All Accepted">All Accepted</option>
                    <option value="All Rejected">All Rejected</option>
                    <option value="Pulled Out">Pulled Out</option>   
                    <option value="All w/Price Adjustment">All w/Price Adjustment</option>
                    <option value="Partial Rejection">litters</option>
                    <option value="Partial w/ Price Adjustment">Partial w/ Price Adjustment</option>
                    <option value="others">others</option>
                    </select>
           
                    <%: Html.TextBoxFor(model => model.delivery_acceptance, new { @class = "form-control", @placeholder="Remarks",@required="true",@id ="delivery-acceptance-data",@autocomplete="off"}) %>        
                    <%: Html.ValidationMessageFor(model => model.delivery_acceptance, "", new { @class = "text-danger" }) %>

                    </td>

                    <td>Re-sack and other charges</td>
                    <td style="font-size:20px;background-color:yellow">



                    <select id="resack-others" class="form-control">
                                                  
                    <option value="Yes">Yes</option>
                    <option value="No">No</option>
                    <option value="others">others</option>
                    </select>
           
                    <%: Html.TextBoxFor(model => model.resack_others, new { @class = "form-control", @placeholder="Enter Re-sack",@required="true",@id ="resack-others-data",@autocomplete="off"}) %>        
                    <%: Html.ValidationMessageFor(model => model.resack_others, "", new { @class = "text-danger" }) %>

                      
                    </td>
                    </tr>


                    <tr>
                    <td>Act. Reject UOM</td>
                    <td style="font-size:20px;background-color:yellow">  
                 

                    <select id="uom-reject" class="form-control">
                                                  
                    <option value="kgs">kgs</option>
                    <option value="gms">gms </option>
                                             
                    <option value="litters">litters</option>
                    <option value="boxes">boxes</option>
                    <option value="litters">litters</option>
                    <option value="boxes">boxes</option>
                    <option value="bags/sacks">bags/ascks</option>
                    <option value="drums">drums</option>
                    <option value="others">others</option>
                    </select>
                    </td>

                    <td>Status</td>
                    <td style="font-size:20px">
                    <%: Html.TextBoxFor(model => model.qty_reject_uom, new { @class = "form-control", @placeholder="Reject UOM",@required="true",@id ="uom-reject-data",@autocomplete="off"}) %>        
                    <%: Html.ValidationMessageFor(model => model.qty_reject_uom, "", new { @class = "text-danger" }) %>

                      
                    </td>


                    </tr>




                    <td>


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

                    <tr>
                    <td colspan="2">Non- Conformance Finding/s or Reason for Rejection</td>
                    <td colspan="2" style="text-align:center">                                            
                    
                        
                    <%: @Html.RadioButtonFor(model => model.rej_data1, "Approved")  %> <span class="fa fa-check"></span>
            

                    <%: @Html.RadioButtonFor(model => model.rej_data1, "DisApproved") %> <span class="fa fa-times"></span>
           
                    <%: @Html.ValidationMessageFor(model => model.rej_data1, "", new { @class = "text-danger" }) %>
                    </td>
     
                    </tr>


    <!-- Sample code here scripting -->
                    <tr>
                    <td colspan="2">dirty packaging</td>
                    <td colspan="2" style="text-align:center">                                            

                    <%: @Html.RadioButtonFor(model => model.rej_data2, "Approved")  %> <span class="fa fa-check"></span>
      
        

                    <%: @Html.RadioButtonFor(model => model.rej_data2, "DisApproved") %> <span class="fa fa-times"></span>
           
                    <%: @Html.ValidationMessageFor(model => model.rej_data2, "", new { @class = "text-danger" }) %>
             
                    </td>
     
                    </tr>


                    <tr>
                    <td colspan="2">damaged packaging</td>
                    <td colspan="2" style="text-align:center">                                            
    
                    <%: @Html.RadioButtonFor(model => model.rej_data3, "Approved")  %> <span class="fa fa-check"></span>
            
        

                    <%: @Html.RadioButtonFor(model => model.rej_data3, "DisApproved") %> <span class="fa fa-times"></span>
           
                    <%: @Html.ValidationMessageFor(model => model.rej_data3, "", new { @class = "text-danger" }) %>
                    </td>
     
                    </tr>

                    <tr>
                    <td colspan="2">poor quality packaging</td>
                    <td colspan="2" style="text-align:center">                                            
  
                        

                    <%: @Html.RadioButtonFor(model => model.rej_data4, "Approved")  %> <span class="fa fa-check"></span>
            
        

                    <%: @Html.RadioButtonFor(model => model.rej_data4, "DisApproved") %> <span class="fa fa-times"></span>
           
                    <%: @Html.ValidationMessageFor(model => model.rej_data4, "", new { @class = "text-danger" }) %>

                    </td>
     
                    </tr>


                    <tr style="display:none;">
                    <td colspan="2">expired</td>
                    <td colspan="2" style="text-align:center;">                                            
                    <fieldset id="group84" class="radio-inline">
                    <input type="radio" name="rej_data5" value="Approved" checked>
                    &#10004;

                    <input type="radio" name="rej_data5" value="DisApproved">&#967;
                    </fieldset>
                    </td>
     
                    </tr>


                    <tr>
                    <td colspan="2">wet portions</td>
                    <td colspan="2" style="text-align:center">                                            


                    <%: @Html.RadioButtonFor(model => model.rej_data6, "Approved")  %> <span class="fa fa-check"></span>
            
        

                    <%: @Html.RadioButtonFor(model => model.rej_data6, "DisApproved") %> <span class="fa fa-times"></span>
           
                    <%: @Html.ValidationMessageFor(model => model.rej_data6, "", new { @class = "text-danger" }) %>
                    </td>
     
                    </tr>


                    <tr>
                    <td colspan="2">insect infested</td>
                    <td colspan="2" style="text-align:center">                                            

                    <%: @Html.RadioButtonFor(model => model.rej_data7, "Approved")  %> <span class="fa fa-check"></span>
            
        

                    <%: @Html.RadioButtonFor(model => model.rej_data7, "DisApproved") %> <span class="fa fa-times"></span>
           
                    <%: @Html.ValidationMessageFor(model => model.rej_data7) %>
                    </td>
     
                    </tr>


                    <tr>
                    <td colspan="2">Others</td>
                    <td colspan="2" style="text-align:center">                                            
                    <%: Html.TextBoxFor(model => model.rej_others, new { @class = "form-control requiredfilled", @placeholder="Remarks Required", @required ="true",autocomplete="off"}) %>
                    <%: Html.ValidationMessageFor(model => model.rej_others, "", new { @class = "text-danger" }) %>

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

                <input type="text" id="QtyRejectx1" placeholder="RejectQtyx1" class="form-control"/>``
                <input type="text" id="actualReject" value="<%: Model.qty_void %>" class="form-control" readonly />
                <input type="text" id="totalQtyReject" name="qty_void" placeholder="totalQtyReject" class="form-control"/>

                <input type="text" id="GoodMinusOrderedTotal" name="qty_remarks" placeholder="totalQtyRemarksman" class="form-control"/>


                <%: Html.TextBoxFor(model => model.FinalFormulaNegative, new { @class = "form-control", @placeholder = "Confirm No. of Good", id = "FinalFormulaNegative", @required = "true",ReadOnly ="true",min="0" }) %>
                <%: Html.ValidationMessageFor(model => model.FinalFormulaNegative, "", new { @class = "text-danger" }) %>
                </td>

              
            
                </tr>

            </table>


                   <div class="form-group">

                            </div>

                            </div>

                        </div>

                        <div class="col-md-6">

                   <i>Upon arrival of the vehicle of medication/material at unloading area, inspect the following</i>
                   <table class="table table-bordered">
                  <tr style="background-color:#3c8dbc;color:white;">
                  <th scope="col">TRUCK INSPECTION</th>
                  <th scope="col" style="text-align:center;">&#10004;&nbsp;  /  &nbsp; <b>X</b></th>
                  <th scope="col" style="display:none">REMARKS</th>
  
                </tr>
                    <tr>
                    <td>The trucks are covered and closed (no tarpaulin damage - if applicable)</td>
                   
                    
                    <td style="width:100px">
 
                    <%: @Html.RadioButtonFor(model => model.truck_approval1, "Approved")  %> <span class="fa fa-check"></span>
            
        

                    <%: @Html.RadioButtonFor(model => model.truck_approval1, "DisApproved") %> <span class="fa fa-times"></span>
           
                    <%: @Html.ValidationMessageFor(model => model.truck_approval1, "", new { @class = "text-danger" }) %>
                 
                    </td>
                    <td style="display:none">                 
                    <%: Html.TextBoxFor(model => model.truck_remarks1, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",autocomplete="off",@Value="Validated",@ReadOnly="true"}) %>
                    <%: Html.ValidationMessageFor(model => model.truck_remarks1, "", new { @class = "text-danger" }) %>
                    </td>      
                    </tr>
                    <tr>
                    <td>Floorboards are dry and clean</td>
                    <td>        
                        
                        
                    <%: @Html.RadioButtonFor(model => model.truck_approval2, "Approved")  %> <span class="fa fa-check"></span>
            
        

                    <%: @Html.RadioButtonFor(model => model.truck_approval2, "DisApproved") %> <span class="fa fa-times"></span>
           
                    <%: @Html.ValidationMessageFor(model => model.truck_approval2, "", new { @class = "text-danger" }) %>

                    </td>
                    <td style="display:none">
                    <%: Html.TextBoxFor(model => model.truck_remarks2, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off",@Value="Validated",@ReadOnly="true"}) %>
                    <%: Html.ValidationMessageFor(model => model.truck_remarks2, "", new { @class = "text-danger" }) %>


                    </td>
             
                    </tr>
                    <tr>
                    <td>No evidence of chemical spills, garbage, waste or spoiled foods</td>
                    <td> 
                        

                    <%: @Html.RadioButtonFor(model => model.truck_approval3, "Approved")  %> <span class="fa fa-check"></span>
            
        

                    <%: @Html.RadioButtonFor(model => model.truck_approval3, "DisApproved") %> <span class="fa fa-times"></span>
           
                    <%: @Html.ValidationMessageFor(model => model.truck_approval3, "", new { @class = "text-danger" }) %>

                    </td>
                    <td style="display:none">
                    <%: Html.TextBoxFor(model => model.truck_remarks3, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off",@Value="Validated",@ReadOnly="true"}) %>
                    <%: Html.ValidationMessageFor(model => model.truck_remarks3, "", new { @class = "text-danger" }) %>

                    </td>
                    </tr>



                    <tr>
                    <td>No insect and rodent activity</td>
                    <td>             
                        

                    <%: @Html.RadioButtonFor(model => model.truck_approval4, "Approved")  %> <span class="fa fa-check"></span>
            
        

                    <%: @Html.RadioButtonFor(model => model.truck_approval4, "DisApproved") %> <span class="fa fa-times"></span>
           
                    <%: @Html.ValidationMessageFor(model => model.truck_approval4, "", new { @class = "text-danger" }) %>
                    </td>
                    <td style="display:none">
                    <%: Html.TextBoxFor(model => model.truck_remarks4, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off",@Value="Validated",@ReadOnly="true"}) %>
                    <%: Html.ValidationMessageFor(model => model.truck_remarks4, "", new { @class = "text-danger" }) %>

                    </td>
                    </tr>

    
                    <tr>
                    <td>No signs of tampering</td>
                    <td>   
                        
                    <%: @Html.RadioButtonFor(model => model.truck_approval5, "Approved")  %> <span class="fa fa-check"></span>
            
        

                    <%: @Html.RadioButtonFor(model => model.truck_approval5, "DisApproved") %> <span class="fa fa-times"></span>
           
                    <%: @Html.ValidationMessageFor(model => model.truck_approval5, "", new { @class = "text-danger" }) %>
                    </td>
                    <td style="display:none">
                    <%: Html.TextBoxFor(model => model.truck_remarks5, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off",@Value="Validated",@ReadOnly="true"}) %>
                    <%: Html.ValidationMessageFor(model => model.truck_remarks5, "", new { @class = "text-danger" }) %>


                    </td>
                    </tr>


                    <tr>
                    <td>No signs of pilferage</td>
                    <td>        
                        
                    <%: @Html.RadioButtonFor(model => model.truck_approval6, "Approved")  %> <span class="fa fa-check"></span>
            
        

                    <%: @Html.RadioButtonFor(model => model.truck_approval6, "DisApproved") %> <span class="fa fa-times"></span>
           
                    <%: @Html.ValidationMessageFor(model => model.truck_approval6, "", new { @class = "text-danger" }) %>
                    </td>
                    <td style="display:none">
                    <%: Html.TextBoxFor(model => model.truck_remarks6, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off",@Value="Validated",@ReadOnly="true"}) %>
                    <%: Html.ValidationMessageFor(model => model.truck_remarks6, "", new { @class = "text-danger" }) %>


                    </td>
                    </tr>



                    <tr>
                    <td>No signs of moisture accumulation or wetness</td>
                    <td>                                            

                        
                    <%: @Html.RadioButtonFor(model => model.truck_approval7, "Approved")  %> <span class="fa fa-check"></span>
            
        

                    <%: @Html.RadioButtonFor(model => model.truck_approval7, "DisApproved") %> <span class="fa fa-times"></span>
           
                    <%: @Html.ValidationMessageFor(model => model.truck_approval7, "", new { @class = "text-danger" }) %>
                    </td>
                    <td style="display:none">
                    <%: Html.TextBoxFor(model => model.truck_remarks7, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off",@Value="Validated",@ReadOnly="true"}) %>
                    <%: Html.ValidationMessageFor(model => model.truck_remarks7, "", new { @class = "text-danger" }) %>


                    </td>
                    </tr>


    
                        <tr>
                        <td>No sig. signs of heating</td>
                        <td>        
                        
                        <%: @Html.RadioButtonFor(model => model.truck_approval8, "Approved")  %> <span class="fa fa-check"></span>
            
        

                        <%: @Html.RadioButtonFor(model => model.truck_approval8, "DisApproved") %> <span class="fa fa-times"></span>
           
                        <%: @Html.ValidationMessageFor(model => model.truck_approval8, "", new { @class = "text-danger" }) %>
                        </td>
                        <td style="display:none">
                        <%: Html.TextBoxFor(model => model.truck_remarks8, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off",@Value="Validated",@ReadOnly="true"}) %>
                        <%: Html.ValidationMessageFor(model => model.truck_remarks8, "", new { @class = "text-danger" }) %>


                        </td>
                        </tr>



                    <tr>
                    <td>No other unusual signs that may render doubt on the integrity of the delivery</td>
                    <td>       
                        
                    <%: @Html.RadioButtonFor(model => model.truck_approval9, "Approved")  %> <span class="fa fa-check"></span>
            
        

                    <%: @Html.RadioButtonFor(model => model.truck_approval9, "DisApproved") %> <span class="fa fa-times"></span>
           
                    <%: @Html.ValidationMessageFor(model => model.truck_approval9, "", new { @class = "text-danger" }) %>
                    </td>
                    <td style="display:none">
                    <%: Html.TextBoxFor(model => model.truck_remarks9, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off",@Value="Validated",@ReadOnly="true"}) %>
                    <%: Html.ValidationMessageFor(model => model.truck_remarks9, "", new { @class = "text-danger" }) %>


                    </td>
                    </tr>
       
                    <tr>
                    <td>No evidence of chemical spills, garbage, waste or spoiled foods</td>
                    <td>      
                        
                    <%: @Html.RadioButtonFor(model => model.truck_approval10, "Approved")  %> <span class="fa fa-check"></span>
            
        

                    <%: @Html.RadioButtonFor(model => model.truck_approval10, "DisApproved") %> <span class="fa fa-times"></span>
           
                    <%: @Html.ValidationMessageFor(model => model.truck_approval10, "", new { @class = "text-danger" }) %>
                    </td>
                    <td style="display:none">
                    <%: Html.TextBoxFor(model => model.truck_remarks10, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off",@Value="Validated",@ReadOnly="true"}) %>
                    <%: Html.ValidationMessageFor(model => model.truck_remarks10, "", new { @class = "text-danger" }) %>


                    </td>
                    </tr>


                    <tr>
                    <td colspan="2">
                    <%: Html.TextBoxFor(model => model.truck_remarks_all, new { @class = "form-control requiredfilled", @placeholder="Remarks is Required", @required ="true",@autocomplete="off"}) %>
                    <%: Html.ValidationMessageFor(model => model.truck_remarks_all, "", new { @class = "text-danger" }) %>
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

                        

                    <%: @Html.RadioButtonFor(model => model.unload_approval3, "Approved")  %> <span class="fa fa-check"></span>
            
       
                    <%: @Html.RadioButtonFor(model => model.unload_approval3, "DisApproved") %> <span class="fa fa-times"></span>
           
                    <%: @Html.ValidationMessageFor(model => model.unload_approval3, "", new { @class = "text-danger" }) %>



                    </td>
                    <td> 
                    <%: Html.TextBoxFor(model => model.unload_remarks3, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                    <%: Html.ValidationMessageFor(model => model.unload_remarks3, "", new { @class = "text-danger" }) %>


                    </td>
               
                    </tr>




                    <tr style="display:none;">
                    <td>Addional Unloading Data</td>
                    <td>  
                    <fieldset id="unload_approval5" class="radio-inline">
                    <input type="radio" name="additional_unloading" value="Approved" checked>
                    &#10004;
    
  
                    <input type="radio" name="additional_unloading" value="DisApproved">&#967;
                    </fieldset>

                    </td>
                    <td> 
                    <%: Html.TextBoxFor(model => model.additional_unloading_remarks, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off",@Value="Validated"}) %>
                    <%: Html.ValidationMessageFor(model => model.additional_unloading_remarks, "", new { @class = "text-danger" }) %>


                    </td>
               
                    </tr>



                    <tr>
                    <td style="font-size:11px;">Batch Number, Manufacturing Date, and Expiry Date are same as written in the Certificate of Analysis (COA) provided by the supplier</td>
                    <td>     
                        
                        

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
            
                                    
                        
                    <%: @Html.RadioButtonFor(model => model.checking_approval2, "Approved")  %> <span class="fa fa-check"></span>
            
       
                    <%: @Html.RadioButtonFor(model => model.checking_approval2, "DisApproved") %> <span class="fa fa-times"></span>
           
                    <%: @Html.ValidationMessageFor(model => model.checking_approval2, "", new { @class = "text-danger" }) %>

                    </td>
                    <td>
                    <%: Html.TextBoxFor(model => model.checking_remarks2, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                    <%: Html.ValidationMessageFor(model => model.checking_remarks2, "", new { @class = "text-danger" }) %>

                    </td>

                    </tr>
                
                    <tr>
                    <td>Sample Weight 1</td>
                           
                    <td colspan="2">
                    <%: Html.TextBoxFor(model => model.sample_weight1, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                    <%: Html.ValidationMessageFor(model => model.sample_weight1, "", new { @class = "text-danger" }) %>

                    </td>
                    </tr>



                    <tr>
                    <td>Sample Weight 2</td>
                           
                    <td colspan="2">
                    <%: Html.TextBoxFor(model => model.sample_weight2, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                    <%: Html.ValidationMessageFor(model => model.sample_weight2, "", new { @class = "text-danger" }) %>

                    </td>
                    </tr>

                    

                    <tr>
                    <td>Sample Weight 3</td>
                           
                    <td colspan="2">
                    <%: Html.TextBoxFor(model => model.sample_weight3, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                    <%: Html.ValidationMessageFor(model => model.sample_weight3, "", new { @class = "text-danger" }) %>

                    </td>
                    </tr>


                    </table>


                            </div>



                    <!-- 4rd -->
                            
                    <div class="form-group">

                    <table class="table table-bordered">
                    <tr style="background-color:#3c8dbc;color:white;">
                    <th scope="col">LAB, other Test and info</th>
                    <%--   <th scope="col" style="text-align:center;">&#10004; /&nbsp; <b>X</b></th>--%>
                    <th scope="col" colspan="2">REMARKS</th>
  
                    </tr>
        
                
                    <tr>
                    <td>COA</td>
                           
                    <td style="font-size:20px;background-color:yellow"colspan="2">
                            
                                    

                    <select id="laboratory" name="lab_1" class="form-control">
                                                  
                    <option value="yes">yes</option>
                    <option value="to follow">to follow</option>
                    <option value="None">None</option>   
                    <option value="N/A">N/A</option>
                         
                    </select>

                    </td>
                    </tr>



                    <tr>
                    <td>Moisture %</td>
                           
                    <td colspan="2">
                    <%: Html.TextBoxFor(model => model.lab_2, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                    <%: Html.ValidationMessageFor(model => model.lab_2, "", new { @class = "text-danger" }) %>

                    </td>
                    </tr>

                    

                    <tr>
                    <td>Aflatoxin, ppb</td>
                           
                    <td colspan="2">
                    <%: Html.TextBoxFor(model => model.lab_3, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                    <%: Html.ValidationMessageFor(model => model.lab_3, "", new { @class = "text-danger" }) %>

                    </td>
                    </tr>

                        
                    <tr>
                    <td>T2, ppb</td>
                           
                    <td colspan="2">
                    <%: Html.TextBoxFor(model => model.lab_4, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                    <%: Html.ValidationMessageFor(model => model.lab_4, "", new { @class = "text-danger" }) %>

                    </td>
                    </tr>


                    <tr>
                    <td>Zea, ppb</td>
                           
                    <td colspan="2">
                    <%: Html.TextBoxFor(model => model.lab_5, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                    <%: Html.ValidationMessageFor(model => model.lab_5, "", new { @class = "text-danger" }) %>

                    </td>
                    </tr>


                    <tr>
                    <td>FFA, as lauric</td>
                           
                    <td colspan="2">
                    <%: Html.TextBoxFor(model => model.lab_6, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                    <%: Html.ValidationMessageFor(model => model.lab_6, "", new { @class = "text-danger" }) %>

                    </td>
                    </tr>


                    <tr>
                    <td>FFA, as oleic</td>
                           
                    <td colspan="2">
                    <%: Html.TextBoxFor(model => model.lab_7, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                    <%: Html.ValidationMessageFor(model => model.lab_7, "", new { @class = "text-danger" }) %>

                    </td>
                    </tr>


                    <tr>
                    <td>Urease</td>
                           
                    <td colspan="2">
                    <%: Html.TextBoxFor(model => model.lab_8, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                    <%: Html.ValidationMessageFor(model => model.lab_8, "", new { @class = "text-danger" }) %>

                    </td>
                    </tr>


                    <tr>
                    <td>Adulterant</td>
                           
                    <td colspan="2">
                    <%: Html.TextBoxFor(model => model.lab_9, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                    <%: Html.ValidationMessageFor(model => model.lab_9, "", new { @class = "text-danger" }) %>

                    </td>
                    </tr>


                    <tr>
                    <td>Brix</td>
                           
                    <td style="font-size:20px;background-color:yellow" colspan="2">
                    <%: Html.TextBoxFor(model => model.lab_10, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off"}) %>
                    <%: Html.ValidationMessageFor(model => model.lab_10, "", new { @class = "text-danger" }) %>

                    </td>
                    </tr>



                    <%--                                This is the starting of pointing Details--%>

                    <tr>
                    <td>Phys Quality Score-Color</td>
                           
                    <td style="font-size:20px;background-color:yellow" colspan="2">
                            
                                    

                    <select name="phys_1" id="physics-1" class="form-control">
                                                  
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>   
                    <option value="3">3</option>
                    </select>

                    </td>
                    </tr>

                    <tr>
                    <td>Phys Quality Score-Insects</td>
                           
                    <td style="font-size:20px;background-color:yellow" colspan="2">
                            
                                    

                    <select name="phys_2" id="physics-2" class="form-control">
                                                  
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>   
                    <option value="3">3</option>
                         
                    </select>

                    </td>
                    </tr>


                    <tr>
                    <td>Phys Quality Score-Adulterants</td>
                           
                    <td style="font-size:20px;background-color:yellow" colspan="2">
                            
                                    

                    <select name="phys_3" id="physics-3" class="form-control">
                                                  
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>   
                    <option value="3">3</option>
                         
                    </select>

                    </td>
                    </tr>

                    <tr>
                    <td>Phys Quality Score-Odor</td>
                           
                    <td style="font-size:20px;background-color:yellow" colspan="2">
                            
                                    

                    <select name="phys_4" id="physics-4" class="form-control">
                                                  
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>   
                    <option value="3">3</option>
                         
                    </select>

                    </td>
                    </tr>

                                
                    <tr>
                    <td>Phys Quality Score-Sack Quality</td>
                           
                    <td style="font-size:20px;background-color:yellow" colspan="2">
                            
                                    

                    <select name="phys_5" id="physics-5" class="form-control">
                                                  
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>   
                    <option value="3">3</option>
                         
                    </select>

                    </td>
                    </tr>


                    <tr>
                    <td >Phys Quality Score-Texture, Temperature</td>
                           
                    <td style="font-size:20px;background-color:yellow" colspan="2">
                            
                                    

                    <select name="phys_6" id="physics-6" class="form-control">
                                                  
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>   
                    <option value="3">3</option>
                         
                    </select>

                    </td>
                    </tr>



                    <tr>
                    <td>Subt Phys Quality Score</td>
                           
                    <td colspan="2">
                            
                                    

                    <%: Html.TextBoxFor(model => model.phys_7_total, new { @class = "form-control requiredfilled", @placeholder="Required", @required ="true",@autocomplete="off",@id="totalcountpsy",@ReadOnly="true"}) %>
                    <%: Html.ValidationMessageFor(model => model.phys_7_total, "", new { @class = "text-danger" }) %>


                    </td>
                    </tr>

                                

                    <tr>
                    <td>Class</td>
                    <td style="font-size:20px;background-color:yellow" colspan="2">  
                 

                    <select  name="class_macro" class="form-control">
                                                  
                    <option value="A">A </option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="NA">NA</option>
                    </select>
                    </td>                                                       
                    </tr>

          
                    <tr>
                    <td>Point Origin</td>
                    <td style="font-size:20px" colspan="2">  
                 
                    <%: Html.TextBoxFor(model => model.point_origin, new { @class = "form-control", @placeholder="Point Origin",@required="true",@autocomplete="off",@style="background-color:yellow"}) %>        
                    <%: Html.ValidationMessageFor(model => model.point_origin, "", new { @class = "text-danger" }) %>

                    </td>
                                                              
               

                    </tr>



                    <tr>
                    <td>Infestation of weevils</td>
                    <td style="font-size:20px;background-color:yellow" colspan="2">  
                 

                    <select  name="infestation" class="form-control">
                                                  
                    <option value="No Weevils">No Weevils</option>
                    <option value="Dead Weevils">Dead Weevils</option>
                    <option value="Alive Weevils">Alive Weevils</option>
                    </select>
                    </td>                                                       
                    </tr>


                                
                    <tr>
                    <td>Drying Method</td>
                    <td style="font-size:20px;background-color:yellow" colspan="2">  
                 

                    <select  name="drying_method" class="form-control">                   
                    <option value="No Weevils">Mechanical</option>
                    <option value="Dead Weevils">Sun-Dry</option>
                    <option value="Alive Weevils">Alive Weevils</option>
                    </select>
                    </td>                                                       
                    </tr>



                    <tr>
                    <td>Other Test</td>
                    <td style="font-size:20px">  
                 
                    <%: Html.TextBoxFor(model => model.other_test, new { @class = "form-control", @placeholder="Other Test",@required="true",@autocomplete="off",@style="background-color:yellow"}) %>        
                    <%: Html.ValidationMessageFor(model => model.other_test, "", new { @class = "text-danger" }) %>

                    </td>
                           
                    <td>                                                           
                    <%: Html.TextBoxFor(model => model.other_test_remarks, new { @class = "form-control", @placeholder="Test Remarks",@required="true",@autocomplete="off",@style="background-color:yellow"}) %>        
                    <%: Html.ValidationMessageFor(model => model.other_test_remarks, "", new { @class = "text-danger" }) %>
                    </td>             
                    </tr>


                    <tr>
                    <td>Result</td>
                    <td style="font-size:20px">  
                 
                    <%: Html.TextBoxFor(model => model.result, new { @class = "form-control", @placeholder="Results",@required="true",@autocomplete="off",@style="background-color:yellow"}) %>        
                    <%: Html.ValidationMessageFor(model => model.result, "", new { @class = "text-danger" }) %>

                    </td>
                                                              
               
                    <td>
                                                                                 
                    <%: Html.TextBoxFor(model => model.result_remarks, new { @class = "form-control", @placeholder="Result Remarks",@required="true",@autocomplete="off",@style="background-color:yellow"}) %>        
                    <%: Html.ValidationMessageFor(model => model.result_remarks, "", new { @class = "text-danger" }) %>

                    </td>


                    </tr>


                    </table>


                    </div>





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
                    <td style="font-size:20px">           

                    <input type="text" name="reverse_good_qty" value="NULL" class="form-control"/>

       
                    </td>


                    <td>  Actual Delivered</td>
                    <td style="font-size:20px">
                    <input type="text" name="reverse_actual_delivered"  value="NULL" class="form-control"/>
                    </td>


                    </tr>



                    <tr>


                    <td>  Rejection Date</td>
                    <td style="font-size:20px">           
                    <input type="text" name="reverse_reject_date" value="NULL" class="form-control"/>

                    </td>


                    <td>  Restockin Date</td>
                    <td style="font-size:20px">
              

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
                        $("#num1, #ActualDelivered, #num3, #num4, #subt,#master1, #master2,#ten, #expected, #reject, #OrderVsGood, #reject1, #reject2, #gross_weight, #tare_weight,#net_weight, #ActualNeeded").on("keydown keyup", sum);
                    function sum() {
     
                    $("#subt").val(Number($("#num1").val()) - Number($("#ActualDelivered").val().replace(/,/g, '')) - Number($("#num3").val()));
                    $("#reject").val(Number($("#ActualDelivered").val().replace(/,/g, '')) - Number($("#num4").val()));
                    $("#waiting").val(Number($("#num1").val()) - Number($("#subt").val()));
                    $("#addition").val(Number($("#ActualDelivered").val().replace(/,/g, '')) + Number($("#num3").val()));
                    $("#tenPercentMinusActual").val(Number($("#tenPercentComputation").val()) - Number($("#ActualDelivered").val().replace(/,/g, '')));


                    // VALUE MULTIPLY BY 1.10 DUAL COPY
                    $("#tenPercentMinusActualCopy").val(Number($("#tenPercentComputation").val()) * 1);

                    //bebe

                    $("#missing").val(Number($("#ActualDelivered").val().replace(/,/g, '')) - Number($("#expected").val().replace(/,/g, '')));
                    $("#CPassword").val(Number($("#reject").val()) * 1);
 
                    // VALUE MULTIPLY BY 1.10
                        //$("#tenPercentComputation").val(1.10 * Number($("#expected").val().replace(/,/g, '')));

                        $("#tenPercentComputation").val(1.10 * Number($("#num1").val().replace(/,/g, '')));

                     $("#tenPercentComputationChange").val(1.10 * Number($("#ActualNeeded").val().replace(/,/g, '')));

                    $("#CompareActualDelivedtoReject").val(Number($("#ActualDelivered").val().replace(/,/g, '')) - Number($("#num4").val()));

                    $("#QtyGoodx1").val(Number($("#reject").val()) * 1);

        
                    $("#totalQtyGood").val(Number($("#actualGood").val()) + Number($("#QtyGoodx1").val()));

                    $("#QtyRejectx1").val(Number($("#num4").val()) * 1);

                    $("#totalQtyReject").val(Number($("#actualReject").val()) + Number($("#QtyRejectx1").val()));



                    $("#OrderVsGood").val(Number($("#num1").val()) - Number($("#actualGood").val()));
                    $("#GoodMinusOrderedTotal").val(Number(Math.round($("#num1").val())) - Number(Math.round($("#totalQtyGood").val())));
         

                    $("#FinalFormulaNegative").val(Number($("#OrderVsGood").val()) - Number($("#ActualDelivered").val().replace(/,/g, '')));

   
                    $("#masterpogi2").val(String($("#master2").val()));

                    $("#totalcountpsy").val(Number($("#physics-1").val()) - Number($("#physics-2").val()));
                    $("#net_weight").val(Number($("#gross_weight").val()) - Number($("#tare_weight").val()));

                    $("#ActualDelivered").val(Number($("#net_weight").val()) * 1);
                    //$("#expected").val(Number($("#num1").val()) * 1); allis muna 4/6/2021
                    }
                    });

                    $("#text1").hide();
                    $("#text2").hide();
                    $("#btn2").hide();



                    //Swal.fire(
                    //    'Good job!',
                    //    'You clicked the button!',
                    //    'success'
                    //)



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


                    //swal({
                    //    title: "Sweet!",
                    //    text: "Here's a custom image.",
                    //    imageUrl: 'thumbs-up.jpg'
                    //});
                    //return;

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


                    var sample = $('#tenPercentMinusActual').val();
       

                    if (parseFloat($("#tenPercentComputation").val()) == parseFloat($("#ActualDelivered").val())) {
                    //alert("Data is the same");
                    }
                    else

                    {

                    //buje<a href="../QAPoSummaryCheck/ReceivedRawMaterial.aspx">../QAPoSummaryCheck/ReceivedRawMaterial.aspx</a>
                    if (parseFloat($("#num1").val()) == parseFloat($("#ActualNeeded").val())) {


                    //Start

                    if (parseFloat($("#tenPercentComputation").val()) > parseFloat($("#ActualDelivered").val())) {
                    $(".error").css("display", "block").css("color", "red");
                    //$("#submit").prop('disabled', true);
                    //alert("Wala pa sa 10 Percent");
                    }
                    else {
                    if ((parseFloat($("#tenPercentComputation").val()) == 0)) {
                    //alert("Expected Delivery is Required! ");
                    //swal("Good job!", "You clicked the button!", "success");
                    }
                    else {
                    $(".error").css("display", "none");
                    //$("#submit").prop('disabled', false);
                    alert("Maximum 10 Percent Allowable Exceed!!");
                    ($('#tare_weight').val(""));
                    }

                    }



                    //END
                    }


                    else {


                        if (parseFloat($("#tenPercentComputationChange").val()) > parseFloat($("#ActualDelivered").val())) {
                            $(".error").css("display", "block").css("color", "red");
                            //$("#submit").prop('disabled', true);
                            //alert("Wala pa sa 10 Percent");
                        }
                        else {
                            if ((parseFloat($("#tenPercentComputationChange").val()) == 0)) {
                                //alert("Expected Delivery is Required! ");
                                //swal("Good job!", "You clicked the button!", "success");
                            }
                            else {

                                if (parseFloat($("#tenPercentComputationChange").val()) == parseFloat($("#ActualDelivered").val())) {
                                    //alert("Data is the same");
                                }
                                else {

                                    $(".error").css("display", "none");
                                    //$("#submit").prop('disabled', false);
                                    alert("Maximum 10 Percent Allowable Exceed !!");
                                    ($('#tare_weight').val(""));
                                }

                            }
                        }

                    }


























                        //if (parseFloat($("#tenPercentComputation").val()) > parseFloat($("#ActualDelivered").val()))
                        //{
                        //    $(".error").css("display", "block").css("color", "red");
                        //    //$("#submit").prop('disabled', true);
                        //    //alert("Wala pa sa 10 Percent");
                        //}
                        //else
                        //{
                        //    if ((parseFloat($("#tenPercentComputation").val()) == 0))
                        //    {

                        //    }
                        //    else {
                        //        $(".error").css("display", "none");
                        //        //$("#submit").prop('disabled', false);
                        //        alert("Maximum 10 Percent Allowable Exceed!!");
                        //        ($('#tare_weight').val(""));
                        //    }
                        //}


                    }


                }
            }
            else {
                
       
              
                ($('#QaApprovalRemarks').val(""));

            }

            //$("#masterpogi1").val(datediff(parseDate(master1.value), parseDate(master2.value)).val());
        }


        //my jquery



        //my jquery
        $(document).on("change", ".rejectsum", function () {
            var sum = 0;
            $(".rejectsum").each(function () {
                sum += +$(this).val();
            });
            $("#num4").val(sum);
        });

        //
        $(document).on("change", "#uom_data", function () {

            if ($('#uom_data').val() == "others")
            {
                //alert("a");
                $("#uom-actual-data").val("");
                $("#uom-actual-data").show();
                $("#uom-actual-data").focus();
            }
            else
            {
                //alert("b");
                $("#uom-actual-data").val($('#uom_data').val());
                $("#uom-actual-data").hide();

            }
        });


        $(document).on("change", "#vehicle-type-id", function () {

            if ($('#vehicle-type-id').val() == "others") {
                //alert("a");
                $("#vehicle-type-data").val("");
                $("#vehicle-type-data").show();
                $("#vehicle-type-data").focus();
            }
            else {
                //alert("b");
                $("#vehicle-type-data").val($('#vehicle-type-id').val());
                $("#vehicle-type-data").hide();

            }
        });




        // for the actual Delivered UOM Jquery

        $(document).on("change", "#uom_data-delivered", function () {

            if ($('#uom_data-delivered').val() == "others") {
                //alert("a");
                $("#uom-actual-data-delivered").val("");
                $("#uom-actual-data-delivered").show();
                $("#uom-actual-data-delivered").focus();
            }
            else {
                //alert("b");
                $("#uom-actual-data-delivered").val($('#uom_data-delivered').val());
                $("#uom-actual-data-delivered").hide();

            }
        });


        $(document).on("change", "#delivery-acceptance", function () {

            if ($('#delivery-acceptance').val() == "others") {
                //alert("a");
                $("#delivery-acceptance-data").val("");
                $("#delivery-acceptance-data").show();
                $("#delivery-acceptance-data").focus();
            }
            else {
                //alert("b");
                $("#delivery-acceptance-data").val($('#delivery-acceptance').val());
                $("#delivery-acceptance-data").hide();

            }
        });


        //
        $(document).on("change", "#resack-others", function () {

            if ($('#resack-others').val() == "others") {
                //alert("a");
                $("#resack-others-data").val("");
                $("#resack-others-data").show();
                $("#resack-others-data").focus();
            }
            else {
                //alert("b");
                $("#resack-others-data").val($('#resack-others').val());
                $("#resack-others-data").hide();

            }
        });


        $(document).on("change", "#uom-reject", function () {

            if ($('#uom-reject').val() == "others") {
                //alert("a");
                $("#uom-reject-data").val("");
                $("#uom-reject-data").show();
                $("#uom-reject-data").focus();
            }
            else {
                //alert("b");
                $("#uom-reject-data").val($("#uom-reject").val());
                $("#uom-reject-data").hide();

            }
        });





        $(document).on("change", "#physics-1,#physics-2,#physics-3,#physics-4,#physics-5,#physics-6", function () {


            $("#totalcountpsy").val(Number($("#physics-1").val()) + Number($("#physics-2").val()) + Number($("#physics-3").val()) + Number($("#physics-4").val()) + Number($("#physics-5").val()) + Number($("#physics-6").val()));

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


   //<!--THIS METHOD WILL CALCULATED THE TOTAL OF EXPIRY DAYS BETWEEN DATE NOW AND EXPIRY DATE-->
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



        //EXPECTED DELIVERY COMPUTATION 

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

  


        //ACTUAL DELIVERED COMPUTATIONS USING JQUERY
                        //$("#ActualDelivered").mouseout(function () {

        $("#tare_weight").mouseout(function () {
            if ($(this).val()) {

                if ($('#ActualNeeded').val() < $('#ActualDelivered').val()) {

                    //alert("Yung Available Nalang na Pwede Mong I Received ay" + $('#ActualNeeded').val());
                    //$('#ActualDelivered').val(""); downb muna 4/6/2021
                }
                else
                {
                    //alert("B");
                }


                if ($('#missing').val() < 0) {
                    //$("#master1").hide();
                    //confirm($('#missing').val() +"Negative Value is not alloweds"); comment muna pulido na this at 3/26/2020
                    //return false;
                    //break;
                }









                var ActualDelivery = $('#ActualDelivered').val().replace(/,/g, '');
                var tenPercentequalone = $('#tenPercentComputation').val();
                if (ActualDelivery < 10)
                  {
                    //alert("Fresh Morning");
                  }
                else {
                    //alert("Fresh Nays"); 1/11/2021 tenPercentMinusActualCopytenPercentMinusActualCopy
                var sample = $('#tenPercentMinusActual').val();
            
                    if (parseFloat($("#tenPercentComputation").val()) == parseFloat($("#ActualDelivered").val())) {
                        //alert("Data is the same");
                    }
                    else {

                        if (parseFloat($("#num1").val()) == parseFloat($("#ActualNeeded").val())) {


                            //Start

                            if (parseFloat($("#tenPercentComputation").val()) > parseFloat($("#ActualDelivered").val())) {
                                $(".error").css("display", "block").css("color", "red");
                                //$("#submit").prop('disabled', true);
                                //alert("Wala pa sa 10 Percent");
                            }
                            else {
                                if ((parseFloat($("#tenPercentComputation").val()) == 0)) {
                                    //alert("Expected Delivery is Required! ");
                                    //swal("Good job!", "You clicked the button!", "success");
                                }
                                else {
                                    $(".error").css("display", "none");
                                    //$("#submit").prop('disabled', false);
                                    alert("Maximum 10 Percent Allowable Exceed!!");
                                    ($('#tare_weight').val(""));
                                }

                            }



                            //END
                        }


                        else {


                            if (parseFloat($("#tenPercentComputationChange").val()) > parseFloat($("#ActualDelivered").val()))
                            {
                                $(".error").css("display", "block").css("color", "red");
                                //$("#submit").prop('disabled', true);
                                //alert("Wala pa sa 10 Percent");
                            }
                            else {
                                if ((parseFloat($("#tenPercentComputationChange").val()) == 0))
                                {
                                    //alert("Expected Delivery is Required! ");
                                    //swal("Good job!", "You clicked the button!", "success");
                                }
                                else
                                {


                                    if (parseFloat($("#tenPercentComputationChange").val()) == parseFloat($("#ActualDelivered").val())) {
                                        //alert("Data is the same");
                                    }
                                    else {



                                        $(".error").css("display", "none");
                                        //$("#submit").prop('disabled', false);
                                        alert("Maximum 10 Percent Allowable Exceed !!");
                                        ($('#tare_weight').val(""));
                                    }
                                }

                                }

                        }
                    }


                 }
            }
        });






        //binder
        $("#uom-actual-data").val($('#uom_data').val());
        $("#vehicle-type-data").val($('#vehicle-type-id').val());
        $("#uom-actual-data-delivered").val($('#uom_data-delivered').val());
        $("#delivery-acceptance-data").val($('#delivery-acceptance').val());
        $("#uom-reject-data").val($("#uom-reject").val());
        $("#resack-others-data").val($('#resack-others').val());

        //Clear the Textbox once the window is Load
        ($('#QaApprovalRemarks').val(""));
        ($('#ActualDelivered').val(""));
        $("#uom-actual-data").hide();
        $("#uom-actual-data-delivered").hide();
        $("#vehicle-type-data").hide();
        $("#delivery-acceptance-data").hide();
        $("#resack-others-data").hide();
        $("#uom-reject-data").hide();
        $("#totalcountpsy").val("0");
        //rejection code validated the actual deliver
        $("#num4").focusout(function () {
            if ($('#reject').val() < 0)
            {
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


        //hOW MANY DAYS OF RAW MATERIALS WILL BE EXPIRED
  
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


        //format: "mm/yyyy/dd", script for my Date NOw
        
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

        //This is my jQUERY DOM MANUPULATION
        function myFunctionshowtext1() {
            $("#text1").show();
            $("#btn1").hide();
            $("#btn2").show();

            ($('#QaApprovalRemarks').val(""));
        }


        //jQUERY SAVING METHOD HAS BEEN CALLED
        function myFunctionshowtext2() {
            $("#text2").show();
            $("#btn2").hide();
            ($('#QaApprovalRemarks').val(""));
        }
    </script>

    
    <script src="../../Scripts/easy-number-separator.js"></script>

<%--   iNTERNAL CSS METHODS--%>
        <style>
                .Senior.Automation{
                    display:none;
                    }


                .Junior.Developer
                {
                    display:none;
                }

                .add-row{
                    border-radius:20px;
                }
        </style>

</asp:Content>
