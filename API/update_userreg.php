<?php
include 'connection.php';

$r_id=$_POST["r_id"];
$name=$_POST["name"];
$email=$_POST["email"];
$emailold=$_POST["emailold"];
$phone=$_POST["phone"];
$address=$_POST["address"];
$dob=$_POST["dob"];
$qualification=$_POST["qualification"];
$licence_status=$_POST["licence_status"];
$password=$_POST["password"];
$data=mysqli_query($con,"UPDATE `registration_tb` SET `name`='$name',`email`='$email',`phone`='$phone',`status`='approve',`address`='$address',`dob`='$dob',`qualification`='$qualification',`licence_status`='$licence_status' WHERE r_id='$r_id'");
mysqli_query($con,"UPDATE `login_tb` SET `user_name`='$email',`password`='$password' WHERE user_name='$emailold'");
if($data)
 {
  
  $response['message']="sucess";
}
 else
 {
  // $response['message']="failed";
 $myarray['message']='failed';
   
   
}

  echo json_encode($response);
?>