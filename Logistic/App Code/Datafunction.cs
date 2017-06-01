using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public class Datafunction
{
    private SqlDataAdapter adpt;
    private SqlCommand cmd;
    private SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
    private DataTable dt;

    private void AddPerameters(SqlCommand cmd, SqlParameter[] param)
    {
        foreach (SqlParameter parameter in param)
        {
            if (parameter.Value == null)
            {
                parameter.Value = DBNull.Value;
            }
            cmd.Parameters.Add(parameter);
        }
    }

    public int ExecuteQuery(string spName)
    {
        if (this.con.State == ConnectionState.Closed)
        {
            this.con.Open();
        }
        this.cmd = new SqlCommand(spName, this.con);
        this.cmd.CommandType = CommandType.StoredProcedure;
        SqlParameter parameter = new SqlParameter("@retval", SqlDbType.Int)
        {
            Direction = ParameterDirection.ReturnValue
        };
        this.cmd.Parameters.Add(parameter);
        this.cmd.ExecuteNonQuery();
        int num = Convert.ToInt32(this.cmd.Parameters["@retval"].Value.ToString());
        this.con.Close();
        return num;
    }

    public int ExecuteQuery(string cmdText, string Null)
    {
        if (this.con.State == ConnectionState.Closed)
        {
            this.con.Open();
        }
        this.cmd = new SqlCommand(cmdText, this.con);
        int num = this.cmd.ExecuteNonQuery();
        this.con.Close();
        return num;

    }

    public int ExecuteQuery(string spName, SqlParameter[] param)
    {
        if (this.con.State == ConnectionState.Closed)
        {
            this.con.Open();
        }
        this.cmd = new SqlCommand(spName, this.con);
        this.cmd.CommandType = CommandType.StoredProcedure;
        this.AddPerameters(this.cmd, param);
        SqlParameter parameter = new SqlParameter("@retval", SqlDbType.Int)
        {
            Direction = ParameterDirection.ReturnValue
        };
        this.cmd.Parameters.Add(parameter);
        this.cmd.ExecuteNonQuery();
        int num = Convert.ToInt32(this.cmd.Parameters["@retval"].Value.ToString());
        this.con.Close();
        return num;
    }

    public int ExecuteQuery(string cmdText, SqlParameter[] param, string Null)
    {
        if (this.con.State == ConnectionState.Closed)
        {
            this.con.Open();
        }
        this.cmd = new SqlCommand(cmdText, this.con);
        this.AddPerameters(this.cmd, param);
        int num = this.cmd.ExecuteNonQuery();
        this.con.Close();
        return num;

    }

    public DataTable FillDt(string spName)
    {
        if (this.con.State == ConnectionState.Closed)
        {
            this.con.Open();
        }
        this.cmd = new SqlCommand(spName, this.con);
        this.cmd.CommandType = CommandType.StoredProcedure;
        this.adpt = new SqlDataAdapter(this.cmd);
        this.dt = new DataTable();
        this.adpt.Fill(this.dt);
        return this.dt;
    }

    public DataTable FillDt(string cmdText, string Null)
    {
        if (this.con.State == ConnectionState.Closed)
        {
            this.con.Open();
        }
        this.cmd = new SqlCommand(cmdText, this.con);
        // this.cmd.CommandType = CommandType.StoredProcedure;
        this.adpt = new SqlDataAdapter(this.cmd);
        this.dt = new DataTable();
        this.adpt.Fill(this.dt);
        return this.dt;
    }

    public DataTable FillDt(SqlParameter[] param, string spName)
    {
        if (this.con.State == ConnectionState.Closed)
        {
            this.con.Open();
        }
        this.cmd = new SqlCommand(spName, this.con);
        this.cmd.CommandType = CommandType.StoredProcedure;
        this.AddPerameters(this.cmd, param);
        this.adpt = new SqlDataAdapter(this.cmd);
        this.dt = new DataTable();
        this.adpt.Fill(this.dt);
        return this.dt;
    }

    public DataTable FillDt(SqlParameter[] param, string cmdText, string Null)
    {
        try
        {
            if (this.con.State == ConnectionState.Closed)
            {
                this.con.Open();
            }
            this.cmd = new SqlCommand(cmdText, this.con);
            // this.cmd.CommandType = CommandType.StoredProcedure;
            this.AddPerameters(this.cmd, param);
            this.adpt = new SqlDataAdapter(this.cmd);
            this.dt = new DataTable();
            this.adpt.Fill(this.dt);
            return this.dt;
        }
        finally
        {
            this.con.Close();
        }
        //if (this.con.State == ConnectionState.Closed)
        //{
        //    this.con.Open();
        //}
        //this.cmd = new SqlCommand(cmdText, this.con);
        //// this.cmd.CommandType = CommandType.StoredProcedure;
        //this.AddPerameters(this.cmd, param);
        //this.adpt = new SqlDataAdapter(this.cmd);
        //this.dt = new DataTable();
        //this.adpt.Fill(this.dt);
        //return this.dt;
    }

    internal int ExecuteQuery(object cmdText, object param, string v)
    {
        throw new NotImplementedException();
    }

    internal int ExecuteQuery(object cmdText, string param, string v)
    {
        throw new NotImplementedException();
    }
}
