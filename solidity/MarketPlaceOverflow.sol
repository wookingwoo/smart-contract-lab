pragma solidity ^0.4.11;
contract MarketPlaceOverflow {
	address public owner;
	uint8 public stockQuantity;	// ��� ��
	
	modifier onlyOwner() {
		require(msg.sender == owner);
		_;
	}
	
	/// �߰� ��� ���� ����ϴ� �̺�Ʈ
	event AddStock(uint _addedQuantity);
			
	/// ������
	function MarketPlaceOverflow() {
		owner = msg.sender;
		stockQuantity = 100;
	}
	
	/// ��� �߰��ϴ� ó��
	function addStock(uint8 _addedQuantity) public onlyOwner {
		AddStock(_addedQuantity);
		stockQuantity += _addedQuantity;
	}
}
