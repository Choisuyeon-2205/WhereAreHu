package getdata;
import java.net.URL;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import model.FoodDAO;
import model.FoodVO;
 
public class GetFoodData {
 
    public static void main(String[] args) {
        //음식 DATA 가져오기 (API=> DB)
        try {
          
            String urlStr = "http://data.ex.co.kr/openapi/restinfo/restBestfoodList?key=test&type=json&numOfRows=100&pageNo=40";      
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
            
            FoodDAO foodDAO= new FoodDAO();
            // 객체형태로
            // {"returnType":"json","clearDate":"--",.......},... 
            for (int i=0;i<parse_listArr.size();i++) {
                JSONObject foods = (JSONObject) parse_listArr.get(i);
                String stdRestCd = (String) foods.get("stdRestCd");    // 휴게소id
                int seq = Integer.parseInt((String) foods.get("seq"));            // 음식id
                String foodNm = (String) foods.get("foodNm") ;        // 음식이름
                int foodCost = Integer.parseInt((String) foods.get("foodCost"));        //음식가격
                String etc  = (String) foods.get("etc");        //음식설명
                String bestfoodyn  = (String) foods.get("bestfoodyn");    //베스트메뉴여부("Y"/"N")
   
                FoodVO food= new FoodVO(seq,foodNm,etc,bestfoodyn,foodCost,stdRestCd);
                System.out.println(food);
                int result2= foodDAO.insertfood(food);
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
