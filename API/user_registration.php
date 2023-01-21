
<?php
include 'connection.php';
$name=$_POST["name"];
$email=$_POST["email"];
$phone=$_POST["phone"];
$address=$_POST["address"];
$dob=$_POST["dob"];
$qualification=$_POST["qualification"];
$licence_status=$_POST["licence_status"];
$password=$_POST["password"];
$data=mysqli_query($con,"INSERT INTO `registration_tb`(`name`, `email`, `phone`, `status`, `address`, `dob`, `qualification`,`licence_status`) VALUES ('$name','$email','$phone','register','$address','$dob','$qualification','$licence_status')");
mysqli_query($con,"INSERT INTO `login_tb`(`user_name`, `password`, `type`) VALUES ('$email','$password','user')");
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