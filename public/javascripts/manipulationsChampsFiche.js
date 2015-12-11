//**************** témoins ****************
//*****************************************

	// ajout d'un membre en tant que témoin

function ajouterUnMembre(){
	var numMembres = parseInt($('#nombreMembres').val());
	numMembres++;
	$('#nombreMembres').val(numMembres)

	$('#apresDernierMembre').before('<div id="champMembre'+numMembres+'">' +
	'<input type="text" name="membre_nom'+numMembres+'" placeholder="Nom du membre" id="membre'+numMembres+'">' +
	'<button id="supprimerMembre'+numMembres+'" onClick="supprimerMembre('+numMembres+'); return false;">-</button></div>');

	$('#membre'+numMembres).autocomplete({	source : listeMembres,
		minLength: 1
	});
}

	// suppression d'un champ de membre (sauf pour le membre courant)

function supprimerMembre(numMembre){
	$('#champMembre'+numMembre).remove();
}


//**************** observations ****************
//**********************************************


	// ajout d'une observation supplémentaire

function newObservation(){
	nombreObservations++;
	var numObs=nombreObservations;

	$('#apresDerniereObservation').before('<tr id="observation-new-'+numObs+'" style="vertical-align:top" value="1"></tr>');

	$('#observation-new-'+numObs).load('/ajax/newObservation/'+numObs);
	setTimeout(function(){rafraichirPhoto(numObs);},200);
}


function supprimerObservation(observation_position){
	$('#observation-'+observation_position).remove();
}

function rafraichirListeDEspeces(observation_tag){
	var groupe_id = $('#groupes-'+observation_tag).val();
	$('#especes-'+observation_tag).load('/ajax/especes/dansGroupe/'+groupe_id);
	resetComplements(observation_tag);
}

//************** complément d'information ****************
//********************************************************

	// ajout d'une info complémentaire

function ajouterComplement(observation_tag){
	var numComp = parseInt($('#nbComplements-' + observation_tag).val());
	numComp++;
	$('#nbComplements-' + observation_tag).val(numComp);
	var compId = 'complement-' + observation_tag + '-' + numComp;

	$('#apresDernierComplement-' + observation_tag).before('<div id="' + compId + '"></div>');
	var groupe_id = $('#groupes-' + observation_tag).val();
	$('#' + compId).load('/ajax/newinfoscomplementaires/' + observation_tag + '/' + numComp + '/' + groupe_id + '/' + 10, function(){
		rafraichirStadeSexePrecis(observation_tag, numComp);
	});
}

	// supprimer une info complémentaire

function supprimerComplement(complement_tag){
	$('#complement-' + complement_tag).remove();
}

function resetComplements(observation_tag){
	$('#complements-' + observation_tag).children("div").remove();

	var numComp = parseInt($('#nbComplements-' + observation_tag).val());
	numComp = 1;
	$('#nbComplements-' + observation_tag).val(numComp);
	var compId = 'complement-' + observation_tag + '-' + numComp;

	$('#apresDernierComplement-' + observation_tag).before('<div id="' + compId + '"></div>');
	var groupe_id = $('#groupes-' + observation_tag).val();
	$('#' + compId).load('/ajax/newinfoscomplementaires/' + observation_tag + '/' + numComp + '/' + groupe_id + '/' + 10, function(){
		rafraichirStadeSexePrecis(observation_tag, numComp);
	});

}

function rafraichirStadeSexePrecis(observation_tag, complement_tag){
	var groupe_id = $('#groupes-' + observation_tag).val();
	var stade_sexe_pere_id = $('#stadeSexe-' + observation_tag + '-' + complement_tag).val();
	$('#stadeSexePrecis-' + observation_tag + '-' + complement_tag).load('/ajax/listeStadeSexePrecis/' + groupe_id + '/' + stade_sexe_pere_id);
	//if (!$('#stadeSexePrecis-' + observation_tag + '-' + complement_tag).children("option")){
	//	$('#stadeSexePrecis-' + observation_tag + '-' + complement_tag).hide();
	//}
}

function rafraichirPhoto(observation_position){
	var espece_id = $('#especes'+observation_position).val();
	var id = '#photo'+observation_position;
	var url = '/ajax/chargephoto/'+espece_id;
	$(id).load(url);
}


function isInt(value){
	return !isNaN(value) && parseInt(value) == value;
}


function validationTemoins() {
	var nombreMembres = parseInt($('#nombreMembres').val());
	for (var membre_position = 1; membre_position <= nombreMembres; membre_position++) {
		var membre_nom = $('#membre' + membre_position).val();
		if (membre_nom == '') {
			$('#message').append('- Un champ de témoin est vide.<br>');
		}
		if (membre_nom) {
			if ($.inArray(membre_nom, listeMembres) < 0) {
				$('#message').append('- ' + membre_nom + ' n\'est pas référencé !' + membre_position + '<br>');
			}
		}
	}
	if (nombreMembres == 0) {
		$('#message').append('- Vous devez renseigner au moins un témoin.');
	}
}