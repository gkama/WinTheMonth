using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace winthemonth
{
    public partial class _Default : Page
    {
        //MonthDays
        const int MONTHDAYS = 31;

        //Months and days
        Dictionary<string, int> Months = new Dictionary<string, int>();

        //Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            //Populate Months
            Months.Add("January", 31);
            Months.Add("February", 29);
            Months.Add("March", 31);
            Months.Add("April", 30);
            Months.Add("May", 31);
            Months.Add("June", 30);
            Months.Add("July", 31);
            Months.Add("August", 33);
            Months.Add("September", 30);
            Months.Add("October", 31);
            Months.Add("November", 30);
            Months.Add("December", 31);
        }

        //When you click update
        protected void btn_click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Income.Text.ToString()) || string.IsNullOrEmpty(MonthlyExpenses.Text.ToString()))
            {
                ErrorLabel.Text = "Please fill out inputs!";
            }
            else
            {
                ErrorLabel.Text = "";

                ContentPlaceHolder MainContent = Page.Master.FindControl("MainContent") as ContentPlaceHolder;

                double dailyIncome = 0;

                //Get Income after taxes - constant -25%
                double income = Convert.ToInt32(Income.Text.ToString()) * 0.75;

                //Subtract expenses
                double expenses = Convert.ToInt32(MonthlyExpenses.Text.ToString()) * 12;

                //Final calculated income
                double totalIncome = income - expenses;

                //Get the daily value
                dailyIncome = getDailyIncome(totalIncome);

                //Populate the table
                for (int i = 0; i < 31; i++)
                {
                    Label Allowance = (Label)MainContent.FindControl("Allowance" + (i + 1));

                    Allowance.Text = "$" + ((decimal)dailyIncome).ToString("0.00");
                }

                //Set Total Allowance
                AllowanceTotal.InnerText = "$" + Convert.ToDecimal(getTotalAllowance(income)).ToString("0.00");
            }
        }


        //Calculate daily income
        protected double getDailyIncome(double income)
        {
            return ((income / 52) / 7);
        }

        //Calculate total allowance
        protected double getTotalAllowance(double income)
        {
            return ((getDailyIncome(income)) * MONTHDAYS);
        }

        //When Spent Textbox input changes
        protected void spentChanged(object sender, EventArgs e)
        {
            ContentPlaceHolder MainContent = Page.Master.FindControl("MainContent") as ContentPlaceHolder;

            TextBox spentBox = (TextBox)sender;

            if (!string.IsNullOrEmpty(spentBox.Text.ToString()))
            {
                string idNumber = spentBox.ID.ToString().Remove(0, 5);

                Label WTD = (Label)MainContent.FindControl("WTD" + Convert.ToInt32(idNumber));

                TextBox Spent = (TextBox)MainContent.FindControl("Spent" + Convert.ToInt32(idNumber));
                Label Allowance = (Label)MainContent.FindControl("Allowance" + Convert.ToInt32(idNumber));
                Label WTM = (Label)MainContent.FindControl("WTM" + Convert.ToInt32(idNumber));

                double WTDRes = Convert.ToDouble(stripDollarSign(Allowance.Text.ToString())) - Convert.ToDouble(Spent.Text.ToString());

                if (WTDRes > 0)
                {
                    WTD.ForeColor = System.Drawing.Color.Green;
                }
                else
                    WTD.ForeColor = System.Drawing.Color.Red;

                //Set text to result
                WTD.Text = "$" + Convert.ToDecimal(WTDRes).ToString("0.00");

                //Keep track of total
                calculateSpentTotal(Convert.ToInt32(idNumber));
                calculateWTMTotal(Convert.ToInt32(idNumber));
            }
        }

        //Month drop down list changed
        protected void MonthsDDL_IndexChanged(object sender, EventArgs e)
        {
            MonthCaption.InnerText = "Win The Month: " + MonthsDDL.SelectedItem.ToString();

            if (MonthsDDL.SelectedItem.ToString() == "March")
            {
                row30.Visible = true;
                row31.Visible = true;
            }
        }


        //Strip dollar sign
        protected string stripDollarSign(string input)
        {
            return input.Remove(0, 1);
        }


        //Calculate spent total
        protected void calculateSpentTotal(int index)
        {
            double totalst = 0;

            ContentPlaceHolder MainContent = Page.Master.FindControl("MainContent") as ContentPlaceHolder;

            for (int i = 0; i < index; i++)
            {
                TextBox Spent = (TextBox)MainContent.FindControl("Spent" + (i + 1));
                if(!string.IsNullOrEmpty(Spent.Text.ToString()))
                    totalst += Convert.ToDouble(Spent.Text.ToString());      
            }
            SpentTotal.InnerText = "$" + Convert.ToDecimal(totalst).ToString("0.00");
        }

        //Calculate WTM total
        protected void calculateWTMTotal(int index)
        {
            double total = 0;

            ContentPlaceHolder MainContent = Page.Master.FindControl("MainContent") as ContentPlaceHolder;

            Label currWTM = (Label)MainContent.FindControl("WTM" + index.ToString());

            for (int i = 0; i < index; i++)
            {
                Label WTD = (Label)MainContent.FindControl("WTD" + (i + 1));
                if (!string.IsNullOrEmpty(WTD.Text.ToString()))
                    total += Convert.ToDouble(stripDollarSign(WTD.Text.ToString()));
            }
            WTMTotal.InnerText = "$" + Convert.ToDecimal(total).ToString("0.00");
            WTDTotal.InnerText = "$" + Convert.ToDecimal(total).ToString("0.00");

            //Check and update WTM
            if (total > 0)
            {
                currWTM.ForeColor = System.Drawing.Color.Green;
            }
            else
                currWTM.ForeColor = System.Drawing.Color.Red;
            currWTM.Text = "$" + Convert.ToDecimal(total).ToString("0.00");
        }
    }
}