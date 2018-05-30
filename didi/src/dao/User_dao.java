package dao;

import util.DbUtil;
import model.T_user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class User_dao {
    /**
     * 判断用户是否是司机
     * @param u_name 用户名
     * @return boolean
     */
    public boolean isDriverByName(String u_name){
        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;
            String sql = "CALL is_driver_by_name( ? )";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1,u_name);
                rs = pstmt.executeQuery();
                if(rs.next()){
                    if(rs.getBoolean(1)){
                        return true;
                    }else {
                        return false;
                    }
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
        return false;
    }

    /**
     * 根据用户名获取用户信息
     * @param u_name
     * @return T_user对象
     */
    public T_user get_user_by_name(String u_name){
        T_user user = new T_user();

        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;
            String sql = "SELECT * FROM didi.t_user WHERE u_name = ?";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1,u_name);
                rs = pstmt.executeQuery();
                if(rs.next()){
                    user.setU_id((long)rs.getInt("u_id"));
                    user.setU_photo(rs.getString("u_photo"));
                    user.setU_name(rs.getString("u_name"));
                    user.setU_password(rs.getString("u_password"));
                    user.setU_phone_number(rs.getString("u_phone_number"));
                    user.setU_id_card_number(rs.getString("u_id_card_number"));
                    user.setU_sex((long)rs.getInt("u_sex"));
                    user.setU_birth_day(rs.getDate("u_birth_day"));
                    user.setU_credit((long)rs.getInt("u_credit"));
                    user.setU_state((long)rs.getInt("u_state"));
                    user.setU_balance((double)rs.getFloat("u_balance"));
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

        return user;
    }

    /**
     * 根据用户名判断用户是否存在
     * @param u_name
     * @return boolean
     */
    public boolean is_exist_by_name(String u_name){

        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;
            String sql = "call is_user_exist( ? )";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1,u_name);
                rs = pstmt.executeQuery();
                if(rs.next()){
                    if(rs.getBoolean(1)){
                        return true;
                    }else {
                        return false;
                    }
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

        return false;
    }

    /**
     * 判断手机号是否存在
     * @param u_phone_number
     * @return
     */
    public boolean is_exist_by_phone(String u_phone_number){

        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;
            String sql = "call is_phone_exist( ? )";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1,u_phone_number);
                rs = pstmt.executeQuery();
                if(rs.next()){
                    if(rs.getBoolean(1)){
                        return true;
                    }else {
                        return false;
                    }
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

        return false;
    }

    /**
     * 判断身份证是否存在
     * @param u_id_card
     * @return
     */
    public boolean is_exist_by_id_card(String u_id_card){

        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;
            String sql = "call is_id_card_exist( ? )";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1,u_id_card);
                rs = pstmt.executeQuery();
                if(rs.next()){
                    if(rs.getBoolean(1)){
                        return true;
                    }else {
                        return false;
                    }
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

        return false;
    }

    /**
     * 用户自主注册
     * @param user
     * @return
     */
    public boolean register_user(T_user user){
        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;
            //call register_user('333','444','15797638225','362428199912141140')
            String sql = "call register_user(?,?,?,?)";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1,user.getU_name());
                pstmt.setString(2,user.getU_password());
                pstmt.setString(3,user.getU_phone_number());
                pstmt.setString(4,user.getU_id_card_number());
                rs = pstmt.executeQuery();
                if(rs.next()){
                    if(rs.getInt(1) > 0){
                        return true;
                    }else return false;
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
        return false;
    }

    /**
     * 获取用户分页信息 + 搜索
     * @param currPage
     * @param pageSize
     * @param map
     * @return
     */
    public List<T_user> get_user_list(int currPage, int pageSize , HashMap map){
        List<T_user> list = new ArrayList<>();

        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;
            String sql = "CALL get_user_page_list(? , ? , ? , ? )";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,currPage);
                pstmt.setInt(2,pageSize);
                pstmt.setInt(3,Integer.parseInt(map.get("u_state_s").toString()));
                pstmt.setString(4,map.get("u_name_s").toString());
                System.out.println("----<<<"+currPage+"  "+pageSize+"  " +map.get("u_state_s").toString()+"  " +map.get("u_name_s").toString());
                rs = pstmt.executeQuery();
                while (rs.next()){
                    T_user user = new T_user();
                    user.setU_id((long)rs.getInt("u_id"));
                    user.setU_photo(rs.getString("u_photo"));
                    user.setU_name(rs.getString("u_name"));
                    user.setU_phone_number(rs.getString("u_phone_number"));
                    user.setU_id_card_number(rs.getString("u_id_card_number"));
                    user.setU_sex((long)rs.getInt("u_sex"));
                    user.setU_birth_day(rs.getDate("u_birth_day"));
                    user.setU_credit((long)rs.getInt("u_credit"));
                    user.setU_state((long)rs.getInt("u_state"));
                    user.setU_balance((double)rs.getFloat("u_balance"));

                    list.add(user);
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

    public int get_search_count(HashMap map){
        int count = 0;
        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;
            String sql = "CALL get_user_list_count( ? , ? )";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,Integer.parseInt(map.get("u_state_s").toString()));

                pstmt.setString(2,map.get("u_name_s").toString());
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
     * 通过id修该密码
     * @param u_id
     * @param u_pwd
     * @return
     */
    public boolean edit_pwd_by_id(int u_id, String u_pwd) {
        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;

            String sql = "UPDATE didi.t_user SET u_password = ? WHERE u_id = ? ";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1,u_pwd);
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
     * 通过id 删除
     * @param u_id
     * @return
     */
    public boolean delete_user_by_id(int u_id) {
        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;

            String sql = "DELETE FROM didi.t_user WHERE u_id = ? ";
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
     * 通过id 冻结
     * @param u_id
     * @return
     */
    public boolean mod_user_by_id(int u_id,int u_state) {
        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;

            String sql = "UPDATE didi.t_user SET u_state = ? WHERE u_id = ?  ";
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
