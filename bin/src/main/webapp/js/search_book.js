var isOpen=false;
var query;
var type;
var meaning;
var language;
function doScroll(){
	var index = document.getElementById("index").innerHTML.toString();
	var scroll=document.getElementById("scroll");
	
	if(type==null|| language==null||meaning==null||query==null){
		query=document.getElementById("bookQuery").value;
	 type=getSelectedOption(document.getElementById("type")).value;
	meaning=getSelectedOption(document.getElementById("meaning")).value;
	 language=getSelectedOption(document.getElementById("language")).value;
	
   }
	scroll.id="main"+index;
	var regexp=document.getElementById("index").innerHTML.toString()
	 $('#'+scroll.id).load("getMoreBooks?query="+query+"&type="+type+"&meaning="+meaning+"&language="+language+"&index="+index);
}

function changeIsOpen(){
	if (isOpen){
		document.getElementById("type").options[0].selected = true;
		document.getElementById("meaning").options[0].selected = true;
		document.getElementById("language").options[0].selected = true;
		document.getElementById("collapse-icon").className="mdi-hardware-keyboard-arrow-down";
	    isOpen=false;
	} else {
		document.getElementById("collapse-icon").className="mdi-hardware-keyboard-arrow-up";
		isOpen=true;
	}
}

function submitBookForm(){
	query=document.getElementById("bookQuery").value;
	 type=getSelectedOption(document.getElementById("type")).value;
	meaning=getSelectedOption(document.getElementById("meaning")).value;
	 language=getSelectedOption(document.getElementById("language")).value;
	 var queryArray =query.split(" ");
		 query =queryArray[0] ;
		for	(index = 1; index < queryArray.length; index++) {
		    query +="+"+queryArray[index];
		}
	 $('#search_book_central').load("getBooksBySearchOptions?query="+query+"&type="+type+"&meaning="+meaning+"&language="+language);
	 return false;
	
}

function getSelectedOption (oListbox)
{

  for (var i=0; i < oListbox.options.length; i++)
  {
      if (oListbox.options[i].selected)  return oListbox.options[i];
  }
  return -1;
};