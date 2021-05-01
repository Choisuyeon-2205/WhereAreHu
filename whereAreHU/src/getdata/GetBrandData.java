package getdata;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import model.BrandDAO;
import model.BrandVO;

public class GetBrandData {

	public static void main(String[] args) {
		 //브랜드 DATA 가져오기 (API=> DB)
        try {
          
            String urlStr = "http://data.ex.co.kr/openapi/restinfo/restBrandList?key=test&type=json&numOfRows=100&pageNo=3";      
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
            
            BrandDAO brandDAO= new BrandDAO();
            // 객체형태로
            // {"returnType":"json","clearDate":"--",.......},... 
            for (int i=0;i<parse_listArr.size();i++) {
                JSONObject brands = (JSONObject) parse_listArr.get(i);
                String stdRestCd = (String) brands.get("stdRestCd");    // 휴게소id
                String stime= (String) brands.get("stime");            // 음식id
                String brdCode = (String) brands.get("brdCode") ;        // 음식이름
                String brdName = (String) brands.get("brdName");        //음식가격
                String brdDesc  = (String) brands.get("brdDesc");        //음식설명
                String etime  = (String) brands.get("etime");    //베스트메뉴여부("Y"/"N")
                
                BrandVO brand= new BrandVO(brdCode,brdName,brdDesc,stime,etime,stdRestCd);
                System.out.println(brand);
                int result2= brandDAO.insertbrand(brand);
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
