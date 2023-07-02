using Microsoft.AspNetCore.Mvc;
using Nethereum.Web3;

namespace NetherFirst.Controllers;

[Route("api/[controller]")]
[ApiController]
public class HomeController : ControllerBase
{
    [HttpGet("GetAccountBalance")]
    public async Task<IActionResult> GetAccountBalance([FromQuery]string address)
    {
        var web3 = new Web3("Http://127.0.0.1:8545");
        var balance = await web3.Eth.GetBalance.SendRequestAsync(address);
        var etherAmount =  Web3.Convert.FromWei(balance.Value);
        return Ok(etherAmount);
    }

    [HttpGet("ReadContract")]
    public async Task ReadContract ()
    {
        var abi = @"[{'anonymous':false,'inputs':[{'indexed':true,'internalType':'int256','name':'a','type':'int256'},{'indexed':true,'internalType':'address','name':'sender','type':'address'},{'indexed':false,'internalType':'int256','name':'result','type':'int256'}],'name':'Multiplied','type':'event'},{'inputs':[{'internalType':'int256','name':'multiplier','type':'int256'}],'name':'multi','outputs':[],'stateMutability':'nonpayable','type':'function'},{'inputs':[{'internalType':'int256','name':'a','type':'int256'}],'name':'multiply','outputs':[{'internalType':'int256','name':'r','type':'int256'}],'stateMutability':'nonpayable','type':'function'}]";

        var web3 = new Web3("http://127.0.0.1:8545");
        var contractAddress = "0xE5D82952f91D846e9B21e93946E83f6c8291214e";
        var contract = web3.Eth.GetContract(abi, contractAddress);
        var multiplyFunction = contract.GetFunction("multiply");
        var multiplyEvent = contract.GetEvent("Multiplied"); 

        var filterAll = await multiplyEvent.CreateFilterAsync();
        var filter7 = await multiplyEvent.CreateFilterAsync(7);

        transactionHash = await multiplyFunction.SendTransactionAsync(senderAddress, 7);
        transactionHash = await multiplyFunction.SendTransactionAsync(senderAddress, 8);

        receipt = await MineAndGetReceiptAsync(web3, transactionHash);

        var log = await multiplyEvent.GetFilterChanges<MultipliedEvent>(filterAll);
        var log7 = await multiplyEvent.GetFilterChanges<MultipliedEvent>(filter7);

        Assert.Equal(2, log.Count);
        Assert.Equal(1, log7.Count);
        Assert.Equal(7, log7[0].Event.MultiplicationInput);
        Assert.Equal(49, log7[0].Event.Result);
    }
    public class MultipliedEvent
    {
        [Parameter("int", "a", 1, true)]
        public int MultiplicationInput {get; set;}

        [Parameter("address", "sender", 2, true)]
        public string Sender {get; set;}

        [Parameter("int", "result", 3, false)]
        public int Result {get; set;}
    }

    public async Task<TransactionReceipt> MineAndGetReceiptAsync(Web3.Web3 web3, string transactionHash){

        var miningResult = await web3.Miner.Start.SendRequestAsync(6);
        Assert.True(miningResult);

        var receipt = await web3.Eth.Transactions.GetTransactionReceipt.SendRequestAsync(transactionHash);

        while(receipt == null){
            Thread.Sleep(1000);
            receipt = await web3.Eth.Transactions.GetTransactionReceipt.SendRequestAsync(transactionHash);
        }

        miningResult = await web3.Miner.Stop.SendRequestAsync();
        Assert.True(miningResult);
        return receipt;
    }

}