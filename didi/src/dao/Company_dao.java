package dao;

import util.DbUtil;
import model.T_company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Company_dao {

    /**
     * 通过id获取公司信息
     * @param id
     * @return
     */
    public T_company get_company_by_id(long id){
        T_company company = new T_company();

        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;
            String sql = "SELECT * FROM didi.t_company WHERE cpn_id = ?";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,(int)id);
                rs = pstmt.executeQuery();
                if(rs.next()){
                    company.setCpn_ico(rs.getString("cpn_ico"));
                    company.setCpn_id((long)rs.getInt("cpn_id"));
                    company.setCpn_name(rs.getString("cpn_name"));

                }
            }catch (Exception e){
                e.printStackTrace();
            }finally {
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    db.freeConnection(conn);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return company;
    }

    /**
     * 获取公司列表
     * @return
     */
    public List<T_company> get_company_list(){
        List<T_company> list = new ArrayList<>();

        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;
            String sql = "SELECT * FROM t_company ORDER BY cpn_id";
            try {
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                while (rs.next()){

                    T_company company = new T_company();

                    company.setCpn_ico(rs.getString("cpn_ico"));
                    company.setCpn_id((long)rs.getInt("cpn_id"));
                    company.setCpn_name(rs.getString("cpn_name"));

                    list.add(company);
                }
            }catch (Exception e){
                e.printStackTrace();
            }finally {
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    db.freeConnection(conn);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        return list;
    }
}
