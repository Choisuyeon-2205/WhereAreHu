package comparator;

import java.util.Comparator;
import model.ServiceAreaVO;

public class ServiceAreaGoodComparator implements Comparator<ServiceAreaVO>{
	@Override
	public int compare(ServiceAreaVO o1, ServiceAreaVO o2) {
		if(o1.getThumbsup()>o2.getThumbsup())
			return -1;
		if(o1.getThumbsup()>o2.getThumbsup())
			return 1;
		
		return 0;
	}
}