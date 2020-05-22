package model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import entidad.Mueble;
import util.MySqlDBConexion;

public class MuebleModel {
	
	public int insertaMueble(Mueble obj){
		int salida = -1;
		
		Connection conn= null;
		PreparedStatement pstm = null;
		try {
			
			conn = MySqlDBConexion.getConexion();
			String sql ="insert into mueble values(null,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombre());			
			pstm.setString(2, obj.getMaterial());
			pstm.setString(3, obj.getDescrip());
			pstm.setInt(4, obj.getStock());
			pstm.setDouble(5, obj.getPrecio());
			salida = pstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(pstm!= null) pstm.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		
		return salida;
	}

}
