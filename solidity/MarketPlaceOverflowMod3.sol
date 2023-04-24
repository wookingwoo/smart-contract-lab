pragma solidity ^0.4.11;
contract MarketPlaceOverflowMod3 {
	address public owner;
	uint8 public stockQuantity;	// ��� ��
	
	modifier onlyOwner() {
		require(msg.sender == owner);
		_;
	}
	
	/// �߰� ��� ���� ����ϴ� �̺�Ʈ
	event AddStock(uint _addedQuantity);
			
	/// ������
	function MarketPlaceOverflowMod3() {
		owner = msg.sender;
		stockQuantity = 100;
	}
	
	/// ��� �߰��ϴ� ó��
	function addStock(uint _addedQuantity) public onlyOwner {  // ������ �κ�
		// ��� �� Ȯ��
		require(_addedQuantity < 256);
		
		// �����÷ο� Ȯ��
		require(stockQuantity + uint8(_addedQuantity) > stockQuantity);
		
		AddStock(_addedQuantity);
		stockQuantity += uint8(_addedQuantity);
	}
}
