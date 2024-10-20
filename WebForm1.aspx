<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="main.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="main.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            #Datareader student

using System;
using System.Data;
using System.Data.SqlClient;

namespace studentdetails
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\91705\source\repos\studentdetails\App_Data\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();

            SqlCommand cmd = new SqlCommand(@"INSERT INTO [Table] (rollno, name, class, phone, email) 
                                               VALUES (@rollno, @name, @class, @phone, @Email)", con);
            cmd.Parameters.AddWithValue("@rollno", TextBox1.Text);
            cmd.Parameters.AddWithValue("@name", TextBox2.Text);
            cmd.Parameters.AddWithValue("@class", TextBox3.Text);
            cmd.Parameters.AddWithValue("@phone", TextBox4.Text);
            cmd.Parameters.AddWithValue("@Email", TextBox5.Text);

            cmd.ExecuteNonQuery();
            Response.Write("Data inserted successfully");

            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT rollno, name, class, phone, email FROM [Table]", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind(); 
        }
    }
}







#Calendar controll

using System.Web.UI;
using System.Web.UI.WebControls;

namespace calendar
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date.Day == 18)
                e.Cell.Controls.Add(new LiteralControl("<br>holiday"));
            if (e.Day.Date >= new DateTime(2024, 10, 06) && e.Day.Date <= new DateTime(2024, 10, 18))
                e.Cell.BackColor = System.Drawing.Color.Red ;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TimeSpan t = Calendar1.SelectedDate - Calendar2.SelectedDate;
            Label1.Text += t.ToString();
        }
    }
}


#Datetime

 protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime date = DateTime.Now;
            
            Response.Write("today date is"+date+"<br>");
            Response.Write(date.Second + "<br>");
            Response.Write(date.Minute + "<br>");
            Response.Write(date.Millisecond + "<br>");
            Response.Write(date.Hour + "<br>");
            Response.Write(date.Date.Day + "<br>");
            Response.Write(date.Date.Month + "<br>");
            Response.Write(date.Date.Year + "<br>");

            DateTime dt1 = new DateTime(2004, 10, 06);
            DateTime dt2 = new DateTime(2024, 10, 06);
            TimeSpan  d = dt2 - dt1;
            Response.Write(Math.Round(d.TotalDays / 365));
        }


#Multiple interfaces


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace multipleinheritance
{
    interface addition
    {
        int add(int a, int b);
    }
    interface substraction
    {
        int sub(int x, int y);
    }
    class calculation : addition, substraction
    {
        public int result1;
        public int add(int a, int b)
        {
            return result1 = a + b;
        }
        public int result2;
        public int sub(int x, int y)
        {
            return result2 = x - y;
        }

    }
    class Program
    {
        static void Main(string[] args)
        {
            calculation c = new calculation();
            c.add(10, 10);
            c.sub(20, 5);
            Console.WriteLine("the addition is\t" +c.result1);
            Console.WriteLine("the substraction is\t"+c.result2);
            Console.ReadLine();
        }
    }
}












#User defined exception
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace userexception
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public class ageException : Exception
        {
            public ageException(string s) : base(s)
            {
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int a = Convert.ToInt32(TextBox1.Text);
            try
            {
                if (a < 18)
                {
                    throw new ageException("Invalid Age!!");
                }
            }
            catch (ageException obj)
            {
                Response.Write(obj.Message);
            }
            finally
            {
                Response.Write("Success");
            }
        }
    }
}


#a. Create simple application to perform following operations 
#i. Finding factorial Value
#ii. Money Conversion 
#iii. Quadratic Equation 

using System;
namespace ConsoleApp1
{
    class Program
    {
        static void fact()
        {
            Console.Write("Enter a number to find factorial: ");
            int n = Convert.ToInt32(Console.ReadLine());
            if (n == 0 || n == 1)
                n = 1;
            long fact = 1;
            for (int i = 2; i <= n; i++)
            {
                fact *= i;
            }
            Console.WriteLine($"Factorial of {n} is: {fact}");

            Console.ReadLine();
        }
        static void mconvert()
        {
            Console.Write("Enter amount in USD: ");
            decimal usd = Convert.ToDecimal(Console.ReadLine());

            decimal convertedAmount = ConvertToINR(usd);

            Console.WriteLine($"Amount in INR: {convertedAmount}");

            Console.ReadLine();
        }
        static decimal ConvertToINR(decimal usd)
        {
            decimal conversionRate = 79;
            return usd * conversionRate;
        }
        static void qequation()
        {
            Console.WriteLine("Enter coefficients (a, b, c) of the quadratic equation ax^2 + 	bx + c = 0:");
            Console.Write("Enter a: ");
            double a = Convert.ToDouble(Console.ReadLine());
            Console.Write("Enter b: ");
            double b = Convert.ToDouble(Console.ReadLine());
            Console.Write("Enter c: ");
            double c = Convert.ToDouble(Console.ReadLine());
            double discriminant = b * b - 4 * a * c;
            if (discriminant > 0)
            {
                double root1 = (-b + Math.Sqrt(discriminant)) / (2 * a);
                double root2 = (-b - Math.Sqrt(discriminant)) / (2 * a);

                Console.WriteLine($"Roots are real and different.\nRoot1 = {root1},Root2 = 	{ root2} ");
            }
            else if (discriminant == 0)
            {
                double root = -b / (2 * a);
                Console.WriteLine($"Roots are real and same.\nRoot = {root}");
            }
            else
            {
                double realPart = -b / (2 * a);
                double imaginaryPart = Math.Sqrt(-discriminant) / (2 * a);
                Console.WriteLine($"Roots are complex.\nRoot1 = {realPart} + 			   {imaginaryPart}i, 	Root2 = {realPart} - {imaginaryPart}i");
            }

            Console.ReadLine();
        }
        static void temp()
        {
            Console.Write("Enter temperature in Celsius: ");
            double celsius = Convert.ToDouble(Console.ReadLine());
            double fahrenheit = celsius * 9 / 5 + 32;
            double kelvin = celsius + 273.15;
            Console.WriteLine($"Temperature in Fahrenheit: {fahrenheit}");
            Console.WriteLine($"Temperature in Kelvin: {kelvin}");
            Console.ReadLine();
        }

