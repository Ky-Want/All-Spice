namespace AllSpice.Controllers;


[ApiController]
[Route("api/[controller]")]
public class RecipesController : ControllerBase
{
  private readonly Auth0Provider _auth0provider;
  private readonly RecipesController _recipeService;



  public RecipesController(Auth0Provider auth0Provider)
  {
    _auth0provider = auth0Provider;
  }



  [HttpPost]
  [Authorize]
  public async Task<ActionResult<Recipe>> CreateRecipe([FromBody] Recipe NewRecipe);
  // Account userInfo = await _auth0provider.GetUserInfoAsync<Account>(HttpContext);
  // NewRecipe.CreatorId = userInfo.id;
}