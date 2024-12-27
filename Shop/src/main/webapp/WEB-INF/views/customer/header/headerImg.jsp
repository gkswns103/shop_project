<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Swiper Slider Example</title>
    <link rel="stylesheet" href="/shop/resources/css/headerimg.css">
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <style>
        html,
        body {
            position: relative;
            height: 100%;
        }

        body {

            font-family: Arial, sans-serif;
            margin-top: 100px;
            padding: 0;
        }

        .swiper {
            width: 100%;
            height: 300px; /* 캐러셀 높이 고정 */
        }

        .swiper-slide {
            display: flex;
            justify-content: center;
            align-items: center;
            background: #fff;
            border-radius: 30px; /* 모서리 둥글게 */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .swiper-slide img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 30px;
        }
    </style>
</head>
<body>
    <!-- Swiper -->
    <div class="swiper mySwiper">
        <div class="swiper-wrapper">
            <!-- 동적 이미지 로드 -->
            <div class="swiper-slide">
                <img src="/shop/resources/img/연말빅세일.png" alt="연말 빅 세일">
            </div>
            <div class="swiper-slide">
                <img src="/shop/resources/img/빅세일.png" alt="빅 세일">
            </div>
            <div class="swiper-slide">
                <img src="/shop/resources/img/크리스마스특가.png" alt="크리스마스 특가">
            </div>
            <div class="swiper-slide">
                <img src="/shop/resources/img/발굴단.png" alt="발굴단">
            </div>
            <div class="swiper-slide">
                <img src="/shop/resources/img/타임세일.png" alt="타임 세일">
            </div>
        </div>
        <!-- Pagination -->
        <div class="swiper-pagination"></div>
        <!-- Navigation -->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    </div>

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper(".mySwiper", {
            slidesPerView: 3, // 한 번에 보여줄 슬라이드 수
            spaceBetween: 10, // 슬라이드 간 간격
            loop: true, // 슬라이드 루프 활성화
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
        });
    </script>
</body>
</html>
