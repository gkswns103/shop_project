	//변수 선언 및 초기화
	var nImageInfoCnt = 0;
	var htImageInfo = [];		//image file정보 저장
	var aResult = [];
	
	var rFilter = /^(image\/bmp|image\/gif|image\/jpg|image\/jpeg|image\/png)$/i;  
	var rFilter2 = /^(bmp|gif|jpg|jpeg|png)$/i; 
	var nTotalSize = 0;
	var nMaxImageSize = 10*1024*1024;
	var nMaxTotalImageSize = 50*1024*1024;
	var nMaxImageCount = 10;
	var nImageFileCount = 0;
	var bSupportDragAndDropAPI = false;
	var oFileUploader;
	var bAttachEvent = false;

	//마크업에 따른 할당
	var elContent= $("pop_content");  
	var elDropArea = jindo.$$.getSingle(".drag_area",elContent);
	var elDropAreaUL = jindo.$$.getSingle(".lst_type",elContent);
	var elCountTxtTxt = jindo.$$.getSingle("#imageCountTxt",elContent);
	var elTotalSizeTxt = jindo.$$.getSingle("#totalSizeTxt",elContent);
	var elTextGuide = $("guide_text");
	var welUploadInputBox = $Element("uploadInputBox");
	var oNavigator = jindo.$Agent().navigator();
	
	//마크업-공통 
	var welBtnConfirm = $Element("btn_confirm");				//확인 버튼
	var welBtnCancel= $Element("btn_cancel");				//취소 버튼
	
	//진도로 랩핑된 element
	var welTextGuide = $Element(elTextGuide);
	var welDropArea = $Element(elDropArea);
	var welDropAreaUL = $Element(elDropAreaUL); 
	var fnUploadImage = null;
	
	//File API 지원 여부로 결정
	function checkDragAndDropAPI(){
		try{
			if( !oNavigator.ie ){
				if(!!oNavigator.safari && oNavigator.version <= 5){
					bSupportDragAndDropAPI = false;
				}else{
					bSupportDragAndDropAPI = true;
				}
			} else {
				bSupportDragAndDropAPI = false;
			}
		}catch(e){
			bSupportDragAndDropAPI = false;
		}
	}
	
	//--------------- html5 미지원 브라우저에서 (IE9 이하) ---------------
	/** 
	 * 이미지를 첨부 후 활성화된 버튼 상태
	 */
     function goStartMode(){
    	 var sSrc = welBtnConfirm.attr("src")|| "";
    	 if(sSrc.indexOf("btn_confirm2.png") < 0 ){
    		 welBtnConfirm.attr("src","./img/btn_confirm2.png");
    		 fnUploadImage.attach(welBtnConfirm.$value(), "click");
    	 }
     } 
     /**
      * 이미지를 첨부 전 비활성화된 버튼 상태
      * @return
      */
     function goReadyMode(){
    	 var sSrc = welBtnConfirm.attr("src")|| "";
    	 if(sSrc.indexOf("btn_confirm2.png") >= 0 ){
    		 fnUploadImage.detach(welBtnConfirm.$value(), "click");
	    	 welBtnConfirm.attr("src","./img/btn_confirm.png");
    	 }
     }   
	
	/**
	 * 일반 업로드 
	 * @desc oFileUploader의 upload함수를 호출함. 
	 */
	function generalUpload(){
		oFileUploader.upload();
	}
	
    /** 
     * 이미지 첨부 전 안내 텍스트가 나오는 배경으로 '설정'하는 함수.
     * @return
     */
 	function readyModeBG (){
 		var sClass = welTextGuide.className();
 		if(sClass.indexOf('nobg') >= 0){
 			welTextGuide.removeClass('nobg');
 			welTextGuide.className('bg');
 		}
 	}
 	
 	/**
 	 * 이미지 첨부 전 안내 텍스트가 나오는 배경을 '제거'하는 함수. 
 	 * @return
 	 */
 	function startModeBG (){
 		var sClass = welTextGuide.className();
 		if(sClass.indexOf('nobg') < 0){
	 		welTextGuide.removeClass('bg');
	 		welTextGuide.className('nobg');
 		}
 	}

	//--------------------- html5  지원되는 브라우저에서 사용하는 함수  --------------------------
 	/**
 	 * 팝업에 노출될 업로드 예정 사진의 수.
 	 * @param {Object} nCount 현재 업로드 예정인 사진 장수
 	 * @param {Object} nVariable 삭제되는 수
 	 */
 	function updateViewCount (nCount, nVariable){
 		var nCnt = nCount + nVariable;
 		elCountTxtTxt.innerHTML = nCnt +"장";
 		nImageFileCount = nCnt;
 		return nCnt;
 	}
 	
 	/**
 	 * 팝업에 노출될 업로드될 사진 총 용량
 	 */
 	function updateViewTotalSize(){
 		var nViewTotalSize = Number(parseInt((nTotalSize || 0), 10) / (1024*1024));
 		elTotalSizeTxt.innerHTML = nViewTotalSize.toFixed(2) +"MB";
 	}
 	
 	/**
 	 * 이미지 전체 용량 재계산.
 	 * @param {Object} sParentId
 	 */
 	function refreshTotalImageSize(sParentId){
 		var nDelImgSize = htImageInfo[sParentId].size;
 		if(nTotalSize - nDelImgSize > -1 ){
 			nTotalSize = nTotalSize - nDelImgSize;
 		} 
 	}
	
 	/**
 	 * hash table에서 이미지 정보 초기화.
 	 * @param {Object} sParentId
 	 */
 	function removeImageInfo (sParentId){
 		//삭제된 이미지의 공간을 초기화 한다.
 		htImageInfo[sParentId] = null;
 	}
 	
 	
 	/**
 	 * byte로 받은 이미지 용량을 화면에 표시를 위해 포맷팅
 	 * @param {Object} nByte
 	 */
 	function setUnitString (nByte) {
 		var nImageSize;
 		var sUnit;
 		
 		if(nByte < 0 ){
 			nByte = 0;
 		}
 		
 		if( nByte < 1024) {
 			nImageSize = Number(nByte);
 			sUnit = 'B';
 			return nImageSize + sUnit;
 		} else if( nByte > (1024*1024)) {
 			nImageSize = Number(parseInt((nByte || 0), 10) / (1024*1024));
 			sUnit = 'MB';
 			return nImageSize.toFixed(2) + sUnit;
 		} else {
 			nImageSize = Number(parseInt((nByte || 0), 10) / 1024);
 			sUnit = 'KB';
 			return nImageSize.toFixed(0) + sUnit;
 		}
     }
 	
 	/**
 	 * 화면 목록에 적당하게 이름을 잘라서 표시.
 	 * @param {Object} sName 파일명
 	 * @param {Object} nMaxLng 최대 길이
 	 */
 	function cuttingNameByLength (sName, nMaxLng) {
 		var sTemp, nIndex;
 		if(sName.length > nMaxLng){
 			nIndex = sName.indexOf(".");
 			sTemp = sName.substring(0,nMaxLng) + "..." + sName.substring(nIndex,sName.length) ;
 		} else {
 			sTemp = sName;
 		}
 		return sTemp;
 	}
 	
 	/**
 	 * Total Image Size를 체크해서 추가로 이미지를 넣을지 말지를 결정함.
 	 * @param {Object} nByte
 	 */
 	function checkTotalImageSize(nByte){
 		if( nTotalSize + nByte < nMaxTotalImageSize){
 			nTotalSize = nTotalSize + nByte;
 			return false;
 		} else {
 			return true;
 		}
 	}
	
 	// 이벤트 핸들러 할당
 	function dragEnter(ev) {
 		ev.stopPropagation();
 		ev.preventDefault();
     }
 	
     function dragExit(ev) {
     	ev.stopPropagation();
     	ev.preventDefault();
     }
     
 	function dragOver(ev) {
 		ev.stopPropagation();
 		ev.preventDefault();
     }
 	
	/**
	 * 드랍 영역에 사진을 떨구는 순간 발생하는 이벤트
	 * @param {Object} ev
	 */
    function drop(ev) {
		ev.stopPropagation();
		ev.preventDefault();
		
		if (nImageFileCount >= 10){
			alert("최대 10장까지만 등록할 수 있습니다.");
			return;
		}
		
		if(typeof ev.dataTransfer.files == 'undefined'){
			alert("HTML5를 지원하지 않는 브라우저입니다.");
		}else{
			//변수 선언
			var wel,
				files,
				nCount,
				sListTag = '';
			
			//초기화	
			files = ev.dataTransfer.files;
			nCount = files.length;
						
			if (!!files && nCount === 0){
				//파일이 아닌, 웹페이지에서 이미지를 드래서 놓는 경우.
				alert("정상적인 첨부방식이 아닙니다.");
				return ;
			}
			
			for (var i = 0, j = nImageFileCount ; i < nCount ; i++){
				if (!rFilter.test(files[i].type)) {
					alert("이미지파일 (jpg,gif,png,bmp)만 업로드 가능합니다.");
				} else if(files[i].size > nMaxImageSize){
					alert("이미지 용량이 10MB를 초과하여 등록할 수 없습니다.");
				} else {
					//제한된 수만 업로드 가능.
					if ( j < nMaxImageCount ){
						sListTag += addImage(files[i]);
						
						//다음 사진을위한 셋팅
						j = j+1;
						nImageInfoCnt = nImageInfoCnt+1;
					} else {
						alert("최대 10장까지만 등록할 수 있습니다.");
						break;			
					}
				}
			}
			if(j > 0){
				//배경 이미지 변경
				startModeBG();
				if ( sListTag.length > 1){
					welDropAreaUL.prependHTML(sListTag);
				}
				//이미지 총사이즈 view update 
				updateViewTotalSize();
				//이미치 총 수 view update
				nImageFileCount = j;
				updateViewCount(nImageFileCount, 0);
				// 저장 버튼 활성화
				goStartMode();
			}else{
				readyModeBG();
			}
		}
    }
	
    /**
     * 이미지를 추가하기 위해서 file을 저장하고, 목록에 보여주기 위해서 string을 만드는 함수.
     * @param ofile 한개의 이미지 파일
     * @return
     */
    function addImage(ofile){
    	//파일 사이즈
		var ofile = ofile,
			sFileSize = 0,
			sFileName = "",
			sLiTag = "",
			bExceedLimitTotalSize = false,
			aFileList = [];
		
		sFileSize = setUnitString(ofile.size);
		sFileName = cuttingNameByLength(ofile.name, 15);
		bExceedLimitTotalSize = checkTotalImageSize(ofile.size);

		if( !!bExceedLimitTotalSize ){
			alert("전체 이미지 용량이 50MB를 초과하여 등록할 수 없습니다. \n\n (파일명 : "+sFileName+", 사이즈 : "+sFileSize+")");
		} else {
			//이미지 정보 저장							
			htImageInfo['img'+nImageInfoCnt] = ofile;
			
    		//List 마크업 생성하기
			aFileList.push('	<li id="img'+nImageInfoCnt+'" class="imgLi"><span>'+ sFileName +'</span>');
			aFileList.push('	<em>'+ sFileSize +'</em>');
	        aFileList.push('	<a onclick="delImage(\'img'+nImageInfoCnt+'\')"><img class="del_button" src="./img/btn_del.png"  width="14" height="13" alt="첨부 사진 삭제"></a>');
			aFileList.push('	</li> ');   
			
			sLiTag = aFileList.join(" ");
			aFileList = [];
		}
		return sLiTag;
    }
    
    /**
     * HTML5 DragAndDrop으로 사진을 추가하고, 확인버튼을 누른 경우에 동작한다.
     * @return
     */
   function html5Upload() {	
    var tempFile, sUploadURL;
   sUploadURL = "/shop/uploading"; // ✅ 이 경로가 서버와 일치하는지 확인

    for (var j = 0; j < nImageInfoCnt; j++) {
        tempFile = htImageInfo["img" + j];
        if (!!tempFile) {
            console.log("📤 [DEBUG] 업로드 시작: " + tempFile.name);
            callAjaxForHTML5(tempFile, sUploadURL);
        }
    }
}

    
function callAjaxForHTML5(tempFile, sUploadURL) {
    var formData = new FormData();
    formData.append("file", tempFile);  // ✅ 파일 추가

    console.log("[DEBUG] 업로드 데이터 확인:", formData.get("file"));

    var xhr = new XMLHttpRequest();
    xhr.open("POST", sUploadURL, true);

    // 🚨 `Content-Type`을 설정하면 안 됨! (자동 설정됨)
    // xhr.setRequestHeader("Content-Type", "multipart/form-data");  

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                console.log("[✅ DEBUG] 서버 응답:", xhr.responseText);
            } else {
                console.log("[❌ ERROR] AJAX 요청 실패! 상태 코드:", xhr.status);
            }
        }
    };

    xhr.send(formData);
}


    
    function makeArrayFromString(sResString){
    	var	aTemp = [],
    		aSubTemp = [],
    		htTemp = {}
    		aResultleng = 0;
    	
 		try{
 			if(!sResString || sResString.indexOf("sFileURL") < 0){
 	    		return ;
 	    	}
 			aTemp = sResString.split("&");
	    	for (var i = 0; i < aTemp.length ; i++){
	    		if( !!aTemp[i] && aTemp[i] != "" && aTemp[i].indexOf("=") > 0){
	    			aSubTemp = aTemp[i].split("=");
	    			htTemp[aSubTemp[0]] = aSubTemp[1];
	    		}
	 		}
 		}catch(e){}
 		
 		aResultleng = aResult.length;
    	aResult[aResultleng] = htTemp;
    	
    	if(aResult.length == nImageFileCount){
    		setPhotoToEditor(aResult); 
    		aResult = null;
    		window.close();
    	}
    }
    
    /**
 	 * 사진 삭제 시에 호출되는 함수
 	 * @param {Object} sParentId 
 	 */
 	function delImage (sParentId){
 		var elLi = jindo.$$.getSingle("#"+sParentId);
 		
 		refreshTotalImageSize(sParentId);
 		
 		updateViewTotalSize();
 		updateViewCount(nImageFileCount,-1);
 		//사진 file array에서 정보 삭제.
 		removeImageInfo(sParentId);
 		//해당 li삭제
 		$Element(elLi).leave();
 		
 		//마지막 이미지인경우.
 		if(nImageFileCount === 0){
 			readyModeBG();
 			//사진 추가 버튼 비활성화
 			goReadyMode();
 		}
 		
 		// drop 영역 이벤트 다시 활성화.
 		if(!bAttachEvent){
 			addEvent();
 		}
 	}

 	/**
     * 이벤트 할당
     */
	function addEvent() {
		bAttachEvent = true;
		elDropArea.addEventListener("dragenter", dragEnter, false);
		elDropArea.addEventListener("dragexit", dragExit, false);
		elDropArea.addEventListener("dragover", dragOver, false);
		elDropArea.addEventListener("drop", drop, false);
	}
	
	function removeEvent(){
		bAttachEvent = false;
		elDropArea.removeEventListener("dragenter", dragEnter, false);
	    elDropArea.removeEventListener("dragexit", dragExit, false);
	    elDropArea.removeEventListener("dragover", dragOver, false);
	    elDropArea.removeEventListener("drop", drop, false);	
	}
 	
	/**
	 * Ajax 통신 시 error가 발생할 때 처리하는 함수입니다.
	 * @return
	 */
	function onAjaxError (){
		alert("[가이드]사진 업로더할 서버URL셋팅이 필요합니다.-onAjaxError");
	}

 	/**
      * 이미지 업로드 시작
      * 확인 버튼 클릭하면 호출되는 msg
      */
     function uploadImage (e){
    	 if(!bSupportDragAndDropAPI){
    		 generalUpload();
    	 }else{
    		 html5Upload();
    	 }
     }
     
 	/**
 	 * jindo에 파일 업로드 사용.(iframe에 Form을 Submit하여 리프레시없이 파일을 업로드하는 컴포넌트)
 	 */
