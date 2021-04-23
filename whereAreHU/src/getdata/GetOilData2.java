package getdata;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import model.FoodDAO;
import model.FoodVO;
import model.OilDAO;
import model.OilVO;

public class GetOilData2 {

	public static void main(String[] args) {
		//주유소 DATA 가져오기 (API=> DB)
        try {
          
            String urlStr = "http://data.ex.co.kr/openapi/restinfo/restOilList?key=test&type=json";      
            URL url = new URL(urlStr);
            
            String line = "";
            String result = "";
            
            BufferedReader br;
            br = new BufferedReader(new InputStreamReader(url.openStream()));
            while ((line = br.readLine()) != null) {
                result = result.concat(line);
                //System.out.println(line);                
            }            
            
            // JSON parser 만들어 문자열 데이터를 객체화한다.
            JSONParser parser = new JSONParser();
            JSONObject obj = (JSONObject)parser.parse(result);
            
            // list 아래가 배열형태로
            // {"list" : [ {"returnType":"json","clearDate":"--",.......} ] 
            JSONArray parse_listArr = (JSONArray)obj.get("list");
            
            String miseType = "";
            
            OilDAO oilDAO= new OilDAO();
            // 객체형태로
            // {"returnType":"json","clearDate":"--",.......},... 
            for (int i=0;i<parse_listArr.size();i++) {
                JSONObject oils = (JSONObject) parse_listArr.get(i);
                String stdRestCd = (String) oils.get("stdRestCd");    // 휴게소번호
                String stime = (String) oils.get("stime");            // 오픈시간
                String etime = (String) oils.get("etime") ;        // 마감시간

                OilVO oil= new OilVO(stime,etime,stdRestCd);
                System.out.println(oil);
                int result2= oilDAO.insertTimeOil(oil);
                if(result2==1) 
                	System.out.println("1개삽입 성공");
                else
                	System.out.println("삽입실패");    
            }
            
            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

	}

}