        static void Main(string[] args)
        {
            Console.WriteLine("1-Find Factorial");
            Console.WriteLine("2-Money Conversion");
            Console.WriteLine("3-Solve Quadratic Equation");
            Console.WriteLine("4-Temperature Conversion");
            Console.WriteLine("Select Operation to perform :");
            int c = Convert.ToInt32(Console.ReadLine());
            switch (c)
            {
                case 1:
                    fact();
                    break;
                case 2:
                    mconvert();
                    break;
                case 3:
                    qequation();
                    break;
                case 4:
                    temp();
                    break;
                default:
                    Console.WriteLine("Invalid Option Selected");
                    break;
            }

        }
    }
}

#cookies

WebForm1.aspx.cs : 
using System; 
using System.Web; 
namespace Cookies 
{ 
public partial class WebForm1 : System.Web.UI.Page 
{ 
protected void Page_Load(object sender, EventArgs e) 
{ 
} 
protected void Button1_Click(object sender, EventArgs e) 
{ 
HttpCookie userInfo = new HttpCookie("userInfo"); 
userInfo["UserName"] = TextBox1.Text; 
userInfo["Password"] = TextBox2.Text; 
userInfo.Expires = DateTime.Now.AddSeconds(5); 
Response.Cookies.Add(userInfo); 
Response.Redirect("WebForm2.aspx"); 
} 
} 
}

#i. Generate Fibonacci series. 
Code: 
using System; 
using System.Collections.Generic; 
using System.Linq; 
using System.Text; 
using System.Threading.Tasks; 
namespace ConsoleApp1 
{ 
class Program 
{ 
static void Main(string[] args) 
{ 
int n1 = 0; 
int n2 = 1; 
int sum = n1 + n2; 
int lim = 20; 
Console.WriteLine("Fibonacci series: "); 
Console.WriteLine(n1); 
while (sum < lim) 
{ 
Console.WriteLine(sum); 
sum = n1 + n2; 
n1 = n2; 
n2 = sum; 
} 
Console.Read(); 
} 
} 
}



#Prime numbers


using System; 
using System.Collections.Generic; 
using System.Linq; 
using System.Text; 
using System.Threading.Tasks; 
namespace ConsoleApp1 
{ 
class Program 
{ 
static void Main(string[] args) 
{ 
Console.WriteLine("Enter number: "); 
int num = Convert.ToInt32(Console.ReadLine()); 
int status = 0; 
int i = 2; 
while (i < num / 2) 
{ 
if (num % i == 0) 
{ 
status = 1; 
break; 
} 
i++; 
} 
if (status == 1) 
{ 
Console.WriteLine("The number is Composite"); 
} 
else 
{ 
Console.WriteLine("The number is prime"); 
} 
Console.Read(); 
} 
} 
}




#Onclick event

 protected void Button1_Click(object sender, EventArgs e)
        {
            ViewState["x"] = Convert.ToInt32(ViewState["x"]) + 1;
            Label1.Text = ViewState["x"].ToString();
























        }
#arithmatic operatins

   protected void Button1_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(2000);
            double n1 = Convert.ToDouble(TextBox1.Text);
            double n2 = Convert.ToDouble(TextBox2.Text);
            double add = n1 + n2;
            double sub = n1 -n2;
            double mul = n1 *n2;
            double div = n1 / n2;
            Label2.Text = "Addition is " +add.ToString();
            Label3.Text = "Subtraction is " + sub.ToString();
            Label4.Text = "Multiplication is " + mul.ToString();
            Label5.Text = "Division is " + div.ToString();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Label6.Text = DateTime.Now.ToString("hh:mm:ss:tt");
        }
    }
}

        </div>
    </form>
</body>
</html>


    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
