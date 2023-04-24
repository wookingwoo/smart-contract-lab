pragma solidity ^0.4.11;
contract MarketPlaceTOD {
	address public owner;
	uint public price;	// �ܰ�
	uint public stockQuantity;	// ��� ��
	
	modifier onlyOwner() {
		require(msg.sender == owner);
		_;
	}
	
	event UpdatePrice(uint _price);
	event Buy(uint _price, uint _quantity, uint _value, uint _change);
	
	/// ������
	function MarketPlaceTOD() {
		owner = msg.sender;
		price = 1;
		stockQuantity = 100;
	}
	
	/// �ܰ� ������Ʈ
	function updatePrice(uint _price) public onlyOwner {
		price = _price;
		UpdatePrice(price);
	}

	/// ���� ó��
	function buy(uint _quantity) public payable {
		if (msg.value < _quantity * price || _quantity > stockQuantity) {
			throw;
		}
		
		// �Ž����� �۱�
		if(!msg.sender.send(msg.value - _quantity * price)) {
			throw;	
		}
		
		stockQuantity -= _quantity;
		Buy(price, _quantity, msg.value, msg.value - _quantity * price);
	}	
}
