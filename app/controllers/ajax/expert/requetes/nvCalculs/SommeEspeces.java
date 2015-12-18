package controllers.ajax.expert.requetes.nvCalculs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Map;

import javax.sql.DataSource;

import play.db.DB;

public class SommeEspeces {
	
	/**
	 * Calcule la somme des espèces témoignées par maille sur une période pour un groupe ou sous-groupe défini
	 * @param info
	 * @param tailleUTM
	 * @return
	 * @throws ParseException
	 * @throws SQLException
	 */
	public static ResultSet calculeSommeEspeces(Map<String,String> info, int tailleUTM) throws ParseException, SQLException {
		DataSource ds = DB.getDataSource();
		Connection connection = ds.getConnection();
		PreparedStatement sommeEspeces;

		ArrayList<Object> listeParams = new ArrayList<Object>();
		String statement = "";
		/*
		if ((info.get("sous_groupe") != null) && (! info.get("sous_groupe").equals(""))) {
			statement += " INNER JOIN espece_is_in_groupement_local ON espece.espece_id = espece_is_in_groupement_local.espece_espece_id"
				+ " INNER JOIN groupe ON espece_is_in_groupement_local.groupe_groupe_id = groupe.groupe_id"
				+ " INNER JOIN utms ON utms.utm = f.fiche_utm_utm"
				+ " WHERE obs.observation_validee = 1"
				+ " AND groupe.groupe_id=?";
			listeParams.add(info.get("sous_groupe"));
		} else if ((info.get("groupe") != null) && (! info.get("groupe").equals(""))) {
			statement += " INNER JOIN espece_is_in_groupement_local ON espece.espece_id = espece_is_in_groupement_local.espece_espece_id"
				+ " INNER JOIN groupe ON espece_is_in_groupement_local.groupe_groupe_id = groupe.groupe_id"
				+ " INNER JOIN utms ON utms.utm = f.fiche_utm_utm"
				+ " WHERE obs.observation_validee = 1"
				+ " AND groupe.groupe_id=?";
			listeParams.add(info.get("groupe"));
		} else {
			statement += " INNER JOIN utms ON utms.utm = f.fiche_utm_utm"
				+ " WHERE obs.observation_validee = 1";
		}
		*/
		sommeEspeces = connection.prepareStatement(statement); 
		//setParams(sommeEspeces, listeParams);
		ResultSet rs = sommeEspeces.executeQuery();
		
		return rs;
	}

}
