
function validateMyForm() {
  // Declare pop up confirmation results
  var result1;
  var result2;
  var result3;
  
  // Sanity check weight
  var weight_check_triggered = false;
  var weight = $("#weight").val();
  if (weight < 90 || weight > 200) {
    weight_check_triggered = true;
  }
  
  // Double check with user if weight is right
  if (weight_check_triggered) {
    result1 = confirm("The inputted weight is " + weight.toString() + ", are you sure about this?");
    if (!result1) {
      return false; // Inputted weight was not verified by user, do NOT submit the form
    }
  }
  
  
  // Sanity check body fat
  var body_fat_check_triggered = false;
  var body_fat = $("#body_fat").val();
  if (body_fat <= 20 || body_fat >= 50) {
    body_fat_check_triggered = true;
  }
  
  if (body_fat_check_triggered) {
    result2 = confirm("The inputted body fat is " + body_fat.toString() + ", are you sure about this?");
    if (!result2) {
      return false;
    }
  }
  
  
  // Sanity check height
  var height_check_triggered = false;
  var height = $("#height").val();
  if (height < 4.5 || height > 7) {
    height_check_triggered = true;
  }
  
  if (height_check_triggered) {
    result3 = confirm("The inputted height is " + height.toString() + ", are you sure about this?");
    if (!result3) {
      return false;
    }
  }
  
  if (result1 && result2 && result3 && !weight_check_triggered && !body_fat_check_triggered && !height_check_triggered) {
    return true;
  }
}