/**
 * jindo 파일 업로드 사용. (iframe에 Form을 Submit하여 리프레시 없이 파일 업로드)
 */
function callFileUploader() {
    oFileUploader = new jindo.FileUploader(jindo.$("uploadInputBox"), {
        sUrl : 'uploading',  // ✅ 변경: 컨텍스트 경로 포함
        sCallback : location.href.replace(/[\/\[\]!*,$]/g, '') + '/callback.html',
        sFiletype : "*.jpg;*.png;*.bmp;*.gif",
        sMsgNotAllowedExt : "JPG, GIF, PNG, BMP 형식만 가능합니다.",
        bAutoUpload : false,   
        bAutoReset : true      
    }).attach({
        select : function(oCustomEvent) {
            if (oCustomEvent.bAllowed === true) {
                goStartMode();
            } else {
                goReadyMode();
                oFileUploader.reset();
            }
        },
        success : function(oCustomEvent) {
            console.log("✅ [SUCCESS] 파일 업로드 성공");
        },
        error : function(oCustomEvent) {
            console.log("❌ [ERROR] 파일 업로드 실패", oCustomEvent);
        }
    });
}


	
    /**
     * 페이지 닫기 버튼 클릭
     */
    function closeWindow(){
	   	if(bSupportDragAndDropAPI){
	   		removeEvent();
	   	}
	   	window.close();
    }
    
	window.onload = function(){
  		checkDragAndDropAPI();
  		
  		if(bSupportDragAndDropAPI){
  			$Element("pop_container2").hide();
  			$Element("pop_container").show();
  			
  			welTextGuide.removeClass("nobg");
  			welTextGuide.className("bg");
  			
  			addEvent();
  		} else {
  			$Element("pop_container").hide();
  			$Element("pop_container2").show();
  			callFileUploader();
  		}
  		fnUploadImage = $Fn(uploadImage,this);
  		$Fn(closeWindow,this).attach(welBtnCancel.$value(), "click");
	};

	/**
	 *  서버로부터 받은 데이타를 에디터에 전달하고 창을 닫음.
	 * @parameter aFileInfo [{},{},...] 
	 * @ex aFileInfo = [
	 * 	{
			sFileName : "nmms_215646753.gif",
			sFileURL :"http://static.naver.net/www/u/2010/0611/nmms_215646753.gif",
			bNewLine : true
		},
		{
			sFileName : "btn_sch_over.gif",
			sFileURL :"http://static1.naver.net/w9/btn_sch_over.gif",
			bNewLine : true
		}
	 * ]
	 */
 	function setPhotoToEditor(oFileInfo){
    if (!!opener && !!opener.nhn && !!opener.nhn.husky && !!opener.nhn.husky.PopUpManager) {
        var imgTag = "<img src='/resources/img/" + oFileInfo[0].sFileName + "' />";
        opener.nhn.husky.PopUpManager.setCallback(window, 'PASTE_HTML', [imgTag]);
    }
}

 	
 	// 2012.05 현재] jindo.$Ajax.prototype.request에서 file과 form을 지원하지 안함. 
 	jindo.$Ajax.prototype.request = function(oData) {
 		this._status++;
 		var t   = this;
 		var req = this._request;
 		var opt = this._options;
 		var data, v,a = [], data = "";
 		var _timer = null;
 		var url = this._url;
 		this._is_abort = false;

 		if( opt.postBody && opt.type.toUpperCase()=="XHR" && opt.method.toUpperCase()!="GET"){
 			if(typeof oData == 'string'){
 				data = oData;
 			}else{
 				data = jindo.$Json(oData).toString();	
 			}	
 		}else if (typeof oData == "undefined" || !oData) {
 			data = null;
 		} else {
 			data = oData;
 		}
 		
 		req.open(opt.method.toUpperCase(), url, opt.async);
 		if (opt.sendheader) {
 			if(!this._headers["Content-Type"]){
 				req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
 			}
 			req.setRequestHeader("charset", "utf-8");
 			for (var x in this._headers) {
 				if(this._headers.hasOwnProperty(x)){
 					if (typeof this._headers[x] == "function") 
 						continue;
 					req.setRequestHeader(x, String(this._headers[x]));
 				}
 			}
 		}
 		var navi = navigator.userAgent;
 		if(req.addEventListener&&!(navi.indexOf("Opera") > -1)&&!(navi.indexOf("MSIE") > -1)){
 			/*
 			 * opera 10.60에서 XMLHttpRequest에 addEventListener기 추가되었지만 정상적으로 동작하지 않아 opera는 무조건 dom1방식으로 지원함.
 			 * IE9에서도 opera와 같은 문제가 있음.
 			 */
 			if(this._loadFunc){ req.removeEventListener("load", this._loadFunc, false); }
 			this._loadFunc = function(rq){ 
 				clearTimeout(_timer);
 				_timer = undefined; 
 				t._onload(rq); 
 			}
 			req.addEventListener("load", this._loadFunc, false);
 		}else{
 			if (typeof req.onload != "undefined") {
 				req.onload = function(rq){
 					if(req.readyState == 4 && !t._is_abort){
 						clearTimeout(_timer); 
 						_timer = undefined;
 						t._onload(rq);
 					}
 				};
 			} else {
 	            /*
 				 * IE6에서는 onreadystatechange가 동기적으로 실행되어 timeout이벤트가 발생안됨.
 				 * 그래서 interval로 체크하여 timeout이벤트가 정상적으로 발생되도록 수정. 비동기 방식일때만
 		
 	             */
 				if(window.navigator.userAgent.match(/(?:MSIE) ([0-9.]+)/)[1]==6&&opt.async){
 					var onreadystatechange = function(rq){
 						if(req.readyState == 4 && !t._is_abort){
 							if(_timer){
 								clearTimeout(_timer);
 								_timer = undefined;
 							}
 							t._onload(rq);
 							clearInterval(t._interval);
 							t._interval = undefined;
 						}
 					};
 					this._interval = setInterval(onreadystatechange,300);

 				}else{
 					req.onreadystatechange = function(rq){
 						if(req.readyState == 4){
 							clearTimeout(_timer); 
 							_timer = undefined;
 							t._onload(rq);
 						}
 					};
 				}
 			}
 		}

 		req.send(data);
 		return this;
 	};
