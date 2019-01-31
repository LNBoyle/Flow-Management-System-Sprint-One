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