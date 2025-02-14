// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract UniversityToken is ERC20 {
    constructor() ERC20("UniversityName_GroupName", "UNGN") {
        _mint(msg.sender, 2000 * 10 ** decimals());
    }

    // Функция для получения времени последней транзакции
    function getLastTransactionTime() public view returns (string memory) {
        return timestampToString(block.timestamp);
    }

    // Функция для получения адреса отправителя транзакции
    function getTransactionSender() public view returns (address) {
        return msg.sender;
    }

    // Функция для получения адреса получателя транзакции
    function getTransactionReceiver(address receiver) public pure returns (address) {
        return receiver;
    }

    // Вспомогательная функция для преобразования timestamp в строку
    function timestampToString(uint256 timestamp) internal pure returns (string memory) {
        return string(abi.encodePacked("Timestamp: ", uint2str(timestamp)));
    }

    // Вспомогательная функция для преобразования uint в строку
    function uint2str(uint256 _i) internal pure returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 length;
        while (j != 0) {
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        uint256 k = length;
        while (_i != 0) {
            k = k - 1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bstr[k] = bytes1(temp);
            _i /= 10;
        }
        return string(bstr);
    }
}