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
        double mWTM = 0;

        //Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            
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

                    Allowance.Text = "$" + ((int)dailyIncome).ToString();
                }
            }
        }


        //Calculate daily income
        protected double getDailyIncome(double income)
        {
            return ((income / 52) / 7);
        }


        //When Spent Textbox input changes
        protected void spentChanged(object sender, EventArgs e)
        {
            ContentPlaceHolder MainContent = Page.Master.FindControl("MainContent") as ContentPlaceHolder;

            TextBox spentBox = (TextBox)sender;

            string idNumber = spentBox.ID.ToString().Remove(0, 5);

            Label WTD = (Label)MainContent.FindControl("WTD" + Convert.ToInt32(idNumber));

            TextBox Spent = (TextBox)MainContent.FindControl("Spent" + Convert.ToInt32(idNumber));
            Label Allowance = (Label)MainContent.FindControl("Allowance" + Convert.ToInt32(idNumber));
            Label WTM = (Label)MainContent.FindControl("WTM" + Convert.ToInt32(idNumber));

            double WTDRes = Convert.ToInt32(stripDollarSign(Allowance.Text.ToString())) - Convert.ToInt32(Spent.Text.ToString());

            if(WTDRes > 0){
                WTD.ForeColor = System.Drawing.Color.Green;
            }
            else
                WTD.ForeColor = System.Drawing.Color.Red;

            //Keep track of WTM
            mWTM += WTDRes;

            //Set text to result
            WTD.Text = "$" + WTDRes.ToString();

            //Check and update WTM
            if (mWTM > 0)
            {
                WTM.ForeColor = System.Drawing.Color.Green;
            }
            else
                WTM.ForeColor = System.Drawing.Color.Red;

            //Set text to result
            WTM.Text = "$" + mWTM.ToString();

            //Keep track of total
            calculateSpentTotal();
            calculateWTMTotal();
        }


        //Strip dollar sign
        protected string stripDollarSign(string input)
        {
            return input.Remove(0, 1);
        }


        //Calculate spent total
        protected void calculateSpentTotal()
        {
            int totalst = 0;

            ContentPlaceHolder MainContent = Page.Master.FindControl("MainContent") as ContentPlaceHolder;
            for (int i = 0; i < 31; i++)
            {
                TextBox Spent = (TextBox)MainContent.FindControl("Spent" + (i + 1));
                if(!string.IsNullOrEmpty(Spent.Text.ToString()))
                    totalst += Convert.ToInt32(stripDollarSign(Spent.Text.ToString()));      
            }
            SpentTotal.InnerText = "$" + totalst.ToString();
        }

        //Calculate WTM total
        protected void calculateWTMTotal()
        {
            int total = 0;

            ContentPlaceHolder MainContent = Page.Master.FindControl("MainContent") as ContentPlaceHolder;
            for (int i = 0; i < 31; i++)
            {
                Label WTM = (Label)MainContent.FindControl("WTM" + (i + 1));
                if (!string.IsNullOrEmpty(WTM.Text.ToString()))
                    total += Convert.ToInt32(stripDollarSign(WTM.Text.ToString()));
            }
            WTMTotal.InnerText = "$" + total.ToString();
        }
    }
}