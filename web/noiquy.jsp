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
                        <span>Vietnamese</span> | <a href="#">Login</a>
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
                        <li class="nav-item"><a class="nav-link" href="index.jsp">Trang chủ</a></li>
                        <li class="nav-item"><a class="nav-link" href="gioithieu.jsp">Giới thiệu</a></li>
                        <li class="nav-item"><a class="nav-link" href="noiquy.jsp">Nội quy</a></li>
<!--                        <li class="nav-item"><a class="nav-link" href="#">Dịch vụ</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Bộ sưu tập</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Tin tức</a></li>-->
                    </ul>
                </div>
            </div>
        </nav>


       <!-- Library Rules Section -->
<div class="container my-5">
    <h3 class="text-center mb-4">Nội quy Thư viện FPT University - Cần Thơ</h3>
    <div class="rules">
        <h5>Điều 1: Thẻ thư viện (Library card)</h5>
        <p>Thẻ sinh viên / nhân viên đồng thời là thẻ thư viện để sử dụng các dịch vụ của thư viện.</p>

        <h5>Điều 2: Giờ mở cửa</h5>
        <p>Thứ Hai – Thứ Sáu: 8h15 – 21h00</p>
        <p>Cuối tuần: 8h00 – 12h00, 13h00 – 17h00 (Buổi tối và cuối tuần thư viện chỉ phục vụ chỗ tự học)</p>

        <h5>Điều 3: Các dịch vụ của Thư viện</h5>
        <p>3.1. Mượn, trả, gia hạn tài liệu;</p>
        <p>3.2. Hướng dẫn tìm tin và sử dụng thư viện;</p>
        <p>3.3. Tìm kiếm và tư vấn thông tin;</p>
        <p>3.4. Truy cập nguồn tài nguyên điện tử;</p>
        <p>3.5. Tiếp nhận đề nghị đặt mua tài liệu;</p>
        <p>3.6. Mượn liên thư viện;</p>
        <p>3.7. Phòng học nhóm.</p>

        <h5>Điều 4: Các quy định chung khi vào thư viện</h5>
        <p>4.1. Xuất trình thẻ thư viện khi giao dịch với Thư viện. Không dùng thẻ của người khác và không cho người khác mượn thẻ của mình;</p>
        <p>4.2. Giữ gìn trật tự, đi nhẹ, nói khẽ;</p>
        <p>4.3. Giữ gìn vệ sinh chung: không hút thuốc lá, không viết, vẽ lên mặt bàn, không ngồi gác chân lên ghế, bỏ rác đúng nơi quy định;</p>
        <p>4.4. Không được mang vào thư viện đồ ăn, uống, chất độc hại, chất cháy nổ,...;</p>
        <p>4.5. Tắt chuông điện thoại, không nói chuyện điện thoại trong thư viện;</p>
        <p>4.6. Không viết bút chì, bút mực hoặc sử dụng bút đánh dấu lên sách;</p>
        <p>4.7. Không gập hoặc làm nhàu nát, rách sách;</p>
        <p>4.8. Không để sách bị ẩm ướt, mốc hoặc hư hỏng dưới bất kỳ hình thức nào.</p>

        <h5>Điều 5: Quy định khi mượn/trả tài liệu</h5>
        <p>5.1. Sau khi đọc sách xong, bạn đọc đặt sách về khu vực đã được quy định, không tự ý xếp sách lên giá;</p>
        <p>5.2. Không mang bất cứ tài liệu nào ra khỏi thư viện khi chưa làm thủ tục mượn về;</p>
        <p>5.3. Đối với giáo trình, tài liệu học tập: Mỗi sinh viên được mượn 1 bộ giáo trình, tài liệu dùng cho kỳ học hiện tại theo danh sách lớp của phòng Đào tạo. Những tài liệu giáo trình này, bạn đọc được gia hạn tối đa 1 tuần khi có lý do hợp lý;</p>
        <p>5.4. Đối với sách giáo trình được mượn như tài liệu tham khảo, hạn trả áp dụng như đối với sách tham khảo thông thường;</p>
        <p>5.5. Đối với tài liệu tham khảo: Bạn đọc được mượn tối đa 10 tên sách, trong thời hạn 1 tuần/ tài liệu tiếng Việt, 2 tuần/ tài liệu ngoại văn và được gia hạn 4 lần;</p>
        <p>5.6. Người mượn có trách nhiệm:</p>
        <ul>
            <li>5.6.1 Kiểm tra và xác nhận quá trình giao dịch với thủ thư ngay tại quầy;</li>
            <li>5.6.2 Kiểm tra tình trạng thực tế của tài liệu đã được ghi mượn trước khi mang ra khỏi thư viện, đồng thời giữ gìn, bảo quản tài liệu trong thời gian mượn. Khi phát hiện hư hỏng, người mượn cuối cùng của tài liệu đó sẽ chịu trách nhiệm bồi thường theo quy định.</li>
        </ul>

        <h5>Điều 6: Xử lý vi phạm nội quy thư viện</h5>
        <p>6.1. Bạn đọc vi phạm các quy định tại Điều 4, 5 tùy theo mức độ và lần vi phạm có thể bị nhắc nhở, khiển trách và mời ra khỏi thư viện; lập biên bản cảnh cáo, tạm ngừng sử dụng các dịch vụ thư viện hoặc sẽ bị tước quyền sử dụng các dịch vụ thư viện vĩnh viễn, tạm thời đình chỉ học tập hoặc buộc thôi học;</p>
        <p>6.2. Trường hợp làm hư hại (như long bìa, nhàu nát, bôi bẩn, viết, vẽ, mất trang...) hoặc mất tài liệu, bạn đọc phải bồi thường thiệt hại tương đương với giá trị của tài liệu;</p>
        <p>6.3. Trường hợp mượn tài liệu quá hạn sẽ phải chịu tiền phạt là: 5.000 đồng/ngày/1 cuốn kể cả ngày nghỉ;</p>
        <p>6.4. Trong bất cứ trường hợp vi phạm nào, bạn đọc phải đền bù thiệt hại theo quy định.</p>
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