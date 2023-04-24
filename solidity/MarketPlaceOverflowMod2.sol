pragma solidity ^0.4.11;
contract MarketPlaceOverflowMod2 {
	address public owner;
	uint8 public stockQuantity;	// ��� ��
	
	modifier onlyOwner() {
		require(msg.sender == owner);
		_;
	}
	
	/// �߰� ��� ���� ����ϴ� �̺�Ʈ
	event AddStock(uint8 _addedQuantity);
			
	/// ������
	function MarketPlaceOverflowMod2() {
		owner = msg.sender;
		stockQuantity = 100;
	}
	
	/// ��� �߰��ϴ� ó��
	function addStock(uint8 _addedQuantity) public onlyOwner {
		// ��� �� Ȯ��
		require(_addedQuantity < 256); // �߰��� �ڵ�
		
		// �����÷ο� Ȯ��
		require(stockQuantity + _addedQuantity > stockQuantity);
		
		AddStock(_addedQuantity);
		stockQuantity += _addedQuantity;
	}
}
