<?php
include 'connection.php';
$l_id=$_GET['l_id'];

$data=mysqli_query($con,"SELECT * FROM `learners_llc_tb` where l_id='$l_id'");
$row=mysqli_fetch_assoc($data);
if(isset($_POST['submit']))
{
    $lid=$_POST['lid1'];
    var_dump($lid);
    exit();
    
    $data=mysqli_query($con,"UPDATE `learners_llc_tb` SET status='Issue' WHERE l_id='$lid'");
//  echo "<script>alert('LLC Issue')</script>";

}
?>


<!DOCTYPE html>
<html lang="en">

<head>
   <style>
    table,tr,td,th
    { width: 75%;
        border: 2px solid black;
        color: black;
    }
    td
    {
       
    }
    table,th{
        padding: 20%;
       
        text-align: center;
    }
   </style>
    <meta charset="utf-8">
    <title>Drivin - Driving School Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    
    <?php
   include 'sidebar.php';
   ?>
    <!-- Navbar End -->


    <div class="container-fluid page-header py-6 my-6 mt-0 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center">
          
<div class="col-12 my-6 mb-0 wow fadeInUp" data-wow-delay="0.1s"> 
    <form action="issue_LLC2.php?id=<?php echo $row['l_id'];?>" method="POST">
                     <div class="bg-primary text-center p-5">
                       
                    <table class="table table-bordered"><h1 class="mb-4">Learners Licence Request</h1>
                    <tr>
                  
                     
                        
                    </tr>
                        <tr>
                            <!-- <td>FirstName</td><td><php echo $row['first_name'];?></php></td> -->
                          <td>Licence Id:</td> <td><label for="lid" name="lid" ><?php echo $row['l_id'];?></label></td> <td rowspan="6">photo<img src="./image1/<?php echo $row['photo'];?>" height="200" width="200" alt=""></td></tr>
                       <tr> <td>  <label for="">Name:</td> <td><?php echo $row['first_name'];?><?php echo $row['last_name'];?></label></td> </tr></tr> 
    <tr><td> <label for="">DOB</td><td> <?php echo $row['DOB'];?></label></tr>
    <tr><td><label for="">Email</td><td><?php echo $row['email'];?></label></td></tr>
    <!-- <label for="">Phone:<?php echo $row['phone'];?></label><br><br> -->
    <tr> <td><label for="">Birth place</td><td><?php echo $row['Birth_place'];?></label></td></tr>
    <tr> <td><label for="">Blood group</td><td><?php echo $row['Blood_group'];?></label></td></tr> 
    <tr><td> <label for="">city</td><td> <?php echo $row['city'];?></label></td> <td rowspan="10"><label for="">proof:<img src="./image1/<?php echo $row['proof'];?>" height="200" width="200" alt=""> </td> </tr>
    <tr> <td> <label for="">address</td><td><?php echo $row['address'];?></label></td> </tr>
    <tr> <td> <label for="">iden_mark</td><td><?php echo $row['iden_mark'];?></label></td> </tr>
    <tr> <td>  <label for="">LLC_type</td><td><?php echo $row['LLC_type'];?></label></td> </tr>
    <tr> <td>  <label for="">mark</td><td><?php echo $row['mark'];?></label></td></tr>
   
    <tr>  <td>  <label for="">qualification</td><td><?php echo $row['qualification'];?></label></td></tr>
    <tr>   <td>  <label for="">qualification</td><td><?php echo $row['qualification'];?></label></td> </tr>
    <tr> <td>  <label for="">qualification</td><td><?php echo $row['qualification'];?></label></td> </tr>
    <tr> <td>  <label for="">state</td><td><?php echo $row['state'];?></label></td> </tr>
            <!-- <tr><td></td><td> <input name="submit" type="submit" value="submit" />  </tr>       -->
            <tr><td colspan="2"><button name="submit"  class="btn btn-info btn-lg">Issue</button> </td></tr>     
                    </table>
         
                    </form>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center mb-0">
                    <!-- <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                    <li class="breadcrumb-item text-primary active" aria-current="page">Contact</li> -->
                </ol>
            </nav>
        </div>
    </div>
   



    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>

</body>

</html>