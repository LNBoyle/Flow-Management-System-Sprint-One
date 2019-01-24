function alerting(x){
	document.getElementById("modalExamTitle").innerHTML ="Exam Title: " + x.cells[0].innerHTML;
	document.getElementById("modalSchool").innerHTML ="School: " + x.cells[1].innerHTML;
	document.getElementById("modalModuleCoordinator").innerHTML ="Module Coordinator: " + x.cells[2].innerHTML;
	document.getElementById("modalModuleCode").innerHTML ="Module Code: " + x.cells[3].innerHTML;
	document.getElementById("modalExamType").innerHTML ="Exam Type: " + x.cells[4].innerHTML;
        document.getElementById("modalExamSitting").innerHTML ="Exam Sitting: " + x.cells[5].innerHTML;
	document.getElementById("modalExamLevel").innerHTML ="Exam Level: " + x.cells[6].innerHTML;
	document.getElementById("modalDateCreated").innerHTML ="Date Created: " + x.cells[7].innerHTML;
	document.getElementById("modlaCreatorID").innerHTML ="Created By Lecturer ID: " + x.cells[8].innerHTML;

	document.getElementById('modalExamTitleHidden').value = x.cells[0].innerHTML;
	document.getElementById('modalSchoolHidden').value = x.cells[1].innerHTML;
	document.getElementById('modalModuleCoordinatorHidden').value = x.cells[2].innerHTML;
	document.getElementById('modalModuleCodeHidden').value = x.cells[3].innerHTML;
	document.getElementById('modalExamTypeHidden').value = x.cells[4].innerHTML;
	document.getElementById('modalExamSittingHidden').value = x.cells[5].innerHTML;
        document.getElementById('modalExamLevelHidden').value = x.cells[6].innerHTML;
	document.getElementById('modalDateCreatedHidden').value = x.cells[7].innerHTML;
	document.getElementById('modlaCreatorIDHidden').value = x.cells[8].innerHTML;
}

function myFunction() {
  var x = document.getElementById("myLinks");
  if (x.style.display === "block") {
    x.style.display = "none";
  } else {
    x.style.display = "block";
  }
}