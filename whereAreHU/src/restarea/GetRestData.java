package restarea;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import model.ServiceAreaDAO;
import model.ServiceAreaVO;
 
public class GetRestData {
 
    public static void main(String[] args) {
        //휴게소 조회 서비스
        try {
            // 인증키
            String serviceKey = "9631752245";
            
            String urlStr = "http://data.ex.co.kr/openapi/restinfo/hiwaySvarInfoList?key=9631752245&type=json";      
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
            
            ServiceAreaDAO areaDao= new ServiceAreaDAO();
            // 객체형태로
            // {"returnType":"json","clearDate":"--",.......},... 
            for (int i=0;i<parse_listArr.size();i++) {
                JSONObject restArea = (JSONObject) parse_listArr.get(i);
                String svarAddr = (String) restArea.get("svarAddr");    // 주소
                String routeNm = (String) restArea.get("routeNm");            // 노선이름
                String svarCd = (String) restArea.get("svarCd") ;        // 휴게소id
                String svarNm = (String) restArea.get("svarNm");        //휴게소이름
                String mtnofNm  = (String) restArea.get("mtnofNm");        //지사명
                int svarGsstClssCd  = Integer.parseInt((String) restArea.get("svarGsstClssCd"));    // 휴게소/주유소구분코드(0:휴게소/1:주유소)
                int gudClssCd  = Integer.parseInt((String) restArea.get("gudClssCd"));        // 상하행구분코드(0:상행/1:하행)
                int cocrPrkgTrcn = Integer.parseInt((String) restArea.get("cocrPrkgTrcn"));        // 소형차주차대수
                int fscarPrkgTrcn = Integer.parseInt((String) restArea.get("fscarPrkgTrcn"));        // 대형차주차대수
                int dspnPrkgTrcn = Integer.parseInt((String) restArea.get("dspnPrkgTrcn"));        // 장애인주차대수
                String rprsTelNo = (String) restArea.get("rprsTelNo");            //대표전화번호
                
   
                ServiceAreaVO area= new ServiceAreaVO(svarCd,svarNm,svarAddr,rprsTelNo,routeNm,mtnofNm,svarGsstClssCd,gudClssCd,cocrPrkgTrcn,fscarPrkgTrcn,dspnPrkgTrcn,0);
                System.out.println(area);
                int result2= areaDao.insertArea(area);
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
