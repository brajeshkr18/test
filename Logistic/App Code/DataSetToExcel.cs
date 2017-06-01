using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;


namespace ExcelUtility
{
    /// <summary>
    /// Summary description for DataSetToExcel.
    /// </summary>
    public class DataSetToExcel
    {
        public DataSetToExcel()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static void Convert(DataTable ds, HttpResponse Response,string filename)
        {
            Response.Clear();
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            Response.AppendHeader("content-disposition", "attachment; filename=" + filename+".xls");
            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite = new System.Web.UI.HtmlTextWriter(stringWrite);
            System.Web.UI.WebControls.DataGrid dg = new System.Web.UI.WebControls.DataGrid();
            dg.DataSource = ds;
            dg.DataBind();
            dg.RenderControl(htmlWrite);
            Response.Write(stringWrite.ToString());
            Response.End();
        }
    }
}