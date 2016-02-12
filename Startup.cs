using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(winthemonth.Startup))]
namespace winthemonth
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
