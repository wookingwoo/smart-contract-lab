pragma solidity ^0.4.11;
contract Secret {
	string private secret;	// ��� ���� ���ڿ�
	
	/// ������
	function Secret(string _secret) {
		secret = _secret;
	}
	
	/// ��� ���� ���ڿ� ����
	function setSecret(string _secret) public {
		secret = _secret;
	}
}
