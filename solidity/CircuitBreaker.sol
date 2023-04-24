pragma solidity ^0.4.11;
contract CircuitBreaker {
	bool public stopped;	// ���� true�̸� ��� ������ �ߵ��� ������
	address public owner;		
	bytes16 public message;

	modifier onlyOwner() {
		require(msg.sender == owner);
		_;
	}

	/// ���� stopped�� ���� Ȯ���ϴ� modifier
	modifier isStopped() {
		require(!stopped);
		_;
	}

	/// ������
	function CircuitBreaker() {
		owner = msg.sender;
		stopped = false;
	}
	
	/// stopped�� ���� ����
	function toggleCircuit(bool _stopped) public onlyOwner {
		stopped = _stopped;
	}
		
	/// message�� ���� �����ϴ� �Լ�
	/// ���� stopped�� ���� true�̸� ������ �� ����
	function setMessage(bytes16 _message) public isStopped {
		message = _message;
	}
}
