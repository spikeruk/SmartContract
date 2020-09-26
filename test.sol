pragma solidity ^0.6.0;

import "https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/IUniswapV2Router02.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/SafeMath.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";


//10000000000000000 = 0.01ETH
//0xC4375B7De8af5a38a93548eb8453a498222C4fF2
//0x5c4ac68aac56ebe098d621cd8ce9f43270aaa355

contract ArbRunner {
    
    using SafeMath for uint256;
    address internal constant UNISWAP_ROUTER_ADDRESS = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    IUniswapV2Router02 public uniswapRouter;
    
    
     constructor() public {
        uniswapRouter = IUniswapV2Router02(UNISWAP_ROUTER_ADDRESS);
    }
    
    
    
     function Execute2TokenUniswap(uint256 _ethIn, address _token1, address _token2) public payable   {
        uint deadline = now + 60;

        
        address[] memory path1 = new address[](2);
        path1[0] = address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2); //ETH
        path1[1] = address(_token1);
        
        //amountOutMin
        //uint[] memory minOuts1 = uniswapRouter.getAmountsOut(ethIn, path1); 
        uint[] memory swap1Amounts = uniswapRouter.swapExactETHForTokens{value: _ethIn}(
            1,
            path1,
            address(this),
            deadline
        );
        uint256 swap1Output = swap1Amounts[1];
        

    }
    
   receive() external payable {}
   
}

