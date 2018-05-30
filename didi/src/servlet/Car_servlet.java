package servlet;

import dao.Car_dao;
import dao.Driver_dao;
import model.Car;
import model.Driver;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet("/car_servlet")
public class Car_servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");
        response.setCharacterEncoding("utf-8");

        String id = "";
        try {
            id = request.getParameter("id");
        }catch (Exception e){
            id = "";
        }

        Car_dao car_dao = new Car_dao();
        List<Car> list = new ArrayList<>();
        String jsonStr = "";

        if("list".equals(id)){

            int cpn_id;
            try {
                cpn_id = Integer.parseInt(request.getSession().getAttribute("cpn_id").toString());
            }catch (Exception e){
                cpn_id = 0;
                e.printStackTrace();
            }

            String u_state_s ;
            try{
                u_state_s = request.getParameter("u_state_s");
            }catch (Exception e){
                u_state_s = "0";
            }
            String u_name_s ;
            try{
                u_name_s = request.getParameter("u_name_s");
            }catch (Exception e){
                u_name_s = "";
            }
            int currPage ;
            int pageSize ;
            try {
                currPage = Integer.parseInt(request.getParameter("curr_page"));
            }catch (Exception e){
                currPage = 1;
                e.printStackTrace();
            }
            try {
                pageSize = Integer.parseInt(request.getParameter("page_size"));
            }catch (Exception e){
                pageSize = 1;
                e.printStackTrace();
            }

            HashMap<String ,String> sMap = new HashMap<>() ;
            sMap.put("u_state_s",u_state_s);
            sMap.put("u_name_s",u_name_s);

            int totalCount = car_dao.get_search_count(cpn_id,sMap);
            int totalPage = 0;

            jsonStr = "{\"car\":[";
            list = car_dao.get_car_list(cpn_id,currPage,pageSize,sMap);
            for(int i = 0;i<list.size();i++){
                list.get(i).setHost(car_dao.get_host(list.get(i).getC_id().intValue()));
                jsonStr+="{\"c_id\":\""+list.get(i).getC_id()+"\","
                        +"\"c_t_name\":\""+list.get(i).getC_t_name()+"\","
                        +"\"c_plate_number\":\""+list.get(i).getC_plate_number()+"\","
                        +"\"c_buy_time\":\""+list.get(i).getC_buy_time()+"\","
                        +"\"c_brand\":\""+list.get(i).getC_brand()+"\","
                        +"\"c_color\":\""+list.get(i).getC_color()+"\","
                        +"\"c_max_number\":\""+list.get(i).getC_max_number()+"\","
                        +"\"c_picture\":\""+list.get(i).getC_picture()+"\","
                        +"\"c_state\":\""+list.get(i).getC_state()+"\","
                        +"\"host_name\":\""+list.get(i).getHost().getHost_name()
                        +"\"}";

                if(i != list.size()-1){
                    jsonStr+=",";
                }
            }
            if (totalCount % pageSize == 0)
                totalPage = totalCount / pageSize;
            else
                totalPage = totalCount / pageSize + 1;
            jsonStr+="],\"page\":[{";
            jsonStr+="\"total_count\":\""+totalCount+"\"";
            jsonStr+=",\"total_page\":\""+totalPage+"\"";
            jsonStr+=",\"curr_page\":\""+currPage+"\"";
            jsonStr+="}]}";

        }else {

            String status = "error";

            if("mod".equals(id)){
                int a_id = Integer.parseInt(request.getParameter("de_a_id"));

                if(car_dao.mod_car_by_id(a_id,2)){
                    status = "success";
                }
            }else if("remod".equals(id)){
                int a_id = Integer.parseInt(request.getParameter("de_a_id"));

                if(car_dao.mod_car_by_id(a_id,1)){
                    status = "success";
                }
            }else if("delete".equals(id)){
                int a_id = Integer.parseInt(request.getParameter("de_a_id"));

                if(car_dao.delete_car_by_id(a_id)){
                    status = "success";
                }
            }
            jsonStr = "{\"status\":[" +
                    "{\"status\":\""+status+"\"}" +
                    "]}";
        }

        System.out.print(jsonStr);
        PrintWriter out = response.getWriter();
        out.print(jsonStr);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
