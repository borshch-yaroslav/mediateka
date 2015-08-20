var selDiv = "";
var storedImages = [];
var storedVideos = [];
var storedAudios = [];
var num;

function deleteRecord(recordId) {
	$.ajax({
		type : 'get',
		url : 'deleteRecord',
		dataType : 'JSON',
		data : {
			'recordId' : recordId
		},
		complete : function(data) {
			//document.getElementById('recordId' + recordId).innerHTML = "";
			document.getElementById('recordId' + recordId).hidden = true;
			document.getElementById('restore' + recordId).hidden = false;
		}
	});
}

function restoreRecord(recordId){
	$.ajax({
		type : 'get',
		url : 'restoreRecord',
		dataType : 'JSON',
		data : {
			'recordId' : recordId
		},
		complete : function(data) {
			//document.getElementById('recordId' + recordId).innerHTML = "";
			document.getElementById('recordId' + recordId).hidden = false;
			document.getElementById('restore' + recordId).hidden = true;
		}
	});
}

function like(value, id) {
	$
			.ajax({
				type : 'get',
				url : 'likes',
				dataType : 'JSON',
				data : {
					"likeState" : value,
					"contentGroupId" : id
				},
				complete : function(data) {

					var id = data.responseJSON.id;
					alert(document.getElementById("recordLike" + id).innerHTML);
					document.getElementById("recordLike" + id).innerHTML = data.responseJSON.like;
					alert(document.getElementById("recordLike" + id).innerHTML);
					document.getElementById("recordDislike" + id).innerHTML = data.responseJSON.dislike;
				}
			});

}
$(document).ready(function() {
	$("#image").on("change", handleFileSelect);
	$("#video").on("change", handleFileSelect);
	$("#audio").on("change", handleFileSelect);

	$("#recordForm").on("submit", handleForm);

	$("body").on("click", ".selFile", removeFile);

});

function handleFileSelect(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	filesArr
			.forEach(function(f) {

				if (f.type.match("image.*")) {
					storedImages.push(f);
					selDiv = $("#selectedImages");

					var reader = new FileReader();
					reader.onload = function(e) {
					
						var html = "<div class='col s3 center' style='height:130px'><img src=\""
								+ e.target.result
								+ "\" data-file='"
								+ f.name
								+ "'height='105' class='selFile toDelete' title='Click to remove'></div>";
			
						selDiv.append(html);
                        
					}
					reader.readAsDataURL(f);
				} else if (f.type.match("video.*")) {
					storedVideos.push(f);
					selDiv = $("#selectedVideos");

					var reader = new FileReader();
					
					reader.onloadend = function(e) {
/*					
						var html = "<div><video width = '400' class='selFile' title='Click to remove' controls><source src=\""
								+ e.target.result + "\"></video></div>";
					
						selDiv.append(html);*/
						alert(45);
					}
				
					
					reader.readAsDataURL(f);
				} else if (f.type.match("audio.*")) {
					storedAudios.push(f);

					selDiv = $("#selectedAudios");

					var reader = new FileReader();
					reader.onload = function(e) {

						var html = "<div><audio class='selFile' title='Click to remove' controls><source src=\""
								+ e.target.result + "\"></audio></div>";
						selDiv.append(html);

					}
					
					reader.readAsDataURL(f);
				} else {
					return;
				}
			});
}

function handleForm(e) {

	e.preventDefault();
	var data = new FormData();
	data.append('index', $('#index').text());
	data.append('text', document.getElementById('text').value);
	if (document.getElementById('clubId') != null) {
		data.append('clubId', document.getElementById('clubId').innerHTML
				.toString());
	}
	if (document.getElementById('eventId') != null) {
		data.append('eventId', document.getElementById('eventId').innerHTML
				.toString());
	}
	if (document.getElementById('contentFromInternet') != null) {
		data.append('internetContent', document.getElementById('contentFromInternet').value);
	}
	for (var i = 0, len = storedImages.length; i < len; i++) {
		data.append('image', storedImages[i]);
	}
	for (var i = 0, len = storedVideos.length; i < len; i++) {
		data.append('video', storedVideos[i]);
	}
	for (var i = 0, len = storedAudios.length; i < len; i++) {
		data.append('audio', storedAudios[i]);
	}
	if ((document.getElementById('text').value == "")
			&& (storedImages.length == 0) && (storedAudios.length == 0)
			&& (storedVideos.length == 0) && (document.getElementById('contentFromInternet').value == "")) {
		return;
	}

	var xhr = new XMLHttpRequest();
	xhr.open('POST', 'loadRecord', true);

	xhr.onload = function(e, data) {
		if (this.status == 200) {
			document.getElementById("recordForm").reset();
			document.getElementById("selectedImages").innerHTML = "";
			storedImages = [];
			storedVideos = [];
			storedAudios = [];
			document.getElementById("selectedVideos").innerHTML = "";
			document.getElementById("selectedAudios").innerHTML = "";
			var responseJSON = JSON.parse(e.currentTarget.responseText);

			loadIndex = document.getElementById('index').textContent;
			var loadEl = document.getElementById("load");
			loadIndex++;
			$("#index").text(loadIndex);
			loadEl.id = loadEl.id + loadIndex;
			$('#' + loadEl.id).load(
					"viewNewRecord?recordId=" + responseJSON["contentGroup"].id
							+ "&index="
							+ document.getElementById("index").textContent);

			Materialize.toast(' files uploaded.',2000);
		}
	}

	xhr.send(data);

}

function removeFile(e) {
	var file = $(this).data("file");
	for (var i = 0; i < storedImages.length; i++) {
		if (storedImages[i].name == file) {
			storedImages.splice(i, 1);
			break;
		}
	}
	for (var i = 0; i < storedVideos.length; i++) {
		if (storedVideos[i].name == file) {
			storedVideos.splice(i, 1);
			break;
		}
	}
	for (var i = 0; i < storedAudios.length; i++) {
		if (storedAudios[i].name == file) {
			storedAudios.splice(i, 1);
			break;
		}
	}
	$(this).remove();
}
