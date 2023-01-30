<?php
include 'connection.php';
$data=mysqli_query($con,"SELECT * FROM `learners_llc_tb` where status='Issue'");
if(isset($_POST['submit']))
{
echo "<script>alert('sucess')</script>";
}
?>


<!DOCTYPE html>
<html lang="en">

<head>
  <style>
   td{
    color: blue;
   }
  </style>
    <meta charset="utf-8">
    <title>GearUS</title>
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
    <form action="" method="POST">
                     <div class="bg-primary text-center p-5">
                        <h1 class="mb-4">Send notification</h1>
                        <form>
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-floating">
                                    <table class="table table-bordered" class="table-warning">
                      <thead>
                        <tr>
                <th>Id</th>
                          <th>
                            name
                          </th>
                          <th>
                            DOB
                          </th>
                          <th>
                            Email
                          </th>
                          <th>
                            Phone No
                          </th>
                          <th>
                            Qualification
                          </th>
                          <th>
                            Mark
                          </th>
                          <th>r_id</th>
                       <th></th>
                        </tr>
                      </thead>
                      <tbody>
                      <?php
        while($row=mysqli_fetch_assoc($data))
        {
        ?>
     <tr>
     <td><?php echo $row['l_id'];?></td>
    <td><?php echo $row['first_name'];?> <?php echo $row['last_name'];?></td>
    <td><?php echo $row['DOB'];?></td>
    <td><?php echo $row['email'];?></td>
    <!-- <td><?php echo $row['phone'];?></td> -->
    <td><?php echo $row['iden_mark'];?></td>
    <td><?php echo $row['address'];?></td>
    <td><?php echo $row['mark'];?></td>
    <td><?php echo $row['r_id'];?></td>
  
 <td>
   <!-- Button trigger modal -->
   <?php
   $rid= $row['r_id'];
   ?>
   <a style="color:blue" href="Issue_notification1.php?id=<?php echo $rid;?>">send notification</a>

</td>
<!-- Modal -->
<form action="home.php" method="POST">
<div class="modal fade" id="editmodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
     
<!-- 
    <a href="Approvevan_reg.php?id=<?php echo $row['Van_id']?>" class="btn btn-danger">Approve</a>
    <a href="Rejectvan_reg.php?id=<?php echo $row['Van_id']?>" class="btn btn-danger">Reject</a> -->

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>
   </tr>

       <?php
        }
        ?>
                                </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>  
           
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