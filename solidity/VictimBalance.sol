pragma solidity ^0.4.11;
contract  VictimBalance {
	// ��巹�� ���� �ܰ� ����
	mapping (address => uint) public userBalances;

	// �޽����� ����ϱ� ���� �̺�Ʈ
	event MessageLog(string);
	
	// �ܰ� ����ϱ� ���� �̺�Ʈ
	event BalanceLog(uint);

	/// ������
	function VictimBalance() {
	}

	/// �۱ݹ��� �� ȣ��Ǵ� �Լ�
	function addToBalance() public payable {
		userBalances[msg.sender] += msg.value;
	}

	/// �̴��� ������ �� ȣ��Ǵ� �Լ�
	function withdrawBalance() public payable returns(bool) {
		MessageLog("withdrawBalance started.");
		BalanceLog(this.balance);
		
		// 1 �ܰ� Ȯ��
		if(userBalances[msg.sender] == 0) {
			MessageLog("No Balance.");
			return false;
		}
		
		// 2 �ڽ��� ȣ���� ��巹���� �̴� ��ȯ
		if (!(msg.sender.call.value(userBalances[msg.sender])())) { throw; }
		
		// 3 �ܰ� ������Ʈ
		userBalances[msg.sender] = 0;
		
		MessageLog("withdrawBalance finished.");
		
		return true;
	}
}
