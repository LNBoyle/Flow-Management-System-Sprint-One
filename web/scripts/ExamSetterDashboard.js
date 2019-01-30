var rowSelected = null;

function alerting(x){
        document.getElementById("modalExamID").innerHTML ="Exam ID: " + x.cells[0].innerHTML;
	document.getElementById("modalExamTitle").innerHTML ="Exam Title: " + x.cells[1].innerHTML;
	document.getElementById("modalSchool").innerHTML ="School: " + x.cells[2].innerHTML;
	document.getElementById("modalModuleCoordinator").innerHTML ="Module Coordinator: " + x.cells[3].innerHTML;
	document.getElementById("modalModuleCode").innerHTML ="Module Code: " + x.cells[4].innerHTML;
	document.getElementById("modalExamType").innerHTML ="Exam Type: " + x.cells[5].innerHTML;
        document.getElementById("modalExamSitting").innerHTML ="Exam Sitting: " + x.cells[6].innerHTML;
	document.getElementById("modalExamLevel").innerHTML ="Exam Level: " + x.cells[7].innerHTML;
	document.getElementById("modalSemester").innerHTML ="Semester: " + x.cells[8].innerHTML;
	document.getElementById("modalYear").innerHTML ="Exam Year: " + x.cells[9].innerHTML;
        
        document.getElementById('ExamIDHidden').value = x.cells[0].innerHTML;
        document.getElementById('modalExamIDHidden').value = x.cells[0].innerHTML;
	document.getElementById('modalExamTitleHidden').value = x.cells[1].innerHTML;
	document.getElementById('modalSchoolHidden').value = x.cells[2].innerHTML;
	document.getElementById('modalModuleCoordinatorHidden').value = x.cells[3].innerHTML;
	document.getElementById('modalModuleCodeHidden').value = x.cells[4].innerHTML;
	document.getElementById('modalExamTypeHidden').value = x.cells[5].innerHTML;
	document.getElementById('modalExamSittingHidden').value = x.cells[6].innerHTML;
        document.getElementById('modalExamLevelHidden').value = x.cells[7].innerHTML;
	document.getElementById("modalSemesterHidden").value = x.cells[8].innerHTML;
	document.getElementById("modalYearHidden").value = x.cells[9].innerHTML;
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
  window.location.href="SchoolOfficeDashboard.jsp?exid=" + x;
}