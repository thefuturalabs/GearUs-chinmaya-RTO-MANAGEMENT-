
<?php
include 'connection.php';



$name=$_POST["name"];

// var_dump($name);
// exit();
$email=$_POST["email"];
$phone=$_POST["phone"];

$address=$_POST["address"];
$dob=$_POST["dob"];
$qualification=$_POST["qualification"];
$licence_status=$_POST["licence_status"];
$password=$_POST["password"];

$data=mysqli_query($con,"INSERT INTO `registration_db`(`name`, `email`, `phone`, `status`, `address`, `dob`, `qualification`,`licence_status`) VALUES ('$name','$email','$phone','register','$address','$dob','$qualification','$licence_status')");

//  $data=mysqli_query($con,"INSERT INTO `registration_db`(`name`, `email`, `phone`, `status`, `address`, `dob`, `qualification`) VALUES ('anu','anu@gmail.com','52132154','zxkz','jzskjxkm','2012/2/2','xas')");
mysqli_query($con,"INSERT INTO `login_tb`(`user_name`, `password`, `type`) VALUES ('$email','$password','user')");
//  $row=mysqli_fetch_assoc(($data));
 if($data)
 {
//   $data1=mysqli_query($con,"SELECT Cid,Cname,CEmail,type from custreg_tbl INNER join login_tbl on custreg_tbl.Cid=login_tbl.Login_id WHERE CEmail='dhoni@gmail.com'");
//   $row1=mysqli_fetch_assoc($data1);
  // $list=array();
  // $myarray['Cid']=$row['Cid'];
  // $myarray['Cname']=$row['Cname'];
  // $myarray['CEmail']=$row['CEmail'];
  // $myarray['type']=$row['type'];
  // $myarray['message']='sucess';
   
  $response['message']="sucess";
}
 else
 {
  $response['message']="sucess";
 
  // $myarray['message']='failed';
   
   
}

  echo json_encode($response);
