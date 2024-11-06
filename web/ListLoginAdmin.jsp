<%-- 
    Document   : dashboard
    Created on : Nov 4, 2024, 9:52:45 PM
    Author     : Dinh Van Do - CE182224
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FPTU Library</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            /* Custom styles for the library interface */
            .header {
                background-color: #fff;
                border-bottom: 2px solid #ddd;
                padding: 20px 0;
            }
            .logo img {
                height: 80px;
                width: 160px;
                margin-right: 10px;
            }
            .title {
                font-size: 35px;
                color: #e74c3c;
                font-weight: bold;
            }
            .nav-item:hover {
                background-color: #f0f0f0; /* Màu xám nhạt */
            }
            .subtitle {
                font-size: 16px;
                color: #e67e22;
            }
            .hours {
                font-weight: bold;
                font-size: 14px;
                color: #333;
            }

            .login-section a {
                color: #3498db;
                text-decoration: none;
            }
            .nav-link{
                font-weight: bold;

            }
            .search-bar {
                background-color: rgba(255, 153, 0, 0.8);
                padding: 20px;
                margin-top: -50px;
                text-align: center;
            }
            .footer {
                background-color: #ff6600;
                color: white;
                padding: 20px;
                text-align: center;
            }
            .footer .stats {
                text-align: left;
                color: white;
            }
            .logo-img{
                border-radius: 50%;
            }
            .content-section {
                background-image: url('img/tv2.jpeg'); /* Đường dẫn đến ảnh nền */
                background-repeat: no-repeat; /* Không lặp ảnh */
                background-position: center; /* Căn giữa ảnh */
                padding: 40px; /* Khoảng cách padding cho nội dung */
                border-radius: 8px; /* Tùy chọn: Bo tròn các góc */
                background-size: cover;
            }
            .tieude{
                color:#333;
                font-size: 40px;
            }


        </style>
    </head>
    <body>

        <!-- Header -->
        <header>
            <div class="container-fluid header">
                <div class="row align-items-center">
                    <!-- Logo and Title Section -->
                    <div class="col-md-4 d-flex align-items-center justify-content-center logo">
                        <a  href="index.jsp">
                            <img  src="img/logo1.png" alt="FPT Logo">
                        </a>

                    </div>

                    <!-- Welcome Message and Opening Hours -->
                    <div class="col-md-4 text-center">
                        <div class="title">Welcome to FPTU Library</div>
                        <div class="hours">Open: 08:15 - 21:00 Weekday | 08:00 - 12:00 & 13:00 - 17:00 Weekend</div>
                    </div>

                    <!-- Language and Login Section -->
                    <div class="col-md-4 text-center  login-section">
                        <span>Vietnamese</span> |${sessionScope.username} <a href="index.jsp">logOut</a>
                    </div>
                </div>
            </div>
        </header>

        <!-- Navigation Menu -->
        <nav class="navbar navbar-expand-lg navbar-light bg-warning">
            <div class="container">

                <button class="navbar-toggler " type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                    <ul class="navbar-nav ">
                        <li class="nav-item"><a class="nav-link" href="information.jsp">Information Book</a></li>
                        <li class="nav-item"><a class="nav-link" href="gioithieu.jsp">ManageBook</a></li>
                        <li class="nav-item"><a class="nav-link" href="noiquy.jsp">Debt repayment list</a></li>
                    </ul>
                </div>
            </div>
        </nav>


        <!-- Main Content -->
        <div class="container my-5 content-section">
            <h3 class="text-center mb-4 tieude">How to use FPTU Library</h3>
            <div class="row text-center ">

                <div class="col-md-6 ">
                    <button class="btn btn-warning btn-lg">Books24x7</button>
                </div>
                <div class="col-md-6 ">
                    <button class="btn btn-warning btn-lg">OPAC</button>
                </div>
            </div>

            <h3 class="text-center my-5 tieude">News & Events</h3>
            <div class="row">
                <div class="col-md-6">
                    <div class="card text-center">
                        <img src="img/submit.jpg" class="card-img-top mx-auto d-block" alt="Announcement" style="width:75%; height:auto;">
                        <div class="card-body">
                            <h5 class="card-title">Important Announcement</h5>
                            <p class="card-text">Lịch nhận sách giáo trình tiếng Anh chuẩn bị Part 2 kỳ Fall 2024...</p>
                            <a href="#" class="btn btn-primary">Read More</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card">
                        <img src="img/java.jpg" style="width:40%; height:auto;" class="card-img-top mx-auto d-block" alt="Exchange Book Day">
                        <div class="card-body text-center">
                            <h5 class="card-title ">Top 10 cuốn sách mượn nhiều nhất</h5>
                            <p class="card-text ">Top 10 cuốn sách được sinh viên mượn nhiều nhất </p>
                            <a href="#" class="btn btn-primary ">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 text-left">
                        <h6>FPT UNIVERSITY LIBRARY</h6>
                        <p>Phòng 107 tòa nhà Delta, Trường Đại học FPT, Khu CNC Hòa Lạc, Km29 Đại Lộ Thăng Long, Thạch Thất, Hà Nội</p>
                        <p>Email: thuvien_fu_hoalac@fpt.edu.vn | Phone: 02466 805 912</p>
                    </div>
                    <div class="col-md-4 ">

                        <a target="_blank" href="https://www.facebook.com/thuviendaihocfpt">
                            <img src="img/fb.jpg" alt="FPT Logo" class="logo-img" width="50" height="50 class="logo-img"">
                        </a>

                    </div>
                    <div class="col-md-4 stats">
                        <h6>WEBSITE ACCESS STATISTICS</h6>
                        <p>Online: 213</p>
                        <p>Today: 9559 | Yesterday: 16215</p>
                        <p>This month: 38161 | Last month: 402460</p>
                        <p>Total visits: 6043173</p>
                    </div>

                </div>
            </div>
        </div>

        <!-- Bootstrap and jQuery scripts -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
