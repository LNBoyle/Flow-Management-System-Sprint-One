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


function display(x) {
    document.getElementById("modalExamID2").innerHTML ="Exam ID: " + x.cells[0].innerHTML;
    document.getElementById("modalTimeStamp2").innerHTML ="Time Stamp: " + x.cells[1].innerHTML;
    document.getElementById("modalExamTitle2").innerHTML ="Exam Title: " + x.cells[2].innerHTML;
    document.getElementById("modalSchool2").innerHTML ="School: " + x.cells[3].innerHTML;
    document.getElementById("modalModuleCoordinator2").innerHTML ="Module Coordinator: " + x.cells[4].innerHTML;
    document.getElementById("modalModuleCode2").innerHTML ="Module Code: " + x.cells[5].innerHTML;
    document.getElementById("modalExamType2").innerHTML ="Exam Type: " + x.cells[6].innerHTML;
    document.getElementById("modalExamSitting2").innerHTML ="Exam Sitting: " + x.cells[7].innerHTML;
    document.getElementById("modalExamLevel2").innerHTML ="Exam Level: " + x.cells[8].innerHTML;
    document.getElementById("modalSemester2").innerHTML ="Semester: " + x.cells[9].innerHTML;
    document.getElementById("modalYear2").innerHTML ="Exam Year: " + x.cells[10].innerHTML;

    document.getElementById('ExamIDHidden2').value = x.cells[0].innerHTML;
    document.getElementById('modalExamIDHidden2').value = x.cells[0].innerHTML;
    document.getElementById('modalTimeStampHidden2').value = x.cells[1].innerHTML;
    document.getElementById('modalExamTitleHidden2').value = x.cells[2].innerHTML;
    document.getElementById('modalSchoolHidden2').value = x.cells[3].innerHTML;
    document.getElementById('modalModuleCoordinatorHidden2').value = x.cells[4].innerHTML;
    document.getElementById('modalModuleCodeHidden2').value = x.cells[5].innerHTML;
    document.getElementById('modalExamTypeHidden2').value = x.cells[6].innerHTML;
    document.getElementById('modalExamSittingHidden2').value = x.cells[7].innerHTML;
    document.getElementById('modalExamLevelHidden2').value = x.cells[8].innerHTML;
    document.getElementById("modalSemesterHidden2").value = x.cells[9].innerHTML;
    document.getElementById("modalYearHidden2").value = x.cells[10].innerHTML;
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