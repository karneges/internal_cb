pragma ever-solidity >=0.61.2;
pragma AbiHeader expire;
pragma AbiHeader pubkey;
import "./Mock.sol";
import "./IMock.sol";
import "@broxus/contracts/contracts/libraries/MsgFlag.sol";


contract Sample {
  uint16 static _nonce;

  function deployAndGetNumber(TvmCell mockCode,uint16 randomNonce) external {
  tvm.accept();
    address mockContract = new Mock{
      value: 0.1 ton,
      stateInit: tvm.buildStateInit({ contr: Mock, varInit: { _nonce:randomNonce }, pubkey: 0,code: mockCode })
    }();
    //  compiler doesn't understand that callback is internal function, therefore crash in runtime with code 60
    IMock(mockContract).getNumber{ callback: Sample.numberReceiver, value: 0, bounce: false, flag: MsgFlag.ALL_NOT_RESERVED }();
  }
  //  internal function
  function numberReceiver(uint256 _number) internal {}
}
