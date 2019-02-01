/*REFRACTORED CODE
 * 
 * Initially we have 3 separate javascript files which did a very similar functionality
 * so we refectored them into one js file which is then just called by the corresponding
 * jsp's and then they can use which ever function(s) they need
 * 
 */






var rowSelected = null;

function alerting(x){
        document.getElementById("modalExamID").innerHTML ="Exam ID: " + x.cells[0].innerHTML;
	document.getElementById("modalExamTitle").innerHTML ="Exam Title: " + x.cells[1].innerHTML;
	document.getElementById("modalModuleCode").innerHTML ="Module Code: " + x.cells[2].innerHTML;
	document.getElementById("modalModuleCoordinator").innerHTML ="Module Coordinator: " + x.cells[3].innerHTML;
   
   
	document.getElementById("pdf").data = "data:application/pdf;base64," + x.cells[6].innerHTML;
        document.getElementById("frame").src = "data:application/pdf;base64," + x.cells[6].innerHTML;
        
        document.getElementById('ExamIDHidden').value = x.cells[0].innerHTML;
        document.getElementById('modalExamIDHidden').value = x.cells[0].innerHTML;
	document.getElementById('modalExamTitleHidden').value = x.cells[1].innerHTML;
	document.getElementById('modalModuleCodeHidden').value = x.cells[2].innerHTML;
	document.getElementById('modalModuleCoordinatorHidden').value = x.cells[3].innerHTML;
}

function alertedthis(x){
    document.getElementById("modalCommentID").innerHTML ="Comment ID: " + x.cells[0].innerHTML;
    document.getElementById("modalExamID").innerHTML ="Exam ID: " + x.cells[1].innerHTML;
    document.getElementById("modalComment").innerHTML ="Comment: " + x.cells[2].innerHTML;
    document.getElementById("modalUserID").innerHTML ="User ID: " + x.cells[3].innerHTML;
    document.getElementById("modalModuleCode").innerHTML ="Module Code: " + x.cells[4].innerHTML;
    document.getElementById("modalTitle").innerHTML ="Exam Title: " + x.cells[5].innerHTML;
    
    document.getElementById("CommentIDHidden").value = x.cells[0].innerHTML;
    document.getElementById("CommentHidden").value = x.cells[2].innerHTML;
    document.getElementById("ModuleCodeHidden").value = x.cells[4].innerHTML;
    
    document.getElementById("modalCommentIDHidden").value = x.cells[0].innerHTML;
    document.getElementById("modalExamIDHidden").value = x.cells[1].innerHTML;
    document.getElementById("modalCommentHidden").value = x.cells[2].innerHTML;
    document.getElementById("modalUserIDHidden").value = x.cells[3].innerHTML;
    document.getElementById("modalModuleCodeHidden").value = x.cells[4].innerHTML;
    document.getElementById("modalTitleHidden").value = x.cells[5].innerHTML;
}

function modal(x){
    document.getElementById("modalExamID").innerHTML ="Exam ID: " + x.cells[0].innerHTML;
    document.getElementById("modalModuleCode").innerHTML ="Module Code: " + x.cells[1].innerHTML;
    document.getElementById("modalExamPeriod").innerHTML ="Exam Period: " + x.cells[2].innerHTML;
    document.getElementById("modalExamType").innerHTML ="Exam Type: " + x.cells[3].innerHTML;
    document.getElementById("modalExamLevel").innerHTML ="Exam Level: " + x.cells[4].innerHTML;
    document.getElementById("modalComment").innerHTML ="Comment: " + x.cells[5].innerHTML;
    document.getElementById("modalCommentTimeStamp").innerHTML ="Comment Time Stamp: " + x.cells[6].innerHTML;
    document.getElementById("modalResponce").innerHTML ="Responce: " + x.cells[7].innerHTML;
    document.getElementById("modalResponceTimeStamp").innerHTML ="Responce Time Stamp: " + x.cells[8].innerHTML;
    
    document.getElementById("modalExamIDHidden").value = x.cells[0].innerHTML;
    document.getElementById("modalModuleCodeHidden").value = x.cells[1].innerHTML;
    document.getElementById("modalExamPeriodHidden").value = x.cells[2].innerHTML;
    document.getElementById("modalExamTypeHidden").value = x.cells[3].innerHTML;
    document.getElementById("modalExamLevelHidden").value = x.cells[4].innerHTML;
    document.getElementById("modalCommentHidden").value = x.cells[5].innerHTML;
    document.getElementById("modalCommentTimeStampHidden").value = x.cells[6].innerHTML;
    document.getElementById("modalResponceHidden").value = x.cells[7].innerHTML;
    document.getElementById("modalResponceTimeStampHidden").value = x.cells[8].innerHTML;
}



function myFunction() {
  var x = document.getElementById("myLinks");
  if (x.style.display === "block") {
    x.style.display = "none";
  } else {
    x.style.display = "block";
  }
}

function getRow(x) {
  window.location.href="InternalModDashboard.jsp?exid=" + x;
}