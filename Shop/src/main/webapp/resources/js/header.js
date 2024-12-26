        // 데이터 정의
        const menuData = [
            {
                title: "의류",
                division: "의류",
                categories: ["남성", "여성", "유아", "잠옷", "속옷", "신발"],
            },
            {
                title: "식품",
                division: "식품",
                categories: ["육류", "채소", "해산물", "조미료"],
            },
            {
                title: "전자 ⦁ 가전",
                division: "전자",
                categories: ["TV", "냉장고", "세탁기", "건조기", "청소기", "PC", "휴대폰"],
            },
            {
                title: "인테리어",
                division: "인테리어",
                categories: ["디퓨저", "침구류", "커튼", "조명", "생활용품", "욕실용품", "가구", "원예", "셀프인테리어"],
            },
            {
                title: "유아",
                division: "유아",
                categories: ["생필품", "완구", "가구", "식품"],
            },
            {
                title: "취미",
                division: "취미",
                categories: ["스포츠", "헬스", "용품", "자전거", "낚시"],
            },
            {
                title: "반려동물",
                division: "반려동물",
                categories: ["반려식품", "반려용품", "반려의류"],
            },
            {
                title: "생활용품",
                division: "생활용품",
                categories: ["생활", "주방", "청소", "빨래"],
            },
            {
                title: "뷰티",
                division: "뷰티",
                categories: ["화장품", "스킨케어", "향수"],
            },
        ];

        // 메뉴 생성 함수
        const navbar = document.getElementById("navbar");

        menuData.forEach(menu => {
            // 최상위 메뉴 항목
            const menuItem = document.createElement("li");
            menuItem.className = "nav-item dropdown";

            const menuLink = document.createElement("a");
            menuLink.className = "nav-link dropdown-toggle";
            menuLink.id = "navbarDropdown";
            menuLink.href = '/shop/product?division=' + menu.division + '&category=';
            menuLink.textContent = menu.title;

            menuItem.appendChild(menuLink);

            // 서브메뉴 항목
            const dropdownMenu = document.createElement("ul");
            dropdownMenu.className = "dropdown-menu";
            dropdownMenu.setAttribute("aria-labelledby", "navbarDropdown");

            menu.categories.forEach(category => {
                const dropdownItem = document.createElement("li");
                const dropdownLink = document.createElement("a");
                dropdownLink.className = "dropdown-item";
                dropdownLink.href = '/shop/product?division=' + menu.division + '&category=' + category;
                dropdownLink.textContent = category;

                dropdownItem.appendChild(dropdownLink);
                dropdownMenu.appendChild(dropdownItem);
            });

            menuItem.appendChild(dropdownMenu);
            navbar.appendChild(menuItem);
        });