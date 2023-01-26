
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

$proof=$_FILES['image']['name'];
if($proof != "")
{
    $filearray=pathinfo($_FILES['image']['name']);
    $file1=rand();
   $file_ext=$filearray["extension"];

    $filenew=$file1 .".".$file_ext;


    move_uploaded_file($_FILES['image']['tmp_name'],"../image1/".$filenew);

}


$qualificattion=$_POST["qualificattion"];
$state=$_POST["state"];

$mark=$_POST["mark"];

$photo=$_FILES['image']['name'];

if($photo != "")
{
    $filearray1=pathinfo($_FILES['image']['name']);
    $file2=rand();
   $file_ext1=$filearray["extension"];

    $filenew2=$file2 .".".$file_ext1;


    move_uploaded_file($_FILES['image']['tmp_name'],"../image1/".$filenew2);

}
$data=mysqli_query($con,"INSERT INTO `learners_llc_tb`(`first_name`, `last_name`, `LLC_type`, `state`, `city`, `address`, `DOB`, `Birth_place`, `qualification`, `iden_mark`, `Blood_group`, `proof`, `status`,`email`,`photo`,`r_id`,`mark`) VALUES ('$first_name','$last_name','$LLc_type','$state','$city','$address','$DOB','$Birth_place','$qualificattion','$iden_mark','$Blood_group','$filenew','register','$email','$filenew2','$r_id','$mark')");



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
  $response['message']="failed";
 
  // $myarray['message']='failed';
   
   
}

  echo json_encode($response);
