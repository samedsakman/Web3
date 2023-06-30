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
}