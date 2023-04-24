pragma solidity ^0.4.11;
contract MarketPlaceOverflowMod4 {
	address public owner;
	uint public stockQuantity;	// ��� ��
	
	modifier onlyOwner() {
		require(msg.sender == owner);
		_;
	}
	
	/// �߰� ��� ���� ����ϴ� �̺�Ʈ
	event AddStock(uint _addedQuantity);
			
	/// ������
	function MarketPlaceOverflowMod4() {
		owner = msg.sender;
		stockQuantity = 0;
	}
	
	/// ��� �߰��ϴ� ó��
	function addStock(uint _addedQuantity) public onlyOwner {
		// ��� �� Ȯ��
		require(stockQuantity + _addedQuantity > stockQuantity);
		
		AddStock(_addedQuantity);
		stockQuantity += _addedQuantity;
	}
}
