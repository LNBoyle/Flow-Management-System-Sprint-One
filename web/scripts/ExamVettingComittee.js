var rowSelected = null;

function alerting(x){
        document.getElementById("modalExamID").innerHTML ="Exam ID: " + x.cells[0].innerHTML;
	document.getElementById("modalExamTitle").innerHTML ="Exam Title: " + x.cells[1].innerHTML;
	document.getElementById("modalModuleCode").innerHTML ="Module Code: " + x.cells[2].innerHTML;
	document.getElementById("modalModuleCoordinator").innerHTML ="Module Coordinator: " + x.cells[3].innerHTML;
	
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
  window.location.href="ExternalExaminerDashboard.jsp?exid=" + x;
}