pragma solidity ^0.4.11;
contract Owned {
	address public owner;
	
	/// ���� ��� ���� modifier
	modifier onlyOwner() {
		require(msg.sender == owner);
		_;
	}
	
	/// ������ ����
	function owned() internal {
		owner = msg.sender;
	}
	
	/// ������ ����
	function changeOwner(address _newOwner) public onlyOwner {
		owner = _newOwner;
	}
}

contract Mortal is Owned {
	/// ��Ʈ��Ʈ�� �Ҹ��Ű�� ������ �̴��� �����ڿ��� �۱�
	function kill() public onlyOwner {
		selfdestruct(owner);
	}
}

contract MortalSample is Mortal{
	string public someState;
	
	/// Fallback �Լ�
	function() payable {
	}
	
	/// ������
	function MortalSample() {
		// Owned�� ���ǵ� owned �Լ��� ȣ��
		owned();
		
		// someState�� �ʱ갪�� ����
		someState = "initial";
	}
}
