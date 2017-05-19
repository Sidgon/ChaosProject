using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ChaosWeb.Startup))]
namespace ChaosWeb
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
