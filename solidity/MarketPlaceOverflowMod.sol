pragma solidity ^0.4.11;
contract MarketPlaceOverflowMod {
	address public owner;
	uint8 public stockQuantity;	// ��� ��
	
	modifier onlyOwner() {
		require(msg.sender == owner);
		_;
	}
	
	/// �߰� ��� ���� ����ϴ� �̺�Ʈ
	event AddStock(uint8 _addedQuantity);
			
	/// ������
	function MarketPlaceOverflowMod() {
		owner = msg.sender;
		stockQuantity = 100;
	}
	
	/// ��� �߰��ϴ� ó��
	function addStock(uint8 _addedQuantity) public onlyOwner {
		// �����÷ο� Ȯ��
		require(stockQuantity + _addedQuantity > stockQuantity);
		
		AddStock(_addedQuantity);
		stockQuantity += _addedQuantity;
	}
}
