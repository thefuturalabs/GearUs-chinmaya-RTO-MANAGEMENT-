<?php
include 'connection.php';



$r_id=$_POST["r_id"];
$feedback=$_POST["feedback"];
$Date=$_POST["Date"];
$data=mysqli_query($con,"INSERT INTO `feedback_tbl`(`Feedback`, `Date`, `r_id`) VALUES ('$feedback','$Date','$r_id')");
 
 if($data)
 {

  $list=array();

  $myarray['message']='sucess';
   
  
}
 else
 {
  
 
  $myarray['message']='failed';
   
   
}

  echo json_encode($myarray);
