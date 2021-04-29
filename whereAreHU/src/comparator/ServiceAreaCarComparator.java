package comparator;

import java.util.Comparator;
import model.ServiceAreaVO;

public class ServiceAreaCarComparator implements Comparator<ServiceAreaVO>{
	@Override
	public int compare(ServiceAreaVO o1, ServiceAreaVO o2) {
		if((o1.getMinicar()+o1.getLargecar()+o1.getOthercar())>(o2.getMinicar()+o2.getLargecar()+o2.getOthercar()))
			return -1;
		if((o1.getMinicar()+o1.getLargecar()+o1.getOthercar())<(o2.getMinicar()+o2.getLargecar()+o2.getOthercar()))
			return 1;
		return 0;
	}
}