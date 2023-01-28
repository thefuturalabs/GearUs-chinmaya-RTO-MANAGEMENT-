<?php
include 'connection.php';



$r_id=$_POST["r_id"];

$data=mysqli_query($con,"SELECT * FROM `notification_tbl` WHERE r_id='$r_id'");
 $row=mysqli_fetch_assoc($data);
 if(mysqli_num_rows($data)>0)
 {

  $list=array();

  $myarray['attend_date']=$row['attend_date'];
  $myarray['notification']=$row['notification'];
  $myarray['message']='sucess';
  array_push($list,$myarray);
}
 else
 {
  
 
  $myarray['message']='failed';
  array_push($list,$myarray);
   
   
}

  echo json_encode($list);
