using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;



    public class DataManager
    {
    private string param;
    private string cmdText;

    public SqlDbType ConsignmentId { get; private set; }
    public bool Consignment { get; private set; }
    #region UpdateAdminPassword
    public int UpdateAdminPassword(int id, string password)
        {

            string cmdText = "Update Core_login set password=@password where id=@id";
            SqlParameter[] param = new SqlParameter[]
                {                   
                     new SqlParameter("@password", password),  
                     new SqlParameter("@id",id)    
                };

            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion
        #region UpdateEmployeePassword
        public int UpdateEmployeePassword(int id, string password)
        {

            string cmdText = "Update Core_Employee set Password=@password where Id=@id";
            SqlParameter[] param = new SqlParameter[]
                {                   
                     new SqlParameter("@password", password),  
                     new SqlParameter("@id",id)    
                };

            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion
        #region UpdateClientPassword
        public int UpdateClientPassword(int id, string password)
        {

            string cmdText = "Update Core_client set Password=@password where Id=@id";
            SqlParameter[] param = new SqlParameter[]
                {                   
                     new SqlParameter("@password", password),  
                     new SqlParameter("@id",id)    
                };

            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion
        #region UpdatePartnerPassword
        public int UpdatePartnerPassword(int id, string password)
        {

            string cmdText = "Update Core_Partner set Password=@password where Id=@id";
            SqlParameter[] param = new SqlParameter[]
                {                   
                     new SqlParameter("@password", password),  
                     new SqlParameter("@id",id)    
                };

            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion

        #region SelectEmployeeByMobileNo
        public DataTable SelectEmployeeByMobileNo(string UserId)
        {

            string cmdText = "select Password,role,Id,EmployeeName from Core_Employee where  UserId=@UserId";
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@UserId", UserId);
            return new Datafunction().FillDt(param, cmdText, "");

        }
        #endregion
        #region SelectClientByMobileNo
        public DataTable SelectClientByMobileNo(string UserId)
        {

            string cmdText = "select Password,role,Id,ClientName from Core_client where  UserId=@UserId";
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@UserId", UserId);
            return new Datafunction().FillDt(param, cmdText, "");

        }
        #endregion
        #region SelectPartnerByMobileNo
        public DataTable SelectPartnerByMobileNo(string UserId)
        {

            string cmdText = "select Password,role,Id,PartnerName from Core_Partner where  UserId=@UserId";
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@UserId", UserId);
            return new Datafunction().FillDt(param, cmdText, "");

        }
        #endregion
      
        #region InsertUpdateState
        public int InsertUpdateState(int id, int Mode, string name)
        {
            if (Mode == 0)
            {
                string cmdText = "Insert into Core_states(stateName) values(@name)";
                SqlParameter[] param = new SqlParameter[]
                    {
                         new SqlParameter("@name", name),
                         
                    };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }
            else
            {
                string cmdText = "Update Core_states set stateName=@name where Id=@id";
                SqlParameter[] param = new SqlParameter[]
                {                   
                     new SqlParameter("@name", name),  
                     new SqlParameter("@id",id)    
                };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }

        }
        #endregion
        #region SelectState
        public DataTable SelectState(int id)
        {
            if (id == 0)
            {
                string cmdText = "Select * from Core_states ORDER BY Id DESC";
                return new Datafunction().FillDt(cmdText, "");
            }
            else
            {
                string cmdText = "Select * from Core_states where Id=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
            }
        }
        #endregion
        #region DeleteState
        public int DeleteState(int id)
        {
            string cmdText = "Delete from Core_states where Id=@id ";
            SqlParameter[] param = new SqlParameter[] 
            {
                new SqlParameter("@id",id)
            };
            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion

        #region InsertUpdateClient
        public int InsertUpdateClient(int id, int Mode, string name, string Mobile, string Email, string City, string State, string Address, string Password, string role, string UserId)
        {
            if (Mode == 0)
            {
                string cmdText = "Insert into Core_client(ClientName,Mobile,Email,City,State,Address,Password,role,UserId) values(@name,@Mobile,@Email,@City,@State,@Address,@Password,@role,@UserId)";
                SqlParameter[] param = new SqlParameter[]
                    {
                         new SqlParameter("@name", name),
                         new SqlParameter("@Mobile", Mobile),
                         new SqlParameter("@Email", Email),
                         new SqlParameter("@City", City),
                         new SqlParameter("@State", State),
                         new SqlParameter("@Address", Address),
                         new SqlParameter("@Password", Password),
                         new SqlParameter("@role", role),
                         new SqlParameter("@UserId", UserId),
                         
                    };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }
            else
            {
                string cmdText = "Update Core_client set ClientName=@name,Mobile=@Mobile,Email=@Email,City=@City,State=@State,Address=@Address,Password=@Password,role=@role,UserId=@UserId where Id=@id";
                SqlParameter[] param = new SqlParameter[]
                {                   
                     new SqlParameter("@name", name), 
                      new SqlParameter("@Mobile", Mobile),
                      new SqlParameter("@Email", Email),
                      new SqlParameter("@City", City),
                      new SqlParameter("@State", State),
                      new SqlParameter("@Address", Address),
                      new SqlParameter("@Password", Password),
                      new SqlParameter("@role", role),
                       new SqlParameter("@UserId", UserId),
                     new SqlParameter("@id",id)    
                };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }

        }
        #endregion
        #region SelectClient
        public DataTable SelectClient(int id)
        {
            if (id == 0)
            {
                string cmdText = "Select * from Core_client ORDER BY Id DESC";
                return new Datafunction().FillDt(cmdText, "");
            }
            else
            {
                string cmdText = "Select * from Core_client where Id=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
            }
        }
        #endregion
        #region DeleteClient
        public int DeleteClient(int id)
        {
            string cmdText = "Delete from Core_client where Id=@id ";
            SqlParameter[] param = new SqlParameter[] 
            {
                new SqlParameter("@id",id)
            };
            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion
        #region checkClient
        public int checkClient(string Mobile, string Email)
        {
            string cmdText = "checkClient";
            SqlParameter[] param = new SqlParameter[2];

            param[0] = new SqlParameter("@Mobile", Mobile);
            param[1] = new SqlParameter("@Email", Email);
            return Convert.ToInt32(new Datafunction().ExecuteQuery(cmdText, param));
        }
        #endregion

        #region InsertUpdateEmployee
        public int InsertUpdateEmployee(int id, int Mode, string name, string Mobile, string Email, string City, string State, string Address, string Password, string role, string Designation, string levels, string UserId, string Load_request_role, string Vehicle_request_role, string ask_for_vehicle_role, string Consignement_role, string Bill_role, string Delivery_Performa_role)
        {
            if (Mode == 0)
            {
                string cmdText = "Insert into Core_Employee(EmployeeName,Mobile,Email,City,State,Address,Password,role,Designation,levels,UserId,Load_request_role,Vehicle_request_role,ask_for_vehicle_role,Consignement_role,Bill_role,Delivery_Performa_role) values(@name,@Mobile,@Email,@City,@State,@Address,@Password,@role,@Designation,@levels,@UserId,@Load_request_role,@Vehicle_request_role,@ask_for_vehicle_role,@Consignement_role,@Bill_role,@Delivery_Performa_role)";
                SqlParameter[] param = new SqlParameter[]
                    {
                         new SqlParameter("@name", name),
                         new SqlParameter("@Mobile", Mobile),
                         new SqlParameter("@Email", Email),
                         new SqlParameter("@City", City),
                         new SqlParameter("@State", State),
                         new SqlParameter("@Address", Address),
                         new SqlParameter("@Password", Password),
                         new SqlParameter("@role", role),
                         new SqlParameter("@Designation", Designation),
                         new SqlParameter("@levels", levels),
                         new SqlParameter("@UserId", UserId),
                         new SqlParameter("@Load_request_role", Load_request_role),
                         new SqlParameter("@Vehicle_request_role", Vehicle_request_role),
                         new SqlParameter("@ask_for_vehicle_role", ask_for_vehicle_role),
                         new SqlParameter("@Consignement_role", Consignement_role),
                         new SqlParameter("@Bill_role", Bill_role),
                         new SqlParameter("@Delivery_Performa_role", Delivery_Performa_role),
                    };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }
            else
            {
                string cmdText = "Update Core_Employee set EmployeeName=@name,Mobile=@Mobile,Email=@Email,City=@City,State=@State,Address=@Address,Password=@Password,role=@role,Designation=@Designation,levels=@levels,UserId=@UserId,Load_request_role=@Load_request_role,Vehicle_request_role=@Vehicle_request_role,ask_for_vehicle_role=@ask_for_vehicle_role,Consignement_role=@Consignement_role,Bill_role=@Bill_role,Delivery_Performa_role=@Delivery_Performa_role where Id=@id";
                SqlParameter[] param = new SqlParameter[]
                {                   
                     new SqlParameter("@name", name), 
                      new SqlParameter("@Mobile", Mobile),
                      new SqlParameter("@Email", Email),
                      new SqlParameter("@City", City),
                      new SqlParameter("@State", State),
                      new SqlParameter("@Address", Address),
                      new SqlParameter("@Password", Password),
                      new SqlParameter("@role", role),
                      new SqlParameter("@Designation", Designation),
                      new SqlParameter("@levels", levels),
                      new SqlParameter("@UserId", UserId),
                      new SqlParameter("@Load_request_role", Load_request_role),
                      new SqlParameter("@Vehicle_request_role", Vehicle_request_role),
                     new SqlParameter("@ask_for_vehicle_role", ask_for_vehicle_role),
                     new SqlParameter("@Consignement_role", Consignement_role),
                     new SqlParameter("@Bill_role", Bill_role),
                     new SqlParameter("@Delivery_Performa_role", Delivery_Performa_role),
                     new SqlParameter("@id",id)    
                };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }

        }
        #endregion
        #region SelectEmployee
        public DataTable SelectEmployee(int id)
        {
            if (id == 0)
            {
                string cmdText = "Select * from Core_Employee ORDER BY Id DESC";
                return new Datafunction().FillDt(cmdText, "");
            }
            else
            {
                string cmdText = "Select * from Core_Employee where Id=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
            }
        }
        #endregion
        #region DeleteEmployee
        public int DeleteEmployee(int id)
        {
            string cmdText = "Delete from Core_Employee where Id=@id ";
            SqlParameter[] param = new SqlParameter[] 
            {
                new SqlParameter("@id",id)
            };
            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion
        #region checkEmployee
        public int checkEmployee(string Mobile, string Email)
        {
            string cmdText = "checkEmployee";
            SqlParameter[] param = new SqlParameter[2];

            param[0] = new SqlParameter("@Mobile", Mobile);
            param[1] = new SqlParameter("@Email", Email);
            return Convert.ToInt32(new Datafunction().ExecuteQuery(cmdText, param));
        }
        #endregion
        #region SelectEmployeebyLevel
        public DataTable SelectEmployeebyLevel(string levels)
        {

            string cmdText = "Select * from Core_Employee where levels=@levels";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@levels", levels);
                return new Datafunction().FillDt(param, cmdText, "");
           
        }
        #endregion
        #region SelectEmployeeMaxId
        public DataTable SelectEmployeeMaxId()
        {
            string cmdText = "Select max(Id) as id from Core_Employee";
            return new Datafunction().FillDt(cmdText, "");

        }
        #endregion

        #region InsertEmployeeCircle
        public int InsertEmployeeCircle(int id, string CircleName, int EmployeeId)
        {
            string cmdText = "Insert into Core_Employee_Circle(CircleName,EmployeeId) values(@CircleName,@EmployeeId)";
            SqlParameter[] param = new SqlParameter[]
                    {
                         new SqlParameter("@CircleName", CircleName),
                         new SqlParameter("@EmployeeId", EmployeeId),
                       
                    };

            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion
        #region DeleteEmployeeCircle
        public int DeleteEmployeeCircle(int id)
        {
            string cmdText = "Delete from Core_Employee_Circle where Id=@id ";
            SqlParameter[] param = new SqlParameter[] 
            {
                new SqlParameter("@id",id)
            };
            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion
        #region DeleteEmployeeCircleByEmployeeId
        public int DeleteEmployeeCircleByEmployeeId(int id)
        {
            string cmdText = "Delete from Core_Employee_Circle where EmployeeId=@id ";
            SqlParameter[] param = new SqlParameter[] 
            {
                new SqlParameter("@id",id)
            };
            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion
        #region SelectEmployeeCircle
        public DataTable SelectEmployeeCircle(int id)
        {
            if (id == 0)
            {
                string cmdText = "Select * from Core_Employee_Circle ORDER BY Id DESC";
                return new Datafunction().FillDt(cmdText, "");
            }
            else
            {
                string cmdText = "Select * from Core_Employee_Circle where Id=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
            }
        }
        #endregion
        #region SelectEmployeeCirclebyEmployeeId
        public DataTable SelectEmployeeCirclebyEmployeeId(int id)
        {

            string cmdText = "Select * from Core_Employee_Circle where EmployeeId=@id";
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", id);
            return new Datafunction().FillDt(param, cmdText, "");

        }
        #endregion
       
        #region InsertUpdatePartner
        public int InsertUpdatePartner(int id, int Mode, string name, string Mobile, string Email, string City, string State, string Address, string Password, string role, string UserId)
        {
            if (Mode == 0)
            {
                string cmdText = "Insert into Core_Partner(PartnerName,Mobile,Email,City,State,Address,Password,role,UserId) values(@name,@Mobile,@Email,@City,@State,@Address,@Password,@role,@UserId)";
                SqlParameter[] param = new SqlParameter[]
                    {
                         new SqlParameter("@name", name),
                         new SqlParameter("@Mobile", Mobile),
                         new SqlParameter("@Email", Email),
                         new SqlParameter("@City", City),
                         new SqlParameter("@State", State),
                         new SqlParameter("@Address", Address),
                         new SqlParameter("@Password", Password),
                         new SqlParameter("@role", role),
                         new SqlParameter("@UserId", UserId),
                         
                    };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }
            else
            {
                string cmdText = "Update Core_Partner set PartnerName=@name,Mobile=@Mobile,Email=@Email,City=@City,State=@State,Address=@Address,Password=@Password,role=@role,UserId=@UserId where Id=@id";
                SqlParameter[] param = new SqlParameter[]
                {                   
                     new SqlParameter("@name", name), 
                      new SqlParameter("@Mobile", Mobile),
                      new SqlParameter("@Email", Email),
                      new SqlParameter("@City", City),
                      new SqlParameter("@State", State),
                      new SqlParameter("@Address", Address),
                      new SqlParameter("@Password", Password),
                      new SqlParameter("@role", role),
                      new SqlParameter("@UserId", UserId),
                     new SqlParameter("@id",id)    
                };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }

        }
        #endregion
        #region SelectPartner
        public DataTable SelectPartner(int id)
        {
            if (id == 0)
            {
                string cmdText = "Select * from Core_Partner ORDER BY Id DESC";
                return new Datafunction().FillDt(cmdText, "");
            }
            else
            {
                string cmdText = "Select * from Core_Partner where Id=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
            }
        }
        #endregion
        #region DeletePartner
        public int DeletePartner(int id)
        {
            string cmdText = "Delete from Core_Partner where Id=@id ";
            SqlParameter[] param = new SqlParameter[] 
            {
                new SqlParameter("@id",id)
            };
            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion
        #region checkPartner
        public int checkPartner(string Mobile, string Email)
        {
            string cmdText = "checkPartner";
            SqlParameter[] param = new SqlParameter[2];

            param[0] = new SqlParameter("@Mobile", Mobile);
            param[1] = new SqlParameter("@Email", Email);
            return Convert.ToInt32(new Datafunction().ExecuteQuery(cmdText, param));
        }
        #endregion

        #region InsertUpdateVehicleType
        public int InsertUpdateVehicleType(int id, int Mode, string name)
        {
            if (Mode == 0)
            {
                string cmdText = "Insert into Core_VehicleType(Type) values(@name)";
                SqlParameter[] param = new SqlParameter[]
                    {
                         new SqlParameter("@name", name),
                         
                    };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }
            else
            {
                string cmdText = "Update Core_VehicleType set Type=@name where Id=@id";
                SqlParameter[] param = new SqlParameter[]
                {                   
                     new SqlParameter("@name", name),  
                     new SqlParameter("@id",id)    
                };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }

        }
        #endregion
        #region SelectVehicleType
        public DataTable SelectVehicleType(int id)
        {
            if (id == 0)
            {
                string cmdText = "Select * from Core_VehicleType ORDER BY Id DESC";
                return new Datafunction().FillDt(cmdText, "");
            }
            else
            {
                string cmdText = "Select * from Core_VehicleType where Id=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
            }
        }
        #endregion
        #region DeleteVehicleType
        public int DeleteVehicleType(int id)
        {
            string cmdText = "Delete from Core_VehicleType where Id=@id ";
            SqlParameter[] param = new SqlParameter[] 
            {
                new SqlParameter("@id",id)
            };
            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion

        #region InsertUpdateLoadRequest
        public int InsertUpdateLoadRequest(int id, int Mode, string FromState, string ToState, int VehicleTypeId, string Tops, string Weight, string Freight, string Comments, string status, int ClientId, string Circle, string postBy, string Name, string Mobile)
        {
            if (Mode == 0)
            {
                string cmdText = "Insert into Core_LoadRequest(FromState,ToState,VehicleTypeId,Tops,Weight,Freight,Comments,status,ClientId,Circle,postBy,Name,Mobile) values(@FromState,@ToState,@VehicleTypeId,@Tops,@Weight,@Freight,@Comments,@status,@ClientId,@Circle,@postBy,@Name,@Mobile)";
                SqlParameter[] param = new SqlParameter[]
                    {
                         new SqlParameter("@FromState", FromState),
                         new SqlParameter("@ToState", ToState),
                         new SqlParameter("@VehicleTypeId", VehicleTypeId),
                         new SqlParameter("@Tops", Tops),
                         new SqlParameter("@Weight", Weight),
                         new SqlParameter("@Freight", Freight),
                         new SqlParameter("@Comments", Comments),
                         new SqlParameter("@status", status),
                         new SqlParameter("@ClientId", ClientId),
                         new SqlParameter("@Circle", Circle),
                         new SqlParameter("@postBy", postBy),
                         new SqlParameter("@Name", Name),
                         new SqlParameter("@Mobile", Mobile),
                    };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }
            else
            {
                string cmdText = "Update Core_LoadRequest set FromState=@FromState,ToState=@ToState,VehicleTypeId=@VehicleTypeId,Tops=@Tops,Weight=@Weight,Freight=@Freight,Comments=@Comments,status=@status,ClientId=@ClientId,Circle=@Circle,postBy=@postBy,Name=@Name,Mobile=@Mobile,date=@date where Id=@id";
                SqlParameter[] param = new SqlParameter[]
                {                   
                         new SqlParameter("@FromState", FromState),
                         new SqlParameter("@ToState", ToState),
                         new SqlParameter("@VehicleTypeId", VehicleTypeId),
                         new SqlParameter("@Tops", Tops),
                         new SqlParameter("@Weight", Weight),
                         new SqlParameter("@Freight", Freight),
                         new SqlParameter("@Comments", Comments),
                         new SqlParameter("@status", status),
                         new SqlParameter("@ClientId", ClientId),
                         new SqlParameter("@Circle", Circle),
                          new SqlParameter("@postBy", postBy),
                         new SqlParameter("@Name", Name),
                         new SqlParameter("@Mobile", Mobile),
                         new SqlParameter("@id",id),
                         new SqlParameter("@date", DateTime.Now),
                };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }

        }
        #endregion
        #region SelectLoadRequest
        public DataTable SelectLoadRequest(int id)
        {
            if (id == 0)
            {
                string cmdText = "Select * from Core_LoadRequest left outer join Core_VehicleType on Core_VehicleType.Id=Core_LoadRequest.VehicleTypeId left outer join Core_client on Core_client.Id=Core_LoadRequest.ClientId";
                return new Datafunction().FillDt(cmdText, "");
            }
            else
            {
                string cmdText = "Select * from Core_LoadRequest where Id=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
            }
        }
        #endregion
        #region SelectLoadRequestbyClientId
        public DataTable SelectLoadRequestbyClientId(int id)
        {

            string cmdText = "Select * from Core_LoadRequest  left outer join Core_VehicleType on Core_VehicleType.Id=Core_LoadRequest.VehicleTypeId where Core_LoadRequest.ClientId=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
           
        }
        #endregion
        #region SelectLoadRequestbyCircle
        public DataTable SelectLoadRequestbyCircle(int id)
        {

            string cmdText = "Select * from Core_LoadRequest inner join Core_Employee_Circle on Core_Employee_Circle.CircleName=Core_LoadRequest.Circle left outer join Core_VehicleType on Core_VehicleType.Id=Core_LoadRequest.VehicleTypeId left outer join Core_client on Core_client.Id=Core_LoadRequest.ClientId where Core_Employee_Circle.EmployeeId=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
          
        }
        #endregion
        #region SelectLoadRequestbyCircleToday
        public DataTable SelectLoadRequestbyCircleToday(int id,string Today)
        {
            if (id == 0)
            {
                string cmdText = "Select * from Core_LoadRequest  left outer join Core_VehicleType on Core_VehicleType.Id=Core_LoadRequest.VehicleTypeId left outer join Core_client on Core_client.Id=Core_LoadRequest.ClientId where  CAST( Core_LoadRequest.date AS DATE)=@Today";
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@id", id);
                param[1] = new SqlParameter("@Today", Today);
                return new Datafunction().FillDt(param, cmdText, "");
            }
            else
            {
                string cmdText = "Select * from Core_LoadRequest inner join Core_Employee_Circle on Core_Employee_Circle.CircleName=Core_LoadRequest.Circle left outer join Core_VehicleType on Core_VehicleType.Id=Core_LoadRequest.VehicleTypeId left outer join Core_client on Core_client.Id=Core_LoadRequest.ClientId where Core_Employee_Circle.EmployeeId=@id and CAST( Core_LoadRequest.date AS DATE)=@Today";
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@id", id);
                param[1] = new SqlParameter("@Today", Today);
                return new Datafunction().FillDt(param, cmdText, "");
            }

        }
        #endregion
        #region DeleteLoadRequest
        public int DeleteLoadRequest(int id)
        {
            string cmdText = "Delete from Core_LoadRequest where Id=@id ";
            SqlParameter[] param = new SqlParameter[] 
            {
                new SqlParameter("@id",id)
            };
            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion

        #region InsertUpdateVehicleRequest
        public int InsertUpdateVehicleRequest(int id, int Mode, string FromState, string ToState, int VehicleTypeId, string Tops, string Weight, string Freight, string Comments, string status, int PartnerId, string Circle, string postBy, string Name, string Mobile)
        {
            if (Mode == 0)
            {
                string cmdText = "Insert into Core_VehicleRequest(FromState,ToState,VehicleTypeId,Tops,Weight,Freight,Comments,status,PartnerId,Circle,postBy,Name,Mobile,date)values(@FromState,@ToState,@VehicleTypeId,@Tops,@Weight,@Freight,@Comments,@status,@PartnerId,@Circle,@postBy,@Name,@Mobile,@date)";
                SqlParameter[] param = new SqlParameter[]
                    {
                         new SqlParameter("@FromState", FromState),
                         new SqlParameter("@ToState", ToState),
                         new SqlParameter("@VehicleTypeId", VehicleTypeId),
                         new SqlParameter("@Tops", Tops),
                         new SqlParameter("@Weight", Weight),
                         new SqlParameter("@Freight", Freight),
                         new SqlParameter("@Comments", Comments),
                         //new SqlParameter("@Comments", Comments),
                         new SqlParameter("@status", status),
                         new SqlParameter("@PartnerId", PartnerId),
                         new SqlParameter("@Circle", Circle),
                         new SqlParameter("@postBy", postBy),
                         new SqlParameter("@Name", Name),
                         new SqlParameter("@Mobile", Mobile),
                         new SqlParameter("@date", DateTime.Now),
                    };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }
            else
            {
                string cmdText = "Update Core_VehicleRequest set FromState=@FromState,ToState=@ToState,VehicleTypeId=@VehicleTypeId,Tops=@Tops,Weight=@Weight,Freight=@Freight,Comments=@Comments,status=@status,PartnerId=@PartnerId,Circle=@Circle,postBy=@postBy,Name=@Name,Mobile=@Mobile where Id=@id";
                SqlParameter[] param = new SqlParameter[]
                {                   
                      new SqlParameter("@FromState", FromState),
                         new SqlParameter("@ToState", ToState),
                         new SqlParameter("@VehicleTypeId", VehicleTypeId),
                         new SqlParameter("@Tops", Tops),
                         new SqlParameter("@Weight", Weight),
                         new SqlParameter("@Freight", Freight),
                         new SqlParameter("@Comments", Comments),
                         new SqlParameter("@status", status),
                         new SqlParameter("@PartnerId", PartnerId),
                         new SqlParameter("@Circle", Circle),
                         new SqlParameter("@postBy", postBy),
                         new SqlParameter("@Name", Name),
                         new SqlParameter("@Mobile", Mobile),
                         new SqlParameter("@id",id)    
                };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }

        }
    #endregion

    public int InsertNewsLetterSubscription(int id, string  Email, bool IsActive)
    {
       
            string cmdText = "Insert into Core_NewsLetterSubscription(Email,IsActive)values(@Email,@IsActive)";
            SqlParameter[] param = new SqlParameter[]
                {
                         
                         new SqlParameter("@Email", Email),
                         new SqlParameter("@IsActive", IsActive)
                       
                };

            return new Datafunction().ExecuteQuery(cmdText, param, "");
       
      

    }

    #region SelectVehicleRequest
    public DataTable SelectVehicleRequest(int id)
        {
            if (id == 0)
            {
                string cmdText = "Select * from Core_VehicleRequest  left outer join Core_VehicleType on Core_VehicleType.Id=Core_VehicleRequest.VehicleTypeId left outer join Core_Partner on Core_Partner.Id=Core_VehicleRequest.PartnerId";
                return new Datafunction().FillDt(cmdText, "");
            }
            else
            {
                string cmdText = "Select * from Core_VehicleRequest where Id=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
            }
        }
        #endregion
        #region SelectVehicleRequestbyPartnerId
        public DataTable SelectVehicleRequestbyPartnerId(int id)
        {
           
                string cmdText = "Select * from Core_VehicleRequest  left outer join Core_VehicleType on Core_VehicleType.Id=Core_VehicleRequest.VehicleTypeId where Core_VehicleRequest.PartnerId=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
          
        }
        #endregion
        #region SelectVehicleRequestbyPartnerIdToday
        public DataTable SelectVehicleRequestbyPartnerIdToday(int id, string Today)
        {

            string cmdText = "Select * from Core_VehicleRequest left outer join Core_states on Core_states.Id=Core_VehicleRequest.FromStateId left outer join Core_VehicleType on Core_VehicleType.Id=Core_VehicleRequest.VehicleTypeId where Core_VehicleRequest.PartnerId=@id and CAST( Core_VehicleRequest.date AS DATE)=@Today";
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@id", id);
            param[1] = new SqlParameter("@Today", Today);
            return new Datafunction().FillDt(param, cmdText, "");

        }
        #endregion
        #region SelectVehicleRequestbyCircle
        public DataTable SelectVehicleRequestbyCircle(int id)
        {

            string cmdText = "Select * from Core_VehicleRequest inner join Core_Employee_Circle on Core_Employee_Circle.CircleName=Core_VehicleRequest.Circle left outer join Core_VehicleType on Core_VehicleType.Id=Core_VehicleRequest.VehicleTypeId left outer join Core_Partner on Core_Partner.Id=Core_VehicleRequest.PartnerId where Core_Employee_Circle.EmployeeId=@id";
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", id);
            return new Datafunction().FillDt(param, cmdText, "");

        }
        #endregion
        #region SelectVehicleRequestbyCircleToday
        public DataTable SelectVehicleRequestbyCircleToday(int id, string Today)
        {
            if (id == 0)
            {
                string cmdText = "Select * from Core_VehicleRequest  left outer join Core_VehicleType on Core_VehicleType.Id=Core_VehicleRequest.VehicleTypeId left outer join Core_Partner on Core_Partner.Id=Core_VehicleRequest.PartnerId where  CAST( Core_VehicleRequest.date AS DATE)=@Today";
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@id", id);
                param[1] = new SqlParameter("@Today", Today);
                return new Datafunction().FillDt(param, cmdText, "");
            }
            else
            {
                string cmdText = "Select * from Core_VehicleRequest inner join Core_Employee_Circle on Core_Employee_Circle.CircleName=Core_VehicleRequest.Circle left outer join Core_VehicleType on Core_VehicleType.Id=Core_VehicleRequest.VehicleTypeId left outer join Core_Partner on Core_Partner.Id=Core_VehicleRequest.PartnerId where Core_Employee_Circle.EmployeeId=@id and CAST( Core_VehicleRequest.date AS DATE)=@Today";
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@id", id);
                param[1] = new SqlParameter("@Today", Today);
                return new Datafunction().FillDt(param, cmdText, "");
            }
        }
        #endregion
        #region DeleteVehicleRequest
        public int DeleteVehicleRequest(int id)
        {
            string cmdText = "Delete from Core_VehicleRequest where Id=@id ";
            SqlParameter[] param = new SqlParameter[] 
            {
                new SqlParameter("@id",id)
            };
            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion

        #region InsertUpdateAskForVehicle
        public int InsertUpdateAskForVehicle(int id, int Mode, string RequestNo, string FromState, string ToState, int VehicleTypeId, string Tops, string Weight, string Freight, string Comments, string status, int PartnerId, string Circle)
        {
            if (Mode == 0)
            {
                string cmdText = "Insert into Core_Ask_for_Vehicle(RequestNo,FromState,ToState,VehicleTypeId,Tops,Weight,Freight,Comments,status,PartnerId,Circle) values(@RequestNo,@FromState,@ToState,@VehicleTypeId,@Tops,@Weight,@Freight,@Comments,@status,@PartnerId,@Circle)";
                SqlParameter[] param = new SqlParameter[]
                    { 
                         new SqlParameter("@RequestNo", RequestNo),
                         new SqlParameter("@FromState", FromState),
                         new SqlParameter("@ToState", ToState),
                         new SqlParameter("@VehicleTypeId", VehicleTypeId),
                         new SqlParameter("@Tops", Tops),
                         new SqlParameter("@Weight", Weight),
                         new SqlParameter("@Freight", Freight),
                         new SqlParameter("@Comments", Comments),
                         new SqlParameter("@status", status),
                         new SqlParameter("@PartnerId", PartnerId),
                         new SqlParameter("@Circle", Circle),
                    };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }
            else
            {
                string cmdText = "Update Core_Ask_for_Vehicle set RequestNo=@RequestNo, FromState=@FromState,ToState=@ToState,VehicleTypeId=@VehicleTypeId,Tops=@Tops,Weight=@Weight,Freight=@Freight,Comments=@Comments,status=@status,PartnerId=@PartnerId,Circle=@Circle where Id=@id";
                SqlParameter[] param = new SqlParameter[]
                {     
                         new SqlParameter("@RequestNo", RequestNo),               
                         new SqlParameter("@FromState", FromState),
                         new SqlParameter("@ToState", ToState),
                         new SqlParameter("@VehicleTypeId", VehicleTypeId),
                         new SqlParameter("@Tops", Tops),
                         new SqlParameter("@Weight", Weight),
                         new SqlParameter("@Freight", Freight),
                         new SqlParameter("@Comments", Comments),
                         new SqlParameter("@status", status),
                         new SqlParameter("@PartnerId", PartnerId),
                         new SqlParameter("@Circle", Circle),
                         new SqlParameter("@id",id)    
                };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }

        }
        #endregion
        #region SelectAskForVehicle
        public DataTable SelectAskForVehicle(int id)
        {
            if (id == 0)
            {
                string cmdText = "Select * from Core_Ask_for_Vehicle  left outer join Core_VehicleType on Core_VehicleType.Id=Core_Ask_for_Vehicle.VehicleTypeId left outer join Core_Partner on Core_Partner.Id=Core_Ask_for_Vehicle.PartnerId";
                return new Datafunction().FillDt(cmdText, "");
            }
            else
            {
                string cmdText = "Select * from Core_Ask_for_Vehicle where Id=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
            }
        }
        #endregion
        #region SelectAskForVehiclebyPartnerId
        public DataTable SelectAskForVehiclebyPartnerId(int id)
        {

            string cmdText = "Select * from Core_Ask_for_Vehicle left outer join Core_VehicleType on Core_VehicleType.Id=Core_Ask_for_Vehicle.VehicleTypeId where Core_Ask_for_Vehicle.PartnerId=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
           
        }
        #endregion
        #region SelectAskForVehiclebyPartnerIdToday
        public DataTable SelectAskForVehiclebyPartnerIdToday(int id, string Today)
        {

            string cmdText = "Select * from Core_Ask_for_Vehicle  left outer join Core_VehicleType on Core_VehicleType.Id=Core_Ask_for_Vehicle.VehicleTypeId where Core_Ask_for_Vehicle.PartnerId=@id and CAST( Core_Ask_for_Vehicle.date AS DATE)=@Today";
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@id", id);
            param[1] = new SqlParameter("@Today", Today);
            return new Datafunction().FillDt(param, cmdText, "");

        }
        #endregion
        #region SelectAskForVehiclebyCircle
        public DataTable SelectAskForVehiclebyCircle(int id)
        {

            string cmdText = "Select * from Core_Ask_for_Vehicle inner join Core_Employee_Circle on Core_Employee_Circle.CircleName=Core_Ask_for_Vehicle.Circle left outer join Core_VehicleType on Core_VehicleType.Id=Core_Ask_for_Vehicle.VehicleTypeId left outer join Core_Partner on Core_Partner.Id=Core_Ask_for_Vehicle.PartnerId where Core_Employee_Circle.EmployeeId=@id";
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", id);
            return new Datafunction().FillDt(param, cmdText, "");

        }
        #endregion
        #region SelectAskForVehicleMaxRequestID
        public DataTable SelectAskForVehicleMaxRequestID()
        {

            string cmdText = "Select max(RequestNo) as RequestNo from Core_Ask_for_Vehicle";
            return new Datafunction().FillDt(cmdText, "");

        }
        #endregion
        #region DeleteAskForVehicle
        public int DeleteAskForVehicle(int id)
        {
            string cmdText = "Delete from Core_Ask_for_Vehicle where Id=@id ";
            SqlParameter[] param = new SqlParameter[] 
            {
                new SqlParameter("@id",id)
            };
            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion

        #region InsertUpdateConsignment
        public int InsertUpdateConsignment(int id, int Mode, string ConsignementID, string Date, string SRNNo, int ConsignerId, string Address1, 
            string Contact1, string ConsigneeName, string Address2, string Contact2, string LR, string MaterialType, string Remark,
            string WayBill1, string WayBill2, string WayBill3, string WayBill4, string DateofLoading, string DateofDeliver, 
            decimal FreightAmount, decimal AdvanceFreight, decimal Loading, decimal Unloading, decimal Others,
            decimal ExtraAmount, decimal TotalAmount, string ContactNo1, string ContactNo2, string ContactNo3,
            string ContactNo4, string ContactNo5, string Status, string Circle, string VehicleNo, int VehicleTypeId,
            string Weight, string MINno, string OGPno, string Blank1, string Blank2)
        {
            if (Mode == 0)
            {
                string cmdText = "Insert into Core_Consignment(ConsignementID,Date,SRNNo,ConsignerId,Address1,Contact1,ConsigneeName,Address2,Contact2,LR,MaterialType,Remark,WayBill1,WayBill2,WayBill3,WayBill4,DateofLoading,DateofDeliver,FreightAmount,AdvanceFreight,Loading,Unloading,Others,ExtraAmount,TotalAmount,ContactNo1,ContactNo2,ContactNo3,ContactNo4,ContactNo5,Status,Circle,VehicleNo,VehicleTypeId,Weight,MINno,OGPno,Blank1,Blank2) values(@ConsignementID,@Date,@SRNNo,@ConsignerId,@Address1,@Contact1,@ConsigneeName,@Address2,@Contact2,@LR,@MaterialType,@Remark,@WayBill1,@WayBill2,@WayBill3,@WayBill4,@DateofLoading,@DateofDeliver,@FreightAmount,@AdvanceFreight,@Loading,@Unloading,@Others,@ExtraAmount,@TotalAmount,@ContactNo1,@ContactNo2,@ContactNo3,@ContactNo4,@ContactNo5,@Status,@Circle,@VehicleNo,@VehicleTypeId,@Weight,@MINno,@OGPno,@Blank1,@Blank2)";
                SqlParameter[] param = new SqlParameter[]
                    { 
                         new SqlParameter("@ConsignementID", ConsignementID),
                         new SqlParameter("@Date", Date),
                         new SqlParameter("@SRNNo", SRNNo),
                         new SqlParameter("@ConsignerId", ConsignerId),
                         new SqlParameter("@Address1", Address1),
                         new SqlParameter("@ConsigneeName", ConsigneeName),
                         new SqlParameter("@Address2", Address2),
                         new SqlParameter("@Contact1", Contact1),
                         new SqlParameter("@Contact2", Contact2),
                         new SqlParameter("@LR", LR),
                         new SqlParameter("@MaterialType", MaterialType),
                         new SqlParameter("@Remark", Remark),
                         new SqlParameter("@WayBill1", WayBill1),
                         new SqlParameter("@WayBill2", WayBill2),
                         new SqlParameter("@WayBill3", WayBill3),
                         new SqlParameter("@WayBill4", WayBill4),
                         new SqlParameter("@DateofLoading", DateofLoading),
                         new SqlParameter("@DateofDeliver", DateofDeliver),
                         new SqlParameter("@FreightAmount", FreightAmount),
                         new SqlParameter("@AdvanceFreight", AdvanceFreight),
                         new SqlParameter("@Loading", Loading),
                         new SqlParameter("@Unloading", Unloading),
                         new SqlParameter("@Others", Others),
                         new SqlParameter("@ExtraAmount", ExtraAmount),
                         new SqlParameter("@TotalAmount", TotalAmount),
                         new SqlParameter("@ContactNo1", ContactNo1),
                         new SqlParameter("@ContactNo2", ContactNo2),
                         new SqlParameter("@ContactNo3", ContactNo3),
                         new SqlParameter("@ContactNo4", ContactNo4),
                         new SqlParameter("@ContactNo5", ContactNo5),
                         new SqlParameter("@Status", Status),
                         new SqlParameter("@Circle", Circle),

                         new SqlParameter("@VehicleNo", VehicleNo),
                         new SqlParameter("@VehicleTypeId", VehicleTypeId),
                         new SqlParameter("@Weight", Weight),
                         new SqlParameter("@MINno", MINno),
                         new SqlParameter("@OGPno", OGPno),
                         new SqlParameter("@Blank1", Blank1),
                         new SqlParameter("@Blank2", Blank2),
                    };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }
            else
            {
                string cmdText = "Update Core_Consignment set ConsignementID=@ConsignementID, Date=@Date,SRNNo=@SRNNo,ConsignerId=@ConsignerId,Address1=@Address1,Contact1=@Contact1,ConsigneeName=@ConsigneeName,Address2=@Address2,Contact2=@Contact2,LR=@LR,MaterialType=@MaterialType,Remark=@Remark,WayBill1=@WayBill1,WayBill2=@WayBill2,WayBill3=@WayBill3,WayBill4=@WayBill4,DateofLoading=@DateofLoading,DateofDeliver=@DateofDeliver,FreightAmount=@FreightAmount,AdvanceFreight=@AdvanceFreight,Loading=@Loading,Unloading=@Unloading,Others=@Others,ExtraAmount=@ExtraAmount,TotalAmount=@TotalAmount,ContactNo1=@ContactNo1,ContactNo2=@ContactNo2,ContactNo3=@ContactNo3,ContactNo4=@ContactNo4,ContactNo5=@ContactNo5,Status=@Status,Circle=@Circle,VehicleNo=@VehicleNo,VehicleTypeId=@VehicleTypeId,Weight=@Weight,MINno=@MINno,OGPno=@OGPno,Blank1=@Blank1,Blank2=@Blank2 where Id=@id";
                SqlParameter[] param = new SqlParameter[]
                {     
                         new SqlParameter("@ConsignementID", ConsignementID),
                         new SqlParameter("@Date", Date),
                         new SqlParameter("@SRNNo", SRNNo),
                         new SqlParameter("@ConsignerId", ConsignerId),
                         new SqlParameter("@Address1", Address1),
                         new SqlParameter("@ConsigneeName", ConsigneeName),
                         new SqlParameter("@Address2", Address2),
                         new SqlParameter("@Contact1", Contact1),
                         new SqlParameter("@Contact2", Contact2),
                         new SqlParameter("@LR", LR),
                         new SqlParameter("@MaterialType", MaterialType),
                         new SqlParameter("@Remark", Remark),
                         new SqlParameter("@WayBill1", WayBill1),
                         new SqlParameter("@WayBill2", WayBill2),
                         new SqlParameter("@WayBill3", WayBill3),
                         new SqlParameter("@WayBill4", WayBill4),
                         new SqlParameter("@DateofLoading", DateofLoading),
                         new SqlParameter("@DateofDeliver", DateofDeliver),
                         new SqlParameter("@FreightAmount", FreightAmount),
                         new SqlParameter("@AdvanceFreight", AdvanceFreight),
                         new SqlParameter("@Loading", Loading),
                         new SqlParameter("@Unloading", Unloading),
                         new SqlParameter("@Others", Others),
                         new SqlParameter("@ExtraAmount", ExtraAmount),
                         new SqlParameter("@TotalAmount", TotalAmount),
                         new SqlParameter("@ContactNo1", ContactNo1),
                         new SqlParameter("@ContactNo2", ContactNo2),
                         new SqlParameter("@ContactNo3", ContactNo3),
                         new SqlParameter("@ContactNo4", ContactNo4),
                         new SqlParameter("@ContactNo5", ContactNo5),
                         new SqlParameter("@Status", Status),
                         new SqlParameter("@Circle", Circle),

                         new SqlParameter("@VehicleNo", VehicleNo),
                         new SqlParameter("@VehicleTypeId", VehicleTypeId),
                         new SqlParameter("@Weight", Weight),
                         new SqlParameter("@MINno", MINno),
                         new SqlParameter("@OGPno", OGPno),
                         new SqlParameter("@Blank1", Blank1),
                         new SqlParameter("@Blank2", Blank2),
                         new SqlParameter("@id",id)    
                };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }

        }
        #endregion
        #region SelectConsignment
        public DataTable SelectConsignment(int id)
        {
            if (id == 0)
            {
                string cmdText = "Select * from Core_Consignment left outer join Core_states on Core_states.Id=Core_Consignment.ConsignerId";
                return new Datafunction().FillDt(cmdText, "");
            }
            else
            {
                string cmdText = "Select * from Core_Consignment where Id=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
            }
        }

    public DataTable SelectConsignment1(int id)
    {
        if (id == 0)
        {
            string cmdText = "Select cc.Id, cc.ConsignementID, cc.Date, cc.SRNNo, cc.ConsignerId, cc.Address1,cc.Contact1,cc.ConsigneeName, cc.Address2, cc.Contact2, cc.LR, cc.MaterialType, cc.Remark, cc.WayBill1, cc.WayBill2,cc.WayBill3, cc.WayBill4, cc.DateofLoading, cc.DateofDeliver, cc.FreightAmount, cc.AdvanceFreight,	cc.Loading, cc.Unloading, cc.Others, cc.ExtraAmount, cc.TotalAmount, cc.ContactNo1, cc.ContactNo2, cc.ContactNo3,cc.ContactNo4, cc.ContactNo5, cc.Status, cc.Circle, cc.VehicleNo, cc.Weight,	cc.MINno, cc.OGPno, cc.Blank1, cc.Blank2, cs.stateName as ConsignerName, ct.Type as VehicleType from Core_Consignment cc left  join Core_states cs on cs.Id = cc.ConsignerId left join Core_VehicleType ct on ct.id = cc.VehicleTypeId";
            return new Datafunction().FillDt(cmdText, "");
        }
        else
        {
            string cmdText = "Select cc.Id, cc.ConsignementID, cc.Date, cc.SRNNo, cc.ConsignerId, cc.Address1,cc.Contact1,cc.ConsigneeName, cc.Address2, cc.Contact2, cc.LR, cc.MaterialType, cc.Remark, cc.WayBill1, cc.WayBill2,cc.WayBill3, cc.WayBill4, cc.DateofLoading, cc.DateofDeliver, cc.FreightAmount, cc.AdvanceFreight,	cc.Loading, cc.Unloading, cc.Others, cc.ExtraAmount, cc.TotalAmount, cc.ContactNo1, cc.ContactNo2, cc.ContactNo3,cc.ContactNo4, cc.ContactNo5, cc.Status, cc.Circle, cc.VehicleNo, cc.Weight,	cc.MINno, cc.OGPno, cc.Blank1, cc.Blank2, cs.stateName as ConsignerName, ct.Type as VehicleType from Core_Consignment cc left  join Core_states cs on cs.Id = cc.ConsignerId left join Core_VehicleType ct on ct.id = cc.VehicleTypeId where cc.Id=@id";
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", id);
            return new Datafunction().FillDt(param, cmdText, "");
        }
    }


    public DataTable SelectSewsLetter()
    {
        
            string cmdText = "Select  * from Core_NewsLetterSubscription";
            return new Datafunction().FillDt(cmdText, "");
        
    }

    public DataTable SelectNewsLetterEmails()
    {
        string cmdText = "select(Select ST1.Email + ',' From Core_NewsLetterSubscription ST1 For XML PATH(''))[Email]";
        //string cmdText = "Select  Email from Core_NewsLetterSubscription";
        return new Datafunction().FillDt(cmdText, "");

    }


    #endregion
    #region SelectConsignmentbyCircle
    public DataTable SelectConsignmentbyCircle(int id)
        {

            string cmdText = "Select * from Core_Consignment inner join Core_Employee_Circle on Core_Employee_Circle.CircleName=Core_Consignment.Circle left outer join Core_states on Core_states.Id=Core_Consignment.ConsignerId where Core_Employee_Circle.EmployeeId=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
         
        }
    public DataTable SelectConsignmentbyCircle1(int id)
    {

        string cmdText = "Select cc.Id, cc.ConsignementID, cc.Date, cc.SRNNo, cc.ConsignerId, cc.Address1,cc.Contact1,cc.ConsigneeName, cc.Address2, cc.Contact2, cc.LR, cc.MaterialType, cc.Remark, cc.WayBill1, cc.WayBill2,cc.WayBill3, cc.WayBill4, cc.DateofLoading, cc.DateofDeliver, cc.FreightAmount, cc.AdvanceFreight,	cc.Loading, cc.Unloading, cc.Others, cc.ExtraAmount, cc.TotalAmount, cc.ContactNo1, cc.ContactNo2, cc.ContactNo3,cc.ContactNo4, cc.ContactNo5, cc.Status, cc.Circle, cc.VehicleNo, cc.Weight,	cc.MINno, cc.OGPno, cc.Blank1, cc.Blank2, cs.stateName as ConsignerName, ct.Type as VehicleType from Core_Consignment cc left  join Core_states cs on cs.Id = cc.ConsignerId left join Core_VehicleType ct on ct.id = cc.VehicleTypeId left join Core_Employee_Circle on Core_Employee_Circle.CircleName=cc.Circle where Core_Employee_Circle.EmployeeId=@id";
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@id", id);
        return new Datafunction().FillDt(param, cmdText, "");

    }
    #endregion
    #region SelectConsignmentbyToday
    public DataTable SelectConsignmentbyToday(string date)
        {

            string cmdText = "Select * from Core_Consignment  where Core_Consignment.Date=@date";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@date", date);
           
                return new Datafunction().FillDt(param, cmdText, "");
           
        }
        #endregion
        #region SelectConsignmentbyTodayAndCircle
        public DataTable SelectConsignmentbyTodayAndCircle(string date,int id)
        {

            string cmdText = "Select * from Core_Consignment  inner join Core_Employee_Circle on Core_Employee_Circle.CircleName=Core_Consignment.Circle left outer join Core_states on Core_states.Id=Core_Consignment.ConsignerId where Core_Consignment.Date=@date and Core_Employee_Circle.EmployeeId=@id";
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@date", date);
            param[1] = new SqlParameter("@id", id);
            return new Datafunction().FillDt(param, cmdText, "");

        }
        #endregion

        #region DeleteConsignment
        public int DeleteConsignment(int id)
        {
            string cmdText = "Delete from Core_Consignment where Id=@id ";
            SqlParameter[] param = new SqlParameter[] 
            {
                new SqlParameter("@id",id)
            };
            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion
        #region SelectConsignmentbyStatus
        public DataTable SelectConsignmentbyStatus(string Status)
        {

            string cmdText = "Select * from Core_Consignment where Status=@Status";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@Status", Status);
                return new Datafunction().FillDt(param, cmdText, "");
           
        }
        #endregion
        #region SelectConsignmentbyStatusAndCircle
        public DataTable SelectConsignmentbyStatusAndCircle(string Status, int id)
        {

            string cmdText = "Select * from Core_Consignment inner join Core_Employee_Circle on Core_Employee_Circle.CircleName=Core_Consignment.Circle where Core_Consignment.Status=@Status and Core_Employee_Circle.EmployeeId=@id";
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@Status", Status);
            param[1] = new SqlParameter("@id", id);
            return new Datafunction().FillDt(param, cmdText, "");

        }
        #endregion
        #region SelectConsignmentMaxConsignementID
        public DataTable SelectConsignmentMaxConsignementID()
        {

            string cmdText = "Select max(ConsignementID) as ConsignementID from Core_Consignment";
            return new Datafunction().FillDt(cmdText, "");

        }
        #endregion
        #region SelectConsignmentMaxSRNNo
        public DataTable SelectConsignmentMaxSRNNo()
        {

            string cmdText = "Select max(SRNNo) as SRNNo from Core_Consignment";
            return new Datafunction().FillDt(cmdText, "");

        }
        #endregion

        #region SelectConsignmentByDateofLoading
        public DataTable SelectConsignmentByDateofLoading(String ToDate,String FromDate)
        {
            string cmdText = "Select * from Core_Consignment left outer join Core_states on Core_states.Id=Core_Consignment.ConsignerId where DateofLoading between @ToDate and @FromDate";
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@ToDate", ToDate);
            param[1] = new SqlParameter("@FromDate", FromDate);
            return new Datafunction().FillDt(param, cmdText, "");

        }
        public DataTable SelectConsignmentByDateofLoading1(String ToDate, String FromDate)
        {
            string cmdText = "Select cc.Id, cc.ConsignementID, cc.Date, cc.SRNNo, cc.ConsignerId, cc.Address1,cc.Contact1,cc.ConsigneeName, cc.Address2, cc.Contact2, cc.LR, cc.MaterialType, cc.Remark, cc.WayBill1, cc.WayBill2,cc.WayBill3, cc.WayBill4, cc.DateofLoading, cc.DateofDeliver, cc.FreightAmount, cc.AdvanceFreight,	cc.Loading, cc.Unloading, cc.Others, cc.ExtraAmount, cc.TotalAmount, cc.ContactNo1, cc.ContactNo2, cc.ContactNo3,cc.ContactNo4, cc.ContactNo5, cc.Status, cc.Circle, cc.VehicleNo, cc.Weight,	cc.MINno, cc.OGPno, cc.Blank1, cc.Blank2, cs.stateName as ConsignerName, ct.Type as VehicleType from Core_Consignment cc left outer join Core_states cs on cs.Id = cc.ConsignerId join Core_VehicleType ct on ct.id = cc.VehicleTypeId where cc.DateofLoading between @ToDate and @FromDate";
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@ToDate", ToDate);
            param[1] = new SqlParameter("@FromDate", FromDate);
            return new Datafunction().FillDt(param, cmdText, "");

        }
    #endregion
    #region SelectConsignmentByDateofDeliver
    public DataTable SelectConsignmentByDateofDeliver(String ToDate, String FromDate)
        {
            string cmdText = "Select * from Core_Consignment left outer join Core_states on Core_states.Id=Core_Consignment.ConsignerId where DateofDeliver between @ToDate and @FromDate";
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@ToDate", ToDate);
            param[1] = new SqlParameter("@FromDate", FromDate);
            return new Datafunction().FillDt(param, cmdText, "");

        }

    public DataTable SelectConsignmentByDateofDeliver1(String ToDate, String FromDate)
    {
        string cmdText = "Select cc.Id, cc.ConsignementID, cc.Date, cc.SRNNo, cc.ConsignerId, cc.Address1,cc.Contact1,cc.ConsigneeName, cc.Address2, cc.Contact2, cc.LR, cc.MaterialType, cc.Remark, cc.WayBill1, cc.WayBill2,cc.WayBill3, cc.WayBill4, cc.DateofLoading, cc.DateofDeliver, cc.FreightAmount, cc.AdvanceFreight,	cc.Loading, cc.Unloading, cc.Others, cc.ExtraAmount, cc.TotalAmount, cc.ContactNo1, cc.ContactNo2, cc.ContactNo3,cc.ContactNo4, cc.ContactNo5, cc.Status, cc.Circle, cc.VehicleNo, cc.Weight,	cc.MINno, cc.OGPno, cc.Blank1, cc.Blank2, cs.stateName as ConsignerName, ct.Type as VehicleType from Core_Consignment cc left outer join Core_states cs on cs.Id = cc.ConsignerId join Core_VehicleType ct on ct.id = cc.VehicleTypeId where cc.DateofDeliver between @ToDate and @FromDate";
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@ToDate", ToDate);
        param[1] = new SqlParameter("@FromDate", FromDate);
        return new Datafunction().FillDt(param, cmdText, "");

    }
    #endregion
    #region SelectConsignmentByConsignementID
    public DataTable SelectConsignmentByConsignementID(String ID)
        {
            string cmdText = "Select * from Core_Consignment left outer join Core_DeliveryPerforma on Core_DeliveryPerforma.ConsignementId=Core_Consignment.ConsignementID left outer join Core_states on Core_states.Id=Core_Consignment.ConsignerId where Core_Consignment.id=@ID";
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@ID", ID);
            return new Datafunction().FillDt(param, cmdText, "");

        }
    public DataTable SelectConsignmentByConsignementID1(String ID)
    {
        string cmdText = "Select * from Core_Consignment left outer join Core_DeliveryPerforma on Core_DeliveryPerforma.ConsignementId=Core_Consignment.ConsignementID left outer join Core_states on Core_states.Id=Core_Consignment.ConsignerId where Core_Consignment.ConsignementID=@ID";
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@ID", ID);
       
        return new Datafunction().FillDt(param, cmdText, "");

    }
    public DataTable SelectdeliveryperformaByConsignementID(String ID)
    {
        string cmdText = "select * from  Core_DeliveryPerforma where ConsignementID=@ID";
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@ID", ID);

        return new Datafunction().FillDt(param, cmdText, "");

    }
    public DataTable SelectConsignmentByConsignementID3(String ID)
    {
        string cmdText = "Select cc.Id, cc.ConsignementID, cc.Date, cc.SRNNo, cc.ConsignerId, cc.Address1,cc.Contact1,cc.ConsigneeName, cc.Address2, cc.Contact2, cc.LR, cc.MaterialType, cc.Remark, cc.WayBill1, cc.WayBill2,cc.WayBill3, cc.WayBill4, cc.DateofLoading, cc.DateofDeliver, cc.FreightAmount, cc.AdvanceFreight,	cc.Loading, cc.Unloading, cc.Others, cc.ExtraAmount, cc.TotalAmount, cc.ContactNo1, cc.ContactNo2, cc.ContactNo3,cc.ContactNo4, cc.ContactNo5, cc.Status, cc.Circle, cc.VehicleNo, cc.Weight,	cc.MINno, cc.OGPno, cc.Blank1, cc.Blank2, cs.stateName as ConsignerName, ct.Type as VehicleType from Core_Consignment cc left outer join Core_states cs on cs.Id = cc.ConsignerId join Core_VehicleType ct on ct.id = cc.VehicleTypeId where cc.ConsignementID=@ID";
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@ID", ID);

        return new Datafunction().FillDt(param, cmdText, "");

    }
    #endregion
    #region SelectConsignmentBySRNNo
    public DataTable SelectConsignmentBySRNNo(String ID)
        {
            string cmdText = "Select * from Core_Consignment left outer join Core_states on Core_states.Id=Core_Consignment.ConsignerId where SRNNo=@ID";
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@ID", ID);
            return new Datafunction().FillDt(param, cmdText, "");

        }
    public DataTable SelectConsignmentBySRNNo1(String ID)
    {
        string cmdText = "Select cc.Id, cc.ConsignementID, cc.Date, cc.SRNNo, cc.ConsignerId, cc.Address1,cc.Contact1,cc.ConsigneeName, cc.Address2, cc.Contact2, cc.LR, cc.MaterialType, cc.Remark, cc.WayBill1, cc.WayBill2,cc.WayBill3, cc.WayBill4, cc.DateofLoading, cc.DateofDeliver, cc.FreightAmount, cc.AdvanceFreight,	cc.Loading, cc.Unloading, cc.Others, cc.ExtraAmount, cc.TotalAmount, cc.ContactNo1, cc.ContactNo2, cc.ContactNo3,cc.ContactNo4, cc.ContactNo5, cc.Status, cc.Circle, cc.VehicleNo, cc.Weight,	cc.MINno, cc.OGPno, cc.Blank1, cc.Blank2, cs.stateName as ConsignerName, ct.Type as VehicleType from Core_Consignment cc left outer join Core_states cs on cs.Id = cc.ConsignerId join Core_VehicleType ct on ct.id = cc.VehicleTypeId where cc.SRNNo=@ID";
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@ID", ID);
        return new Datafunction().FillDt(param, cmdText, "");

    }
    #endregion

    #region InsertUpdateInvoice
    public int InsertUpdateInvoice(int id, int Mode, string SRNNo, string City, int ConsignerId, string InvoicePeriod, decimal InvoiceAmount, string Status, int PartnerId, string DateOfReview, string RejectionRemark)
        {
            if (Mode == 0)
            {
                string cmdText = "Insert into Core_Invoice(SRNNo,City,ConsignerId,InvoicePeriod,InvoiceAmount,Status,PartnerId,DateOfReview,RejectionRemark) values(@SRNNo,@City,@ConsignerId,@InvoicePeriod,@InvoiceAmount,@Status,@PartnerId,@DateOfReview,@RejectionRemark)";
                SqlParameter[] param = new SqlParameter[]
                    {
                        
                         new SqlParameter("@SRNNo", SRNNo),
                         new SqlParameter("@City", City),
                         new SqlParameter("@ConsignerId", ConsignerId),
                         new SqlParameter("@InvoicePeriod", InvoicePeriod),
                         new SqlParameter("@InvoiceAmount", InvoiceAmount),
                         new SqlParameter("@Status", Status),
                         new SqlParameter("@PartnerId", PartnerId),
                         new SqlParameter("@RejectionRemark", RejectionRemark),
                         new SqlParameter("@DateOfReview", DateOfReview),
                    };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }
            else
            {
                string cmdText = "Update Core_Invoice set City=@City,SRNNo=@SRNNo,ConsignerId=@ConsignerId,InvoicePeriod=@InvoicePeriod,InvoiceAmount=@InvoiceAmount,Status=@Status,PartnerId=@PartnerId,RejectionRemark=@RejectionRemark,DateOfReview=@DateOfReview where Id=@id";
                SqlParameter[] param = new SqlParameter[]
                {                   
                    
                        new SqlParameter("@SRNNo", SRNNo),
                        new SqlParameter("@City", City),
                        new SqlParameter("@ConsignerId", ConsignerId),
                        new SqlParameter("@InvoicePeriod", InvoicePeriod),
                        new SqlParameter("@InvoiceAmount", InvoiceAmount),
                        new SqlParameter("@Status", Status),
                        new SqlParameter("@PartnerId", PartnerId),
                        new SqlParameter("@RejectionRemark", RejectionRemark),
                        new SqlParameter("@DateOfReview", DateOfReview),
                        new SqlParameter("@id",id)    
                };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }

        }
        #endregion
        #region SelectInvoice
        public DataTable SelectInvoice(int id)
        {
            if (id == 0)
            {
                string cmdText = "Select * from Core_Invoice left outer join Core_Consignment on Core_Consignment.SRNNo=Core_Invoice.SRNNo left outer join Core_Partner on Core_Partner.Id=Core_Invoice.PartnerId left outer join Core_states on Core_states.Id=Core_Invoice.ConsignerId";
                return new Datafunction().FillDt(cmdText, "");
            }
            else
            {
                string cmdText = "Select * from Core_Invoice  left outer join Core_Consignment on Core_Consignment.SRNNo=Core_Invoice.SRNNo  where Core_Invoice.Id=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
            }
        }
        #endregion
        #region DeleteInvoice
        public int DeleteInvoice(int id)
        {
            string cmdText = "Delete from Core_Invoice where Id=@id ";
            SqlParameter[] param = new SqlParameter[] 
            {
                new SqlParameter("@id",id)
            };
            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion
        #region SelectInvoicebyPartnerId
        public DataTable SelectInvoicebyPartnerId(int id, string Status)
        {

            string cmdText = "Select * from Core_Invoice  left outer join Core_Consignment on Core_Consignment.SRNNo=Core_Invoice.SRNNo  where Core_Invoice.PartnerId=@id and Core_Invoice.Status=@Status";
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@id", id);
            param[1] = new SqlParameter("@Status", Status);
            return new Datafunction().FillDt(param, cmdText, "");
          
        }
        #endregion
        #region SelectInvoicebyPartnerIdToday
        public DataTable SelectInvoicebyPartnerIdToday(int id, string Status, string Today)
        {

            string cmdText = "Select * from Core_Invoice  left outer join Core_Consignment on Core_Consignment.SRNNo=Core_Invoice.SRNNo  where Core_Invoice.PartnerId=@id and Core_Invoice.Status=@Status and CAST( Core_Invoice.Invoice_date AS DATE)=@Today";
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@id", id);
            param[1] = new SqlParameter("@Status", Status);
            param[2] = new SqlParameter("@Today", Today);
            return new Datafunction().FillDt(param, cmdText, "");

        }
        #endregion
        #region SelectInvoicebyCircle
        public DataTable SelectInvoicebyCircle(int id)
        {

            string cmdText = "Select * from Core_Invoice inner join Core_Employee_Circle on Core_Employee_Circle.CircleName=Core_Invoice.City  left outer join Core_Consignment on Core_Consignment.SRNNo=Core_Invoice.SRNNo left outer join Core_Partner on Core_Partner.Id=Core_Invoice.PartnerId left join Core_states on  Core_Invoice.consignerid=Core_states.id  where Core_Employee_Circle.EmployeeId=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
           
        }
        #endregion
        #region SelectInvoicebyCircleToday
        public DataTable SelectInvoicebyCircleToday(int id, string Today)
        {
            if (id == 0)
            {
                string cmdText = "Select * from Core_Invoice   left outer join Core_Consignment on Core_Consignment.SRNNo=Core_Invoice.SRNNo left outer join Core_Partner on Core_Partner.Id=Core_Invoice.PartnerId where  CAST(Core_Invoice.Invoice_date AS DATE)=@Today";
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@id", id);
                param[1] = new SqlParameter("@Today", Today);
                return new Datafunction().FillDt(param, cmdText, "");
            }
            else
            {
                string cmdText = "Select * from Core_Invoice inner join Core_Employee_Circle on Core_Employee_Circle.CircleName=Core_Invoice.City  left outer join Core_Consignment on Core_Consignment.SRNNo=Core_Invoice.SRNNo left outer join Core_Partner on Core_Partner.Id=Core_Invoice.PartnerId where Core_Employee_Circle.EmployeeId=@id and CAST(Core_Invoice.Invoice_date AS DATE)=@Today";
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@id", id);
                param[1] = new SqlParameter("@Today", Today);
                return new Datafunction().FillDt(param, cmdText, "");
            }

        }
        #endregion
        #region UpdateInvoice
        public int UpdateInvoice(int id, string Status, string DateOfReview, string RejectionRemark)
        {

            string cmdText = "Update Core_Invoice set RejectionRemark=@RejectionRemark,DateOfReview=@DateOfReview,Status=@Status where Id=@id";
                SqlParameter[] param = new SqlParameter[]
                {                   
                    
                        new SqlParameter("@RejectionRemark", RejectionRemark),
                        new SqlParameter("@Status", Status),
                        new SqlParameter("@DateOfReview", DateOfReview),
                        new SqlParameter("@id",id)    
                };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
           

        }
        #endregion
        #region SelectInvoicebyStatus
        public DataTable SelectInvoicebyStatus(string Status)
        {

            string cmdText = "Select * from Core_Invoice left outer join Core_Consignment on Core_Consignment.SRNNo=Core_Invoice.SRNNo left outer join Core_Partner on Core_Partner.Id=Core_Invoice.PartnerId  where Core_Invoice.Status=@Status";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@Status", Status);
                return new Datafunction().FillDt(param, cmdText, "");
          
        }
        #endregion
        #region SelectInvoicebyStatusAndCircle
        public DataTable SelectInvoicebyStatusAndCircle(string Status,int id)
        {

            string cmdText = "Select * from Core_Invoice inner join Core_Employee_Circle on Core_Employee_Circle.CircleName=Core_Invoice.City left outer join Core_Consignment on Core_Consignment.SRNNo=Core_Invoice.SRNNo left outer join Core_Partner on Core_Partner.Id=Core_Invoice.PartnerId  where Core_Invoice.Status=@Status and  Core_Employee_Circle.EmployeeId=@id";
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@Status", Status);
            param[1] = new SqlParameter("@id", id);
            return new Datafunction().FillDt(param, cmdText, "");

        }
        #endregion

        #region InsertUpdateDeliveryPerforma
        public int InsertUpdateDeliveryPerforma(int id, int Mode, string ConsignementId, string date, string Consigner_Name, string address, string Consignee_Name_Id, string contactNo1, string Delivery_Time, string Receivers_Name, string ContactNo2, string Delivery_Remark, decimal Any_Extra_Amount)
        {
            if (Mode == 0)
            {
                string cmdText = "Insert into Core_DeliveryPerforma(ConsignementId,date,Consigner_Name,address,Consignee_Name_Id,contactNo1,Delivery_Time,Receivers_Name,ContactNo2,Delivery_Remark,Any_Extra_Amount) values(@ConsignementId,@date,@Consigner_Name,@address,@Consignee_Name_Id,@contactNo1,@Delivery_Time,@Receivers_Name,@ContactNo2,@Delivery_Remark,@Any_Extra_Amount)";
                SqlParameter[] param = new SqlParameter[]
                    { 
                         new SqlParameter("@ConsignementId", ConsignementId),
                         new SqlParameter("@date", date),
                         new SqlParameter("@Consigner_Name", Consigner_Name),
                         new SqlParameter("@address", address),
                         new SqlParameter("@Consignee_Name_Id", Consignee_Name_Id),
                         new SqlParameter("@contactNo1", contactNo1),
                         new SqlParameter("@Delivery_Time", Delivery_Time),
                         new SqlParameter("@Receivers_Name", Receivers_Name),
                         new SqlParameter("@ContactNo2", ContactNo2),
                         new SqlParameter("@Delivery_Remark", Delivery_Remark),
                         new SqlParameter("@Any_Extra_Amount", Any_Extra_Amount),
                      
                    };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }
            else
            {
                string cmdText = "Update Core_DeliveryPerforma set ConsignementId=@ConsignementId, date=@date,Consigner_Name=@Consigner_Name,address=@address,Consignee_Name_Id=@Consignee_Name_Id,contactNo1=@contactNo1,Delivery_Time=@Delivery_Time,Receivers_Name=@Receivers_Name,ContactNo2=@ContactNo2,Delivery_Remark=@Delivery_Remark,Any_Extra_Amount=@Any_Extra_Amount where Id=@id";
                SqlParameter[] param = new SqlParameter[]
                {     
                        new SqlParameter("@ConsignementId", ConsignementId),
                         new SqlParameter("@date", date),
                         new SqlParameter("@Consigner_Name", Consigner_Name),
                         new SqlParameter("@address", address),
                         new SqlParameter("@Consignee_Name_Id", Consignee_Name_Id),
                         new SqlParameter("@contactNo1", contactNo1),
                         new SqlParameter("@Delivery_Time", Delivery_Time),
                         new SqlParameter("@Receivers_Name", Receivers_Name),
                         new SqlParameter("@ContactNo2", ContactNo2),
                         new SqlParameter("@Delivery_Remark", Delivery_Remark),
                         new SqlParameter("@Any_Extra_Amount", Any_Extra_Amount),
                         new SqlParameter("@id",id)    
                };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }

        }
        #endregion
        #region SelectDeliveryPerforma
        public DataTable SelectDeliveryPerforma(int id)
        {
            if (id == 0)
            {
                string cmdText = "Select * from Core_DeliveryPerforma";
                return new Datafunction().FillDt(cmdText, "");
            }
            else
            {
                string cmdText = "Select * from Core_DeliveryPerforma where Id=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
            }
        }
        #endregion
        #region DeleteDeliveryPerforma
        public int DeleteDeliveryPerforma(int id)
        {
            string cmdText = "Delete from Core_DeliveryPerforma where Id=@id ";
            SqlParameter[] param = new SqlParameter[] 
            {
                new SqlParameter("@id",id)
            };
            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
    public int Updateconsignment(string id)
    {
        string cmdText = "update  Core_Consignment set status ='Delivered' where ConsignementID=@id";
        SqlParameter[] param = new SqlParameter[]
        {
                new SqlParameter("@id",id)
        };
        return new Datafunction().ExecuteQuery(cmdText, param, "");

    }
    public int UpdateCoreconsignmentStatus(string ConsignementId)
    {
        //if (ConsignmentId != null)

        //{

            string cmdText = "Update Core_Consignment set status=“Delivered', where ConsignmentId=@ConsignmentId";

            SqlParameter[] param = new SqlParameter[]
            {

                        new SqlParameter("@ConsignmentId", ConsignmentId),

            };

           
        //}
        return 1; 

    }




    #endregion

    #region InsertUpdateEmployeeAppraisal
    public int InsertUpdateEmployeeAppraisal(int id, int Mode, string Rating1, string Remark1, string Rating2, string Remark2, string Rating3, string Remark3, string Rating4, string Remark4, string Rating5, string Remark5, int EmployeeId, int ManagerId, string type, string Other, string File_path, int AppraisalId)
        {
            if (Mode == 0)
            {
                string cmdText = "Insert into Core_Employee_Appraisal(Rating1,Remark1,Rating2,Remark2,Rating3,Remark3,Rating4,Remark4,Rating5,Remark5,EmployeeId,ManagerId,type,Other,File_path,AppraisalId) values(@Rating1,@Remark1,@Rating2,@Remark2,@Rating3,@Remark3,@Rating4,@Remark4,@Rating5,@Remark5,@EmployeeId,@ManagerId,@type,@Other,@File_path,@AppraisalId)";
                SqlParameter[] param = new SqlParameter[]
                    {
                         new SqlParameter("@Rating1", Rating1),
                         new SqlParameter("@Remark1", Remark1),
                         new SqlParameter("@Rating2", Rating2),
                         new SqlParameter("@Remark2", Remark2),
                         new SqlParameter("@Rating3", Rating3),
                         new SqlParameter("@Remark3", Remark3),
                         new SqlParameter("@Rating4", Rating4),
                         new SqlParameter("@Remark4", Remark4),
                         new SqlParameter("@Rating5", Rating5),
                         new SqlParameter("@Remark5", Remark5),
                         new SqlParameter("@EmployeeId", EmployeeId),
                         new SqlParameter("@ManagerId", ManagerId),
                         new SqlParameter("@type", type),
                         new SqlParameter("@Other", Other),
                         new SqlParameter("@File_path", File_path),
                         new SqlParameter("@AppraisalId", AppraisalId),
                    };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }
            else
            {
                string cmdText = "Update Core_Employee_Appraisal set Rating1=@Rating1,Remark1=@Remark1,Rating2=@Rating2,Remark2=@Remark2,Rating3=@Rating3,Remark3=@Remark3,Rating4=@Rating4,Remark4=@Remark4,Rating5=@Rating5,Remark5=@Remark5,EmployeeId=@EmployeeId,Other=@Other,File_path=@File_path where Id=@id";
                SqlParameter[] param = new SqlParameter[]
                {                   
                     new SqlParameter("@Rating1", Rating1),
                     new SqlParameter("@Remark1", Remark1),
                     new SqlParameter("@Rating2", Rating2),
                     new SqlParameter("@Remark2", Remark2),
                     new SqlParameter("@Rating3", Rating3),
                     new SqlParameter("@Remark3", Remark3),
                     new SqlParameter("@Rating4", Rating4),
                     new SqlParameter("@Remark4", Remark4),
                     new SqlParameter("@Rating5", Rating5),
                     new SqlParameter("@Remark5", Remark5),
                     new SqlParameter("@EmployeeId", EmployeeId),
                     new SqlParameter("@Other", Other),
                     new SqlParameter("@File_path", File_path),
                     new SqlParameter("@id",id)    
                };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }

        }
        #endregion
        #region SelectEmployeeAppraisal
        public DataTable SelectEmployeeAppraisal(int id)
        {
            if (id == 0)
            {
                string cmdText = "Select * from Core_Employee_Appraisal left outer join Core_Employee on Core_Employee.Id=Core_Employee_Appraisal.EmployeeId ORDER BY Core_Employee_Appraisal.Id ASC";
                return new Datafunction().FillDt(cmdText, "");
            }
            else
            {
                string cmdText = "Select * from Core_Employee_Appraisal where Id=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
            }
        }
        #endregion
        #region SelectEmployeeAppraisalbyEmployeeId
        public DataTable SelectEmployeeAppraisalbyEmployeeId(int id)
        {

            string cmdText = "Select * from Core_Employee_Appraisal where EmployeeId=@id and ManagerId='0'";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
           
        }
        #endregion
        #region SelectEmployeeAppraisalbyManagerId
        public DataTable SelectEmployeeAppraisalbyManagerId(int id)
        {

            string cmdText = "Select * from Core_Employee_Appraisal inner join Core_Employee on Core_Employee.Id=Core_Employee_Appraisal.ManagerId where Core_Employee_Appraisal.EmployeeId=@id and Core_Employee_Appraisal.ManagerId!='0'";
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", id);
            return new Datafunction().FillDt(param, cmdText, "");

        }
        #endregion
        #region SelectEmployeeAppraisalbyLevels
        public DataTable SelectEmployeeAppraisalbyLevels(int levels)
        {

            string cmdText = "Select * from Core_Employee_Appraisal inner join Core_Employee on Core_Employee.Id=Core_Employee_Appraisal.EmployeeId where (Core_Employee.levels)>@levels";
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@levels", levels);
            return new Datafunction().FillDt(param, cmdText, "");

        }
        #endregion
        #region DeleteEmployeeAppraisal
        public int DeleteEmployeeAppraisal(int id)
        {
            string cmdText = "Delete from Core_Employee_Appraisal where Id=@id ";
            SqlParameter[] param = new SqlParameter[] 
            {
                new SqlParameter("@id",id)
            };
            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion
        #region SelectEmployeeAppraisalbyEmployeeIdAndDate
        public DataTable SelectEmployeeAppraisalbyEmployeeIdAndDate(int id,DateTime From,DateTime To)
        {

            string cmdText = "Select * from Core_Employee_Appraisal where EmployeeId=@id and ManagerId='0' and date between @From and @To";
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@id", id);
            param[1] = new SqlParameter("@From", From);
            param[2] = new SqlParameter("@To", To);
            return new Datafunction().FillDt(param, cmdText, "");

        }
        #endregion

        #region InsertUpdateAppraisal
        public int InsertUpdateAppraisal(int id, int Mode, string Title, string From_date, string To_date)
        {
            if (Mode == 0)
            {
                string cmdText = "Insert into Core_Appraisal(Title,From_date,To_date) values(@Title,@From_date,@To_date)";
                SqlParameter[] param = new SqlParameter[]
                    {
                         new SqlParameter("@Title", Title),
                         new SqlParameter("@From_date", From_date),
                         new SqlParameter("@To_date", To_date),
                        
                         
                    };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }
            else
            {
                string cmdText = "Update Core_Appraisal set Title=@Title,From_date=@From_date,To_date=@To_date where Id=@id";
                SqlParameter[] param = new SqlParameter[]
                {                   
                      new SqlParameter("@Title", Title),
                      new SqlParameter("@From_date", From_date),
                      new SqlParameter("@To_date", To_date),
                     new SqlParameter("@id",id)    
                };

                return new Datafunction().ExecuteQuery(cmdText, param, "");
            }

        }
        #endregion
        #region SelectAppraisal
        public DataTable SelectAppraisal(int id)
        {
            if (id == 0)
            {
                string cmdText = "Select * from Core_Appraisal ORDER BY Id ASC";
                return new Datafunction().FillDt(cmdText, "");
            }
            else
            {
                string cmdText = "Select * from Core_Appraisal where Id=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
            }
        }
        #endregion
        #region DeleteAppraisal
        public int DeleteAppraisal(int id)
        {
            string cmdText = "Delete from Core_Appraisal where Id=@id ";
            SqlParameter[] param = new SqlParameter[] 
            {
                new SqlParameter("@id",id)
            };
            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion
        #region SelectAppraisalMaxId
        public DataTable SelectAppraisalMaxId()
        {
            string cmdText = "Select ISNULL(max(Id),0) as id from Core_Appraisal";
            return new Datafunction().FillDt(cmdText, "");

        }
        #endregion
        #region checkEmployeeAppraisal
        public int checkEmployeeAppraisal(int EmployeeId, int ManagerId, DateTime From, DateTime To)
        {
            string cmdText = "checkEmpAppraisal";
            SqlParameter[] param = new SqlParameter[4];
            param[0] = new SqlParameter("@EmployeeId", EmployeeId);
            param[1] = new SqlParameter("@ManagerId", ManagerId);
            param[2] = new SqlParameter("@From", From);
            param[3] = new SqlParameter("@To", To);
            return Convert.ToInt32(new Datafunction().ExecuteQuery(cmdText, param));
        }
        #endregion


        #region CountTotalLoadByEmp
        public DataTable CountTotalLoadByEmp(int id)
        {
            if (id == 0)
            {
                string cmdText = "Select Count(Core_LoadRequest.Id) as TotalLoad from Core_LoadRequest";
               
                return new Datafunction().FillDt(cmdText, "");
            }
            else
            {
                string cmdText = "Select Count(Core_LoadRequest.Id) as TotalLoad from Core_LoadRequest inner join Core_Employee_Circle on Core_Employee_Circle.CircleName=Core_LoadRequest.Circle where Core_Employee_Circle.EmployeeId=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);

                return new Datafunction().FillDt(param, cmdText, "");
            }

        }
        #endregion
        #region CountTodayLoadByEmp
        public DataTable CountTodayLoadByEmp(int id, string Today)
        {
            if (id == 0)
            {
                string cmdText = "Select Count(Core_LoadRequest.Id) as TodayLoad from Core_LoadRequest  where CAST( Core_LoadRequest.date AS DATE)=@Today";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@Today", Today);
                return new Datafunction().FillDt(param, cmdText, "");
            }
            else
            {
                string cmdText = "Select Count(Core_LoadRequest.Id) as TodayLoad from Core_LoadRequest inner join Core_Employee_Circle on Core_Employee_Circle.CircleName=Core_LoadRequest.Circle where Core_Employee_Circle.EmployeeId=@id and CAST( Core_LoadRequest.date AS DATE)=@Today";
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@id", id);
                param[1] = new SqlParameter("@Today", Today);
                return new Datafunction().FillDt(param, cmdText, "");
            }

        }
        #endregion
        #region CountTotalVehicleByEmp
        public DataTable CountTotalVehicleByEmp(int id)
        {
            if (id == 0)
            {
                string cmdText = "Select Count(Core_VehicleRequest.Id) as TotalVehicle from Core_VehicleRequest ";
               
                return new Datafunction().FillDt(cmdText, "");
            }
            else
            {
                string cmdText = "Select Count(Core_VehicleRequest.Id) as TotalVehicle from Core_VehicleRequest inner join Core_Employee_Circle on Core_Employee_Circle.CircleName=Core_VehicleRequest.Circle where Core_Employee_Circle.EmployeeId=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);

                return new Datafunction().FillDt(param, cmdText, "");
            }

        }
        #endregion
        #region CountTodayVehicleByEmp
        public DataTable CountTodayVehicleByEmp(int id, string Today)
        {
            if (id == 0)
            {
                string cmdText = "Select Count(Core_VehicleRequest.Id) as TodayVehicle from Core_VehicleRequest  where  CAST( Core_VehicleRequest.date AS DATE)=@Today";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@Today", Today);

                return new Datafunction().FillDt(param, cmdText, "");
            }
            else
            {
                string cmdText = "Select Count(Core_VehicleRequest.Id) as TodayVehicle from Core_VehicleRequest inner join Core_Employee_Circle on Core_Employee_Circle.CircleName=Core_VehicleRequest.Circle where Core_Employee_Circle.EmployeeId=@id and CAST( Core_VehicleRequest.date AS DATE)=@Today";
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@id", id);
                param[1] = new SqlParameter("@Today", Today);

                return new Datafunction().FillDt(param, cmdText, "");
            }

        }
        #endregion

        #region CountTotalConsignement
        public DataTable CountTotalConsignement()
        {
            string cmdText = "Select Count(Id) as TotalConsignment from Core_Consignment ";
            return new Datafunction().FillDt(cmdText, "");

        }
        #endregion
        #region CountTotalConsignementbyCircle
        public DataTable CountTotalConsignementbyCircle(int id)
        {
            string cmdText = "Select Count(Core_Consignment.Id) as TotalConsignment from Core_Consignment inner join Core_Employee_Circle on Core_Employee_Circle.CircleName=Core_Consignment.Circle where Core_Employee_Circle.EmployeeId=@id";
            SqlParameter[] param = new SqlParameter[1];
           
            param[0] = new SqlParameter("@id", id);
            return new Datafunction().FillDt(param, cmdText, "");

        }
        #endregion
        #region CountTodayConsignement
        public DataTable CountTodayConsignement(string Today)
        {
            string cmdText = "Select Count(Id) as ToDayConsignment from Core_Consignment  where Date=@Today";
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Today", Today);
          
            return new Datafunction().FillDt(param, cmdText, "");

        }
        #endregion
        #region CountTodayConsignementbyCircle
        public DataTable CountTodayConsignementbyCircle(string Today, int id)
        {
            string cmdText = "Select Count(Core_Consignment.Id) as ToDayConsignment from Core_Consignment inner join Core_Employee_Circle on Core_Employee_Circle.CircleName=Core_Consignment.Circle where Date=@Today and Core_Employee_Circle.EmployeeId=@id";
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@Today", Today);
            param[1] = new SqlParameter("@id", id);
            return new Datafunction().FillDt(param, cmdText, "");

        }
        #endregion
        #region CountConsignmentbyStatus
        public DataTable CountConsignmentbyStatus(string Status)
        {

            string cmdText = "Select Count(Id) as Status from Core_Consignment where Status=@Status";
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Status", Status);
            return new Datafunction().FillDt(param, cmdText, "");

        }
        #endregion
        #region CountConsignmentbyStatusAndCircle
        public DataTable CountConsignmentbyStatusAndCircle(string Status,int id)
        {

            string cmdText = "Select Count(Core_Consignment.Id) as Status from Core_Consignment inner join Core_Employee_Circle on Core_Employee_Circle.CircleName=Core_Consignment.Circle where Core_Consignment.Status=@Status and Core_Employee_Circle.EmployeeId=@id";
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@Status", Status);
            param[1] = new SqlParameter("@id", id);
            return new Datafunction().FillDt(param, cmdText, "");

        }
        #endregion

        #region CountTotalBill
        public DataTable CountTotalBill(int id)
        {
            if (id == 0)
            {
                string cmdText = "Select Count(Core_Invoice.Id) as TotalBill from Core_Invoice ";
                return new Datafunction().FillDt(cmdText, "");
            }
            else
            {
                string cmdText = "Select Count(Core_Invoice.Id) as TotalBill from Core_Invoice inner join Core_Employee_Circle on Core_Employee_Circle.CircleName=Core_Invoice.City where Core_Employee_Circle.EmployeeId=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
            }

        }
        #endregion
        #region CountTodayBill
        public DataTable CountTodayBill(int id, string Today)
        {

            if (id == 0)
            {
                string cmdText = "Select Count(Core_Invoice.Id) as TodayBill from Core_Invoice  where  CAST(Core_Invoice.Invoice_date AS DATE)=@Today";
                SqlParameter[] param = new SqlParameter[1];   
                param[0] = new SqlParameter("@Today", Today);
                return new Datafunction().FillDt(param, cmdText, "");
            }
            else
            {
                string cmdText = "Select Count(Core_Invoice.Id) as TodayBill from Core_Invoice inner join Core_Employee_Circle on Core_Employee_Circle.CircleName=Core_Invoice.City where Core_Employee_Circle.EmployeeId=@id and CAST(Core_Invoice.Invoice_date AS DATE)=@Today";
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@id", id);
                param[1] = new SqlParameter("@Today", Today);
                return new Datafunction().FillDt(param, cmdText, "");
            }

        }
        #endregion
        #region CountInvoicebyStatusAndCircle
        public DataTable CountInvoicebyStatusAndCircle(string Status, int id)
        {
            if (id == 0)
            {
                string cmdText = "Select Count(Core_Invoice.Id) as Status from Core_Invoice   where Core_Invoice.Status=@Status ";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@Status", Status);
              
                return new Datafunction().FillDt(param, cmdText, "");
            }
            else
            {
                string cmdText = "Select Count(Core_Invoice.Id) as Status from Core_Invoice inner join Core_Employee_Circle on Core_Employee_Circle.CircleName=Core_Invoice.City left outer join Core_Consignment on Core_Consignment.SRNNo=Core_Invoice.SRNNo left outer join Core_Partner on Core_Partner.Id=Core_Invoice.PartnerId  where Core_Invoice.Status=@Status and  Core_Employee_Circle.EmployeeId=@id";
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@Status", Status);
                param[1] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
            }

        }
        #endregion

        #region SelectAppraisalReport
        public DataTable SelectAppraisalReport(int Id,DateTime From,DateTime To)
        {
            string cmdText = "Select e.EmployeeName as Name,(CASE  WHEN a.EmployeeId != '' THEN 'Yes' ELSE 'No' END) Self_Appraisal,(CASE WHEN a.ManagerId != 0 THEN 'Yes' ELSE 'No' END) Manager_Appraisal from Core_Employee as e left outer join Core_Employee_Appraisal as a on a.EmployeeId=e.Id left outer join Core_Appraisal on Core_Appraisal.Id=a.AppraisalId where a.AppraisalId = @Id and a.date between @From and @To or a.EmployeeId  NOT IN  (SELECT Id FROM Core_Employee where a.AppraisalId = @Id)  GROUP BY e.EmployeeName,a.EmployeeId,a.ManagerId";
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@Id", Id);
            param[1] = new SqlParameter("@From", From);
            param[2] = new SqlParameter("@To", To);
            return new Datafunction().FillDt(param, cmdText, "");

        }
        #endregion

       
        #region CountTotalVehicleByPartner
        public DataTable CountTotalVehicleByPartner(int id)
        {
            string cmdText = "Select Count(Core_VehicleRequest.Id) as TotalVehicle from Core_VehicleRequest  where Core_VehicleRequest.PartnerId=@id";
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", id);
            return new Datafunction().FillDt(param, cmdText, "");
        }
        #endregion
        #region CountTodayVehicleByPartner
        public DataTable CountTodayVehicleByPartner(int id, string Today)
        {

            string cmdText = "Select Count(Core_VehicleRequest.Id) as TodayVehicle from Core_VehicleRequest  where Core_VehicleRequest.PartnerId=@id and CAST( Core_VehicleRequest.date AS DATE)=@Today";
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@id", id);
                param[1] = new SqlParameter("@Today", Today);

                return new Datafunction().FillDt(param, cmdText, "");
          

        }
        #endregion
        #region CountTotalAskVehicleByPartner
        public DataTable CountTotalAskVehicleByPartner(int id)
        {

            string cmdText = "Select Count(Core_Ask_for_Vehicle.Id) as TotalAskVehicle from Core_Ask_for_Vehicle  where Core_Ask_for_Vehicle.PartnerId=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);

                return new Datafunction().FillDt(param, cmdText, "");
           

        }
        #endregion
        #region CountTodayAskVehicleByPartner
        public DataTable CountTodayAskVehicleByPartner(int id, string Today)
        {

            string cmdText = "Select Count(Core_Ask_for_Vehicle.Id) as TodayAskVehicle from Core_Ask_for_Vehicle where Core_Ask_for_Vehicle.PartnerId=@id and CAST( Core_Ask_for_Vehicle.date AS DATE)=@Today";
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@id", id);
                param[1] = new SqlParameter("@Today", Today);
                return new Datafunction().FillDt(param, cmdText, "");
          

        }
        #endregion

        #region CountTotalBillByPartner
        public DataTable CountTotalBillByPartner(int id)
        {

            string cmdText = "Select Count(Core_Invoice.Id) as TotalBill from Core_Invoice  where Core_Invoice.PartnerId=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
           

        }
        #endregion
        #region CountTodayBillByPartner
        public DataTable CountTodayBillByPartner(int id, string Today)
        {


            string cmdText = "Select Count(Core_Invoice.Id) as TodayBill from Core_Invoice  where Core_Invoice.PartnerId=@id and CAST(Core_Invoice.Invoice_date AS DATE)=@Today";
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@id", id);
                param[1] = new SqlParameter("@Today", Today);
                return new Datafunction().FillDt(param, cmdText, "");
          

        }
        #endregion
        #region CountInvoicebyStatusAndPartner
        public DataTable CountInvoicebyStatusAndPartner(string Status, int id)
        {

            string cmdText = "Select Count(Core_Invoice.Id) as Status from Core_Invoice   where Core_Invoice.Status=@Status and  Core_Invoice.PartnerId=@id";
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@Status", Status);
                param[1] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
           

        }
        #endregion

        #region InsertEmployeeDept
        public int InsertEmployeeDept(int id, string Departement, string SubDivision, int EmployeeId)
        {
            string cmdText = "Insert into Core_Employee_Dept(Departement,SubDivision,EmployeeId) values(@Departement,@SubDivision,@EmployeeId)";
            SqlParameter[] param = new SqlParameter[]
                    {
                         new SqlParameter("@Departement", Departement),
                         new SqlParameter("@SubDivision", SubDivision),
                         new SqlParameter("@EmployeeId", EmployeeId),
                       
                    };

            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion
        #region DeleteEmployeeDept
        public int DeleteEmployeeDept(int id)
        {
            string cmdText = "Delete from Core_Employee_Dept where Id=@id ";
            SqlParameter[] param = new SqlParameter[] 
            {
                new SqlParameter("@id",id)
            };
            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion
        #region DeleteEmployeeDeptByEmployeeId
        public int DeleteEmployeeDeptByEmployeeId(int id)
        {
            string cmdText = "Delete from Core_Employee_Dept where EmployeeId=@id ";
            SqlParameter[] param = new SqlParameter[] 
            {
                new SqlParameter("@id",id)
            };
            return new Datafunction().ExecuteQuery(cmdText, param, "");

        }
        #endregion
        #region SelectEmployeeDept
        public DataTable SelectEmployeeDept(int id)
        {
            if (id == 0)
            {
                string cmdText = "Select * from Core_Employee_Dept ORDER BY Id DESC";
                return new Datafunction().FillDt(cmdText, "");
            }
            else
            {
                string cmdText = "Select * from Core_Employee_Dept where Id=@id";
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id", id);
                return new Datafunction().FillDt(param, cmdText, "");
            }
        }
        #endregion
        #region SelectEmployeeDeptbyEmployeeId
        public DataTable SelectEmployeeDeptbyEmployeeId(int id)
        {

            string cmdText = "Select * from Core_Employee_Dept where EmployeeId=@id";
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", id);
            return new Datafunction().FillDt(param, cmdText, "");

        }
    #endregion
    #region SelectConsignmentByLrgrNo
    public DataTable SelectConsignmentByLrgrNo(String txtSearch)
    {
        string cmdText = "Select * from Core_Consignment left outer join Core_states on Core_states.Id=Core_Consignment.ConsignerId where LR=@LR";
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@LR", txtSearch);

        return new Datafunction().FillDt(param, cmdText, "");

    }
    public DataTable SelectConsignmentByLrgrNo1(String txtSearch)
    {
        string cmdText = "Select cc.Id, cc.ConsignementID, cc.Date, cc.SRNNo, cc.ConsignerId, cc.Address1,cc.Contact1,cc.ConsigneeName, cc.Address2, cc.Contact2, cc.LR, cc.MaterialType, cc.Remark, cc.WayBill1, cc.WayBill2,cc.WayBill3, cc.WayBill4, cc.DateofLoading, cc.DateofDeliver, cc.FreightAmount, cc.AdvanceFreight,	cc.Loading, cc.Unloading, cc.Others, cc.ExtraAmount, cc.TotalAmount, cc.ContactNo1, cc.ContactNo2, cc.ContactNo3,cc.ContactNo4, cc.ContactNo5, cc.Status, cc.Circle, cc.VehicleNo, cc.Weight,	cc.MINno, cc.OGPno, cc.Blank1, cc.Blank2, cs.stateName as ConsignerName, ct.Type as VehicleType from Core_Consignment cc left outer join Core_states cs on cs.Id = cc.ConsignerId join Core_VehicleType ct on ct.id = cc.VehicleTypeId where cc.LR=@LR";
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@LR", txtSearch);

        return new Datafunction().FillDt(param, cmdText, "");

    }
    #endregion

    #region SelectConsignmentByVeNo
    public DataTable SelectConsignmentByVeNo(String txtSearch)
    {
        string cmdText = "Select * from Core_Consignment left outer join Core_states on Core_states.Id=Core_Consignment.ConsignerId where VehicleNo=@VehicleNo";
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@VehicleNo", txtSearch);

        return new Datafunction().FillDt(param, cmdText, "");

    }
    public DataTable SelectConsignmentByVeNo1(String txtSearch)
    {
        string cmdText = "Select cc.Id,cc.ConsignementID,cc.Date,cc.SRNNo,cc.ConsignerId,cc.Address1,cc.Contact1,cc.ConsigneeName,cc.Address2,cc.Contact2,cc.LR,cc.MaterialType,cc.Remark,cc.WayBill1,cc.WayBill2,cc.WayBill3,cc.WayBill4,cc.DateofLoading,cc.DateofDeliver,cc.FreightAmount,cc.AdvanceFreight,cc.Loading,cc.Unloading,cc.Others,cc.ExtraAmount,cc.TotalAmount,cc.ContactNo1,cc.ContactNo2,cc.ContactNo3,cc.ContactNo4,cc.ContactNo5,cc.Status,cc.Circle,cc.VehicleNo,cc.Weight,cc.MINno,cc.OGPno,cs.stateName as ConsignerName from Core_Consignment cc left outer join Core_states cs on cs.Id = cc.ConsignerId where cc.VehicleNo=@VehicleNo";
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@VehicleNo", txtSearch);

        return new Datafunction().FillDt(param, cmdText, "");

    }
    #endregion
    #region SelectConsignmentByCoName
    public DataTable SelectConsignmentByCoName(String txtSearch)
    {
        string cmdText = "Select * from Core_Consignment left outer join Core_states on Core_states.Id=Core_Consignment.ConsignerId  where stateName=@ConsigneeName";
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@ConsigneeName", txtSearch);

        return new Datafunction().FillDt(param, cmdText, "");

    }
    public DataTable SelectConsignmentByCoName1(String txtSearch)
    {
        string cmdText = "Select cc.Id,cc.ConsignementID,cc.Date,cc.SRNNo,cc.ConsignerId,cc.Address1,cc.Contact1,cc.ConsigneeName,cc.Address2,cc.Contact2,cc.LR,cc.MaterialType,cc.Remark,cc.WayBill1,cc.WayBill2,cc.WayBill3,cc.WayBill4,cc.DateofLoading,cc.DateofDeliver,cc.FreightAmount,cc.AdvanceFreight,cc.Loading,cc.Unloading,cc.Others,cc.ExtraAmount,cc.TotalAmount,cc.ContactNo1,cc.ContactNo2,cc.ContactNo3,cc.ContactNo4,cc.ContactNo5,cc.Status,cc.Circle,cc.VehicleNo,cc.Weight,cc.MINno,cc.OGPno,cs.stateName as ConsignerName from Core_Consignment cc left outer join Core_states cs on cs.Id = cc.ConsignerId where cs.stateName=@ConsigneeName";
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@ConsigneeName", txtSearch);

        return new Datafunction().FillDt(param, cmdText, "");

    }
    #endregion
    public DataTable bindConsingmentdd()
    {
       
            string cmdText = "Select ConsignementId,id from Core_Consignment where Status='Pending'";
            return new Datafunction().FillDt(cmdText, "");
       
    }

    public DataTable SelectConsignmentByConsignementID2(String ID)
    {
        string cmdText = "Select cc.*,cs.id as consignerid,cs.stateName as consignername from Core_Consignment cc   join Core_states cs on cs.Id=cc.ConsignerId where cc.ID =@ID";
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@ID", ID);
        return new Datafunction().FillDt(param, cmdText, "");

    }
}
