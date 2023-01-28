
<?php
include 'connection.php';



$address=$_POST["address"];
$r_id=$_POST["r_id"];
$email=$_POST["email"];
// var_dump($name);
// exit();
$Birth_place=$_POST["Birth_place"];
$phone=$_POST["phone"]; 
$Blood_group=$_POST["Blood_group"];
$city=$_POST["city"];
$DOB=$_POST["DOB"];
$first_name=$_POST["first_name"];
$iden_mark=$_POST["iden_mark"];
$last_name=$_POST["last_name"];
$LLc_type=$_POST["LLc_type"];

$proof=$_FILES['image']['name'][0];
if($proof != "")
{
    $filearray=pathinfo($_FILES['image']['name']);
    $file=rand();
   $file_ext=$filearray["extension"];

    $filenew=$file.".".$file_ext;


    move_uploaded_file($_FILES['image']['tmp_name'],"../image1/".$filenew);

}


$qualificattion=$_POST["qualificattion"];
$state=$_POST["state"];

$mark=$_POST["mark"];


$data=mysqli_query($con,"INSERT INTO `learners_llc_tb`(`first_name`, `last_name`, `LLC_type`, `state`, `city`, `address`, `DOB`, `Birth_place`, `qualification`, `iden_mark`, `Blood_group`, `proof`, `status`,`email`,`photo`,`r_id`,`mark`,`issue_date`) VALUES ('$first_name','$last_name','$LLc_type','$state','$city','$address','$DOB','$Birth_place','$qualificattion','$iden_mark','$Blood_group','','register','$email','$filenew','$r_id','$mark','')");

 if($data)
 {

  $response['message']="success";
}
 else
 {
  $response['message']="failed";
 
  // $myarray['message']='failed';
   
   
}

  echo json_encode($response);
