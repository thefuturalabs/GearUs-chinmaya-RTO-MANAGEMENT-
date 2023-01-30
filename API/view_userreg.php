
<?php
include 'connection.php';

$r_id=$_POST["r_id"];

$data=mysqli_query($con,"SELECT * FROM `registration_tb` INNER join login_tb on registration_tb.email=login_tb.user_name WHERE r_id='$r_id'");
$row=mysqli_fetch_assoc($data);
if(mysqli_num_rows($data)>0)
 {

  $list=array();
  $myarray['name']=$row['name'];
  $myarray['email']=$row['email'];
  $myarray['address']=$row['address'];
  $myarray['dob']=$row['dob'];
  $myarray['licence_status']=$row['licence_status'];
  $myarray['password']=$row['password'];
  $myarray['qualification']=$row['qualification'];
  $myarray['phone']=$row['phone'];
  $myarray['message']="sucess";
}
 else
 {
  // $response['message']="failed";
 $myarray['message']='failed';
   
   
}

  echo json_encode($myarray);
?>