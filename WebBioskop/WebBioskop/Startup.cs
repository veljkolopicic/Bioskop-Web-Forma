using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebBioskop.Startup))]
namespace WebBioskop
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
