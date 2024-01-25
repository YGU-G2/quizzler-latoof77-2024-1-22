using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using Students_registration.CLASSES;
using Students_registration.FORMS;

namespace Students_registration
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            GLOBAL_VARS.d._server = "localhost";
            GLOBAL_VARS.d._user = "root";
            GLOBAL_VARS.d._pw = "";
            GLOBAL_VARS.d._db = "students";
            GLOBAL_VARS.d.connect();

            Main m = new Main();
            m.ShowDialog();
        }
    }
}
