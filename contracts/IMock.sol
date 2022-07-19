pragma ton-solidity >=0.61.0;
pragma AbiHeader expire;

interface IMock {
  function getNumber()  responsible external returns (uint256);
}
