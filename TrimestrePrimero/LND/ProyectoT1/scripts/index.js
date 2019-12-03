$(document).ready(function() {
	
	construirListado();

});

function construirListado() {
	var codHTML = "";

	$.each(listado, function(i, item) {
		codHTML += '<div class="col-md-3 card">\n';
        codHTML += '<img class="card-img-top img-fluid" src="imgs/' + item.foto + '" alt="Card image cap">\n';
        codHTML += '<div class="card-body">\n';
        codHTML += '<a href="' + item.fichero + '.html" class="btn btn-primary">' + item.persona  + '</a>\n';
        codHTML += '</div>\n';
        codHTML += '</div>\n';
	});

	$("#panelListado").html(codHTML);

}