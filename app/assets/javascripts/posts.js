// on change, grab the ‘image-preview’ element, and change it’s src attribute to the file path of our input 
var loadFile = function(event) {
  var output = document.getElementById('image-preview');
  output.src = URL.createObjectURL(event.target.files[0]);
};