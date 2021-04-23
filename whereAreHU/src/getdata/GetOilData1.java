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

public class GetOilData1 {

	public static void main(String[] args) {
		//주유소 DATA 가져오기 (API=> DB)
        try {
          
            String urlStr = "http://data.ex.co.kr/openapi/business/curStateStation?key=test&type=json&numOfRows=100&pageNo=3";      
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
                String direction = (String) oils.get("direction");    // 주유소방향(ex.부산)
                String serviceAreaCode = (String) oils.get("serviceAreaCode");            // 주유소id(pk)
                String serviceAreaName = (String) oils.get("serviceAreaName") ;        // 주유소이름
                String telNo = (String) oils.get("telNo");        //주유소 전화번호
                String oilCompany  = (String) oils.get("oilCompany");     //주유소회사
                String lpgYn  = (String) oils.get("lpgYn");    //lpg주유소인지("Y"/"N")
                String gasolinePrice  = (String) oils.get("gasolinePrice");    //휘발유가격
                String diselPrice  = (String) oils.get("diselPrice");    //경유가격
                String lpgPrice  = (String) oils.get("lpgPrice");    //lpg가격
                String serviceAreaCode2  = (String) oils.get("serviceAreaCode2");    //휴게소id(fk)
  
                OilVO oil= new OilVO(serviceAreaCode,serviceAreaName,direction,telNo,oilCompany,lpgYn,gasolinePrice,diselPrice,lpgPrice,serviceAreaCode2);
                System.out.println(oil);
                int result2= oilDAO.insertOil(oil);
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
