package dao;

import util.DbUtil;
import model.Driver;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Driver_dao {

    /**
     * 获取分页信息 + 搜索
     * @param currPage
     * @param pageSize
     * @param map
     * @return
     */
    public List<Driver> get_driver_list(int cpn_id,int currPage, int pageSize , HashMap map){
        List<Driver> list = new ArrayList<>();

        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;
            String sql = "CALL get_driver_page_list( ? , ? , ? , ? , ? );";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,cpn_id);
                pstmt.setInt(2,currPage);
                pstmt.setInt(3,pageSize);
                pstmt.setInt(4,Integer.parseInt(map.get("u_state_s").toString()));
                pstmt.setString(5,map.get("u_name_s").toString());
                System.out.println("----<<<"+currPage+"  "+pageSize+"  " +map.get("u_state_s").toString()+"  " +map.get("u_name_s").toString());
                rs = pstmt.executeQuery();
                while (rs.next()){
                    Driver driver = new Driver();
                    driver.setU_credit(rs.getInt(1));
                    driver.setU_id((long)rs.getInt(2));
                    driver.setD_real_name(rs.getString(3));
                    driver.setD_car_class(rs.getString(4));
                    driver.setD_first_issue(rs.getDate(5));
                    driver.setD_valid_period(rs.getDate(6));
                    driver.setD_licence_picture(rs.getString(7));
                    driver.setD_id_f_picture(rs.getString(8));
                    driver.setD_id_b_picture(rs.getString(9));
                    driver.setD_state((long)rs.getInt(10));
                    list.add(driver);
                }
            }catch (Exception e){
                System.out.println("出错了");
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

    public int get_search_count(int cpn_id,HashMap map){
        int count = 0;
        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;
            String sql = "CALL get_driver_list_count( ? , ? , ? )";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,cpn_id);
                pstmt.setInt(2,Integer.parseInt(map.get("u_state_s").toString()));
                pstmt.setString(3,map.get("u_name_s").toString());
                rs = pstmt.executeQuery();
                while (rs.next()){
                    count = rs.getInt(1);
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
        return count;
    }



    /**
     * 通过id 删除
     * @param u_id
     * @return
     */
    public boolean delete_driver_by_id(int u_id) {
        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;

            String sql = "CALL delete_driver_by_id( ? )";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,u_id);

                if(pstmt.executeUpdate() > 0){
                    return true;
                }else return false;

            }catch (Exception e){
                e.printStackTrace();
            }finally {
                try {
                    if (pstmt != null) pstmt.close();
                    db.freeConnection(conn);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return false;
    }

    /**
     * 通过id 修改状态
     * @param u_id
     * @return
     */
    public boolean mod_driver_by_id(int u_id,int u_state) {
        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;

            String sql = "UPDATE didi.t_driver SET d_state = ? WHERE u_id = ?  ";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,u_state);
                pstmt.setInt(2,u_id);

                if(pstmt.executeUpdate() > 0){
                    return true;
                }else return false;

            }catch (Exception e){
                e.printStackTrace();
            }finally {
                try {
                    if (pstmt != null) pstmt.close();
                    db.freeConnection(conn);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return false;
    }
}
