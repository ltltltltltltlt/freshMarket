package fresh.dao;

import java.util.List;
import java.util.Set;

import fresh.vo.AddressInfo;

public interface IAddressInfoDAO extends IDAO<AddressInfo, Integer> {
	public List<AddressInfo> findAll(Set<Integer> key) throws Exception;

	public void doUpdateCount(Integer id) throws Exception ;
}