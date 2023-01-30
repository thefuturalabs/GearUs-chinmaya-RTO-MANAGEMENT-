<?php
include 'connection.php';

$r_id=$_POST["r_id"];
$amount=$_POST["amount"];
$date=$_POST["date"];

$proof=$_FILES['image']['name'];
if($proof != "")
{
    $filearray=pathinfo($_FILES['image']['name']);
    $file=rand();
   $file_ext=$filearray["extension"];

    $filenew=$file.".".$file_ext;


    move_uploaded_file($_FILES['image']['tmp_name'],"../image1/".$filenew);

}
$data=mysqli_query($con,"INSERT INTO `renew_licence_tbl`(`date`, `amount`, `image`) VALUES ('$date','$amount','$image')");
 if($data)
 {



  $myarray['message']='sucess';
   
  
}
 else
 {
  
 
  $myarray['message']='failed';
   
   
}

  echo json_encode($myarray);
