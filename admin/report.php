<?php
require('top.inc.php');



?><div class="content pb-0">
   <div class="orders">
      <div class="row">
         <div class="col-xl-12">
            <div class="card">
               <div class="card-body">
                  <h4 class="box-title">Report </h4>
                  <!-- <h4 class="box-link"><a href="manage_banner.php"></a> </h4> -->
               </div>
               <div class="card-body--">
                  <div class="table-stats order-table ov-h">
                     <table class="table ">
                        <thead>
                           <tr>
                              <th class="serial">#</th>
                              <th></th>
                              <th></th>
                              <th></th>
                              <th> </th>
                              <th></th>
                              <th></th>
                           </tr>
                        </thead>
                        <tbody>
                           <tr>
                              <td class="serial"><?php echo 1 ?></td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td><a href="pdf_order.php">Order Report</a></td>
                              <td>
                                 <!-- <span class='badge badge-complete'><a href='order_report.php'>view</a></span> -->
                              </td>
                           </tr>
                           <tr>
                              <td class="serial"><?php echo 2 ?></td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td><a href="pdf_category.php">Product Report</a></td>
                              <td>
                                 <!-- <span class='badge badge-complete'><a href='order_report.php'>view</a></span> -->
                              </td>
                           </tr>
                           <tr>
                              <td class="serial"><?php echo 2 ?></td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td><a href="pdf_user.php">User Report</a></td>
                              <td>
                                 <!-- <span class='badge badge-complete'><a href='order_report.php'>view</a></span> -->
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<?php
require('footer.inc.php');
?>