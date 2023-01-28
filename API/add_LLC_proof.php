<?php
include 'connection.php';



$r_id=$_POST["r_id"];




$photo=$_FILES['image']['name'];

if($photo != "")
{
    $filearray=pathinfo($_FILES['image']['name']);
    $file=rand();
   $file_ext=$filearray["extension"];

    $filenew=$file .".".$file_ext;


    move_uploaded_file($_FILES['image']['tmp_name'],"../image1/".$filenew);

}
$data=mysqli_query($con,"UPDATE `learners_llc_tb` SET `proof`='$filenew' WHERE `r_id`='$r_id'");
if($data)
 {

  

  $myarray['message']='update';
   
  
}
 else
 {
  
 
  $myarray['message']='failed';
   
   
}

  echo json_encode($myarray);

?>