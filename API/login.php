
<?php
include 'connection.php';



$user_name=$_POST["user_name"];

$password=$_POST["password"];

 $data=mysqli_query($con,"SELECT * FROM `login_tb` inner join registration_tb on registration_tb.email=login_tb.user_name WHERE user_name='$user_name' and password='$password'");
 $row=mysqli_fetch_assoc(($data));
 if(mysqli_num_rows($data)>0)
 {

  $list=array();
  $myarray['r_id']=$row['r_id'];
   $myarray['name']=$row['name'];
   $myarray['email']=$row['email'];
   $myarray['licence_status']=$row['licence_status'];
  // $myarray['type']=$row['type'];
  $myarray['message']='sucess';
   
  
}
 else
 {
  
 
  $myarray['message']='failed';
   
   
}

  echo json_encode($myarray);
