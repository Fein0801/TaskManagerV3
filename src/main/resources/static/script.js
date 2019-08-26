/**
 * 
 */
function switchCompletionStatus() {
	var completion = document.getElementById("completed_value").value;
	var completionDisplay = document.getElementById("display_completion");
	if (completion === false) {
		completion = true;
	} else {
		completion = false;
	}
	document.getElementById("completed_value").value = completion;
	completionDisplay.value = completion;
	return completion;
}