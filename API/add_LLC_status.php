<?php
include 'connection.php';



$r_id=$_POST["r_id"];
$mark=$_POST["mark"];
$data=mysqli_query($con,"UPDATE `learners_llc_tb` SET status='TEM approve',mark='$mark' WHERE r_id='$r_id'");
 
 if($data)
 {

  $list=array();

  $myarray['message']='update';
   
  
}
 else
 {
  
 
  $myarray['message']='failed';
   
   
}

  echo json_encode($myarray);
