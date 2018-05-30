package dao;

import util.DbUtil;
import model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Admin_dao {

    /**
     * 根据管理员帐号获取管理员信息
     * @param a_count
     * @return
     */
    public T_admin get_admin_by_name(String a_count){
        T_admin admin = new T_admin();
        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;
            String sql = "SELECT * FROM didi.t_admin WHERE a_count = ?";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1,a_count);
                rs = pstmt.executeQuery();
                if(rs.next()){
                    admin.setA_id((long)rs.getInt("a_id"));
                    admin.setA_t_id((long)rs.getInt("a_t_id"));
                    admin.setA_count(rs.getString("a_count"));
                    admin.setA_password(rs.getString("a_password"));

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
        return admin;
    }

    /**
     * 判断管理员是否存在
     * @param a_count
     * @return
     */
    public boolean is_exist(String a_count) {
        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;
            String sql = "call is_admin_exist( ? )";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1,a_count);
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
     * 通过id判断是否是公司管理员
     * @param a_id
     * @return 是则返回公司id，不是返回0
     */
    public int is_cpn_admin(int a_id){
        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;
            String sql = "CALL is_cpn_admin( ? )";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,a_id);
                rs = pstmt.executeQuery();
                if(rs.next()){
                   return rs.getInt(1);
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
        return 0;
    }

    /**
     * 获取当前可管理的管理员列表
     * @param a_id 当前管理员id
     * @param a_t_id 当前管理员类型
     * @param cpn_id 当前管理员公司
     * @return
     */
    public List<Admin> get_admin_list(int a_id, int a_t_id, int cpn_id){
        List<Admin> list = new ArrayList<>();

        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;
            String sql = "CALL get_admin_list( ? , ? , ?)";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,a_id);
                pstmt.setInt(2,a_t_id);
                pstmt.setInt(3,cpn_id);
                rs = pstmt.executeQuery();
                while (rs.next()){
                    Admin admin = new Admin();
                    T_admin tadmin = new T_admin();
                    T_company company = new T_company();

                    tadmin.setA_id((long)rs.getInt("a_id"));
                    tadmin.setA_t_id((long)rs.getInt("a_t_id"));
                    tadmin.setA_count(rs.getString("a_count"));
                    tadmin.setA_password(rs.getString("a_password"));
                    if(a_t_id == 3){

                        company.setCpn_ico(rs.getString("cpn_ico"));
                        company.setCpn_id((long)rs.getInt("cpn_id"));
                        company.setCpn_name(rs.getString("cpn_name"));
                    }else {
                        int cpn_id_temp  = is_cpn_admin(tadmin.getA_id().intValue());
                        if(cpn_id_temp >0){
                            Company_dao company_dao = new Company_dao();
                            company = company_dao.get_company_by_id((long) is_cpn_admin(tadmin.getA_id().intValue()));
                        }
                    }
                    admin.setA_t_name(rs.getString("a_t_name"));

                    admin.setAdmin(tadmin);
                    admin.setCompany(company);

                    list.add(admin);
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

    /**
     * 分页+搜索获取当前可管理的管理员列表
     * @param a_id 当前管理员id
     * @param a_t_id 当前管理员类型
     * @param cpn_id 当前管理员公司
     * @return
     */
    public List<Admin> get_admin_list(int a_id, int a_t_id, int cpn_id, int currPage, int pageSize , HashMap map){
        List<Admin> list = new ArrayList<>();

        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;
            String sql = "CALL get_admin_page_list( ? , ? , ? , ? , ? , ? )";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,a_id);
                pstmt.setInt(2,a_t_id);
                pstmt.setInt(3,cpn_id);
                pstmt.setInt(4,currPage);
                pstmt.setInt(5,pageSize);
                pstmt.setInt(6,Integer.parseInt(map.get("a_t_id_s").toString()));
                rs = pstmt.executeQuery();
                while (rs.next()){
                    Admin admin = new Admin();
                    T_admin tadmin = new T_admin();
                    T_company company = new T_company();

                    tadmin.setA_id((long)rs.getInt("a_id"));
                    tadmin.setA_t_id((long)rs.getInt("a_t_id"));
                    tadmin.setA_count(rs.getString("a_count"));
                    tadmin.setA_password(rs.getString("a_password"));
                    int cpn_id_temp  = is_cpn_admin(tadmin.getA_id().intValue());
                    if(cpn_id_temp >0){
                        Company_dao company_dao = new Company_dao();
                        company = company_dao.get_company_by_id((long) is_cpn_admin(tadmin.getA_id().intValue()));

                    }
                    admin.setA_t_name(rs.getString("a_t_name"));

                    admin.setAdmin(tadmin);
                    admin.setCompany(company);

                    list.add(admin);
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

    public int get_search_count(int a_id, int a_t_id, int cpn_id,HashMap map){
        int count = 0;
        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;
            String sql = "CALL get_admin_list_count( ? , ? , ? , ? )";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,a_id);
                pstmt.setInt(2,a_t_id);
                pstmt.setInt(3,cpn_id);
                pstmt.setInt(4,Integer.parseInt(map.get("a_t_id_s").toString()));
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
     * 增加管理员
     * @param
     * @return
     */
    public boolean register_admin(T_admin admin,int cpn_id){
        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;

            String sql = "CALL register_admin( ? , ? , ? , ? )";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,admin.getA_t_id().intValue());
                pstmt.setString(2,admin.getA_count());
                pstmt.setString(3,admin.getA_password());
                pstmt.setInt(4,cpn_id);
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
     * 获取管理员类型列表
     * @param a_t_id 当前管理员类型
     * @return
     */
    public List<T_a_type> get_admin_type_list(int a_t_id){
        List<T_a_type> list = new ArrayList<>();
        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;
            ResultSet rs = null;
            String sql = "SELECT * FROM t_a_type WHERE a_t_id >= "+a_t_id+" ORDER BY a_t_id";
            try {
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                while (rs.next()){
                    T_a_type a_type = new T_a_type();
                    a_type.setA_t_id((long)rs.getInt("a_t_id"));
                    a_type.setA_t_name(rs.getString("a_t_name"));
                    list.add(a_type);
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

    /**
     * 通过id修该密码
     * @param a_id
     * @param a_pwd
     * @return
     */
    public boolean edit_pwd_by_id(int a_id, String a_pwd) {
        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;

            String sql = "UPDATE t_admin SET a_password = ? WHERE a_id = ? ";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1,a_pwd);
                pstmt.setInt(2,a_id);

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
     * @param a_id
     * @return
     */
    public boolean delete_admin_by_id(int a_id) {
        DbUtil db = new DbUtil();
        Connection conn = db.getConnection();
        if(conn != null){
            PreparedStatement pstmt =null;

            String sql = "DELETE FROM t_admin WHERE a_id = ? ";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,a_id);

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
