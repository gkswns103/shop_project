function increase() {

    let amount = document.getElementById("amount");
    let nowAmount= parseInt(amount.value);
    let maxAmount = parseInt(document.getElementById("inventory").value, 10);
    
    if(nowAmount >= maxAmount ){
    	alert("최대수량입니다.");
    	return;
    }
    amount.value = nowAmount + 1; // 값 증가
}

function decrease() {
	  let amount = document.getElementById("amount");
      let nowAmount= parseInt(amount.value);
      
      if(nowAmount === 1){
    	alert("최소수량입니다.");
    	return;
    }
    amount.value = nowAmount - 1;
    
} 