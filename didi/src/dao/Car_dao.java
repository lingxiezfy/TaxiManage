package dao;

import util.DbUtil;
import model.Car;
import model.Host;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Car_dao {

    /**
     * 获取分页信息 + 搜索
     * @param currPage
     * @param pageSize
     * @param map
     * @return
     */
    public List<Car> get_car_list(int cpn_id, int currPage, int pageSize , HashMap map){
        List<Car> list = new ArrayList<>();

        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;
            String sql = "CALL get_car_page_list( ? , ? , ? , ? , ? );";
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
                    Car car = new Car();
                    car.setC_t_name(rs.getString(1));
                    car.setC_id((long)rs.getInt(2));
                    car.setC_t_id((long)rs.getInt(3));
                    car.setC_plate_number(rs.getString(4));
                    car.setC_buy_time(rs.getDate(5));
                    car.setC_brand(rs.getString(6));
                    car.setC_color(rs.getString(7));
                    car.setC_max_number((long)rs.getInt(8));
                    car.setC_picture(rs.getString(9));
                    car.setC_state((long)rs.getInt(10));
                    list.add(car);
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
            String sql = "CALL get_car_list_count( ? , ? , ? )";
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
    public boolean delete_car_by_id(int u_id) {
        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;

            String sql = "CALL delete_car_by_id( ? );";
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
    public boolean mod_car_by_id(int u_id,int u_state) {
        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;

            String sql = "UPDATE didi.t_car SET c_state = ? WHERE c_id = ?  ";
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

    /**
     * 返回上级属性
     * @param c_id
     * @return
     */
    public Host get_host(int c_id){
        Host host = new Host();

        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;
            String sql = "call get_car_host( ? )";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,c_id);
                rs = pstmt.executeQuery();
                while (rs.next()){
                    host.setHost_id(rs.getInt(1));
                    host.setHost_name(rs.getString(2));
                    host.setHost_type(rs.getInt(3));
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
        return host;
    }
}
