pragma solidity ^0.4.11;
contract Lottery {
	// �����ڸ� �����ϴ� ����
	mapping (uint => address) public applicants;

	// ������ ��
	uint public numApplicants;

	// ��÷�� ����
	address public winnerAddress;
	uint public winnerInd;
	
	// ������
	address public owner;

	// Ÿ�ӽ�����
	uint public timestamp;
	
	/// ������ ���θ� Ȯ���ϴ� modifier
	modifier onlyOwner() {
		require(msg.sender == owner);
		_;
	}
	
	/// ������
	function Lottery() {
		numApplicants = 0;
		owner = msg.sender;
	}

	/// ��÷ ���� ó�� �Լ�
	function enter() public {
		// �����ڰ� 3�� �̸����� Ȯ��
		require(numApplicants < 3);
		
		// �̹� ������ ����� �ƴ��� Ȯ��
		for(uint i = 0; i < numApplicants; i++) {
			require(applicants[i] != msg.sender);
		}
		
		// ���� ���� ó��
		applicants[numApplicants++] = msg.sender;
	}
	
	/// ��÷
	function hold() public onlyOwner {
		// �����ڰ� 3�� �̻����� Ȯ��
		require(numApplicants == 3);
		
		// Ÿ�ӽ����� �� ����
		timestamp = block.timestamp;
		
		// ��÷
		winnerInd = timestamp % 3;
		winnerAddress = applicants[winnerInd];
	}

}
