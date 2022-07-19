pragma ever-solidity >=0.61.2;
pragma AbiHeader expire;
pragma AbiHeader pubkey;
import "@broxus/contracts/contracts/libraries/MsgFlag.sol";


contract Mock {
  uint16 static _nonce;

  function getNumber() external pure responsible returns (uint256) {

  return {value: 0, bounce: false, flag: MsgFlag.REMAINING_GAS} 10;
  }
}
