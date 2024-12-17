           function amountChange(product_idx) {
          
           let amountInput = document.getElementById("amount-" + product_idx).value;
           let inventory = document.getElementById("inventory-"+product_idx).value;
           let user_idx = "${sessionScope.users.user_idx}";
          
           if(amountInput > inventory){
              alert("남은 수량은"+inventory+"개 입니다");
              amountInput=inventory;
              location.href="amount_update?product_idx=" + product_idx + "&user_idx=" + user_idx + "&quantity=" + amountInput;
              return;
           }
           
           if(amountInput < 1){
              alert("최소수량입니다");
              amountInput=1;     
           }
           if(amountInput >50){
              alert("구매한도는 50개 입니다");
              amountInput=50;
           }
       
         
           location.href="amount_update?product_idx=" + product_idx + "&user_idx=" + user_idx + "&quantity=" + amountInput;
       }

       function decrease(product_idx) {
           let amountInput = document.getElementById("amount-" + product_idx).value;
           let inventory = document.getElementById("inventory-"+product_idx).value;
           let user_idx = "${sessionScope.users.user_idx}";
           
           if(amountInput == 1){
              alert("최소수량입니다");
              return;
           }
           amountInput = parseInt(amountInput) - 1;
          
           location.href="amount_update?product_idx=" + product_idx + "&user_idx=" + user_idx + "&quantity=" + amountInput;
       }

       function increase(product_idx) {
          let amountInput = document.getElementById("amount-" + product_idx).value;
           let inventory = document.getElementById("inventory-"+product_idx).value;
           let user_idx = "${sessionScope.users.user_idx}";
           
           if(amountInput == inventory){
              alert("남은 수량은"+inventory+"개 입니다");
              return;
           }
           if(amountInput.value >50){
              alert("구매한도는 50개 입니다");
              return;
           }
           amountInput= parseInt(amountInput) + 1;
           
           location.href="amount_update?product_idx=" + product_idx + "&user_idx=" + user_idx + "&quantity=" + amountInput;
       }
       function updateTotal() {
           let totalPrice = 0;
           let totalDiscount = 0;
           
           document.querySelectorAll('.item').forEach(item => {
               const checkbox = item.querySelector('input[type="checkbox"]');
               if (checkbox.checked) {
                   const price = parseFloat(item.querySelector('#price').textContent.replace(/[^0-9.-]+/g,""));
                   const realPrice = parseFloat(item.querySelector('h4').textContent.replace(/[^0-9.-]+/g,""));
                   
                   totalPrice += price;
                   totalDiscount += (price - realPrice);
               }
           });
           
           document.getElementById('totalprice').textContent = totalPrice.toLocaleString() + '원';
           document.getElementById('totaldiscount').textContent = totalDiscount.toLocaleString() + '원';
           document.getElementById('finalsum').textContent = (totalPrice - totalDiscount).toLocaleString() + '원';
       }

       function check(product_idx) {
           updateTotal();
       }
         
       
 