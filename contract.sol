// SPDX-License-Identifier: MIT

pragma solidity 0.8.6;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "@chainlink/contracts/src/v0.8/interfaces/KeeperCompatibleInterface.sol";

contract Counter is KeeperCompatibleInterface {
    uint public counter = 0;
    uint public immutable interval = 60;
    uint public lastTimeStamp = block.timestamp;

    function checkUpkeep(bytes calldata checkData) public view override returns (bool upkeepNeeded, bytes memory performData) {
        upkeepNeeded = (block.timestamp - lastTimeStamp) > interval;
        performData = checkData;
    }

    function performUpkeep(bytes calldata performData) external override {
        lastTimeStamp = block.timestamp;
        counter = counter + 1;
        performData;
    }
}
