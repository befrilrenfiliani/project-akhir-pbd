/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package penjualan.implement;
import penjualan.entity.pelanggan;
import penjualan.koneksi.koneksi;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import penjualan.interfc.pelangganInterfc;
/**
 * 985
 * @author irfan
 */
public class pelangganImplement implements pelangganInterfc {
    
    //Untuk melakukan select / view dari tabel pelanggan pada database ke form
        @Override
    public List<pelanggan> getAll() throws SQLException {
        Statement st = koneksi.getConnection().createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM pelanggan");
        List<pelanggan>list = new ArrayList<>();
        while(rs.next()){
            pelanggan plg = new pelanggan();
            plg.setkodePelanggan(rs.getString("Kode_Pelanggan"));
            plg.setNamaPelanggan(rs.getString("Nama_Lengkap"));
            plg.setjenisKelamin(rs.getString("Jenis_Kelamin"));
            plg.setAlamat(rs.getString("Alamat"));
            plg.setTelp(rs.getString("Telp"));
            list.add(plg);
        }
        return list;
    }

    @Override
    public pelanggan insert(pelanggan o) throws SQLException {
        PreparedStatement
                st = koneksi.getConnection().prepareStatement("INSERT INTO pelanggan VALUES(?,?,?,?,?)");
        st.setString(1, o.getkodePelanggan());
        st.setString(2, o.getNamaPelanggan());
        st.setString(3, o.getjenisKelamin());
        st.setString(4, o.getAlamat());
        st.setString(5, o.getTelp());
        st.executeUpdate();
        return o;
    }

    @Override
    public void update(pelanggan o) throws SQLException {
        PreparedStatement
                st = koneksi.getConnection().prepareStatement("UPDATE pelanggan SET Nama_Lengkap=?,Jenis_Kelamin=?,Alamat=?, Telp=? WHERE Kode_Pelanggan=?");
        st.setString(1, o.getNamaPelanggan());
        st.setString(2, o.getjenisKelamin());
        st.setString(3, o.getAlamat());
        st.setString(4, o.getTelp());
        st.setString(5, o.getkodePelanggan());
        st.executeUpdate();
    }

    @Override
    public void delete(String kodePelanggan) throws SQLException {
        PreparedStatement
                st = koneksi.getConnection().prepareStatement("DELETE FROM pelanggan WHERE Kode_Pelanggan=?");
        st.setString(1, kodePelanggan);
        st.executeUpdate();
    }
}
