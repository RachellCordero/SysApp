using System.Web;
using System.Web.Optimization;

namespace SysApp
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"));

            bundles.Add(new StyleBundle("~/Login/css").Include(
                      "~/lib/lib/bootstrap/css/bootstrap.min.css",
                      "~/lib/lib/font-awesome/css/font-awesome.css",
                      "~/lib/css/style.css",
                      "~/lib/css/style-responsive.css"
                      ));
            bundles.Add(new ScriptBundle("~/Login/js").Include(
                      "~/lib/lib/jquery/jquery.min.js",
                      "~/lib/lib/bootstrap/js/bootstrap.min.js",
                      "~/lib/lib/jquery.backstretch.min.js"
                      ));

            bundles.Add(new StyleBundle("~/Master/css").Include(
                     "~/lib/lib/bootstrap/css/bootstrap.min.css",
                     "~/lib/lib/font-awesome/css/font-awesome.css", 
                     "~/lib/lib/gritter/css/jquery.gritter.css",
                     "~/lib/css/zabuto_calendar.css",
                     "~/lib/css/style-responsive.css",
                     "~/lib/css/style.css"
                     ));

            bundles.Add(new ScriptBundle("~/Master/js").Include(
                      "~/lib/lib/chart-master/Chart.js",
                      "~/lib/lib/jquery/jquery.min.js",
                      "~/lib/lib/bootstrap/js/bootstrap.min.js",
                      "~/lib/lib/jquery.dcjqaccordion.2.7.js",
                      "~/lib/lib/jquery.scrollTo.min.js",
                      "~/lib/lib/jquery.nicescroll.js",
                      "~/lib/lib/jquery.sparkline.js",
                      "~/lib/lib/jquery.scrollTo.min.js",
                      "~/lib/lib/common-scripts.js",
                      "~/lib/lib/gritter/js/jquery.gritter.js",
                      "~/lib/lib/gritter-conf.js",
                      "~/lib/lib/sparkline-chart.js",
                      "~/lib/lib/zabuto_calendar.js"
                      ));

        }
    }
}
