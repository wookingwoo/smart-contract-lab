pragma solidity ^0.4.11;
contract Auction {
	address public highestBidder;	// �ְ� ������ ��巹��
	uint public highestBid;	// �ְ� ������
	
	/// ������
	function Auction() payable {
		highestBidder = msg.sender;
		highestBid = 0;
	}
	
	/// ���� ó�� �Լ�
	function bid() public payable {
		// ���� �������� �ְ� �����׺��� ������ Ȯ��
		require(msg.value > highestBid);
		
		// ���� �ְ� �����ڿ��� ��ȯ�� �׼� ����
		uint refundAmount = highestBid;
		
		// �ְ������� ��巹�� ������Ʈ
		address currentHighestBidder = highestBidder;
		
		// ������Ʈ �� ������Ʈ
		highestBid = msg.value;
		highestBidder = msg.sender;
		
		// ���� �ְ�� �����ڿ��� ������ ��ȯ
		if(!currentHighestBidder.send(refundAmount)) {
			throw;
		}
	}
}
