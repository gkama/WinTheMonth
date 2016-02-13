<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="winthemonth._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <h1 style="margin-top: 10px;">WTM</h1>
            <hr />

            <div class="container-fluid" style="font-family: 'Century Gothic';">
                <div class="row">
                    <div class="col-md-4">
                        <asp:Label runat="server">Income (Pre-Tax):</asp:Label>
                        <asp:TextBox runat="server" ID="Income" CssClass="form-control" Placeholder="Income"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:Label runat="server">Monthly Expenses:</asp:Label>
                        <asp:TextBox runat="server" ID="MonthlyExpenses" CssClass="form-control" Placeholder="Monthly Expenses"></asp:TextBox>
                    </div>
                </div>
            </div>

            <hr />
            <div class="container-fluid" style="font-family: 'Century Gothic';">
                <div class="row">
                    <div class="col-md-4">
                        <asp:Button runat="server" ID="UpdateBudgetBtn" Text="Generate" Width="100%" CssClass="btn btn-primary btn-lg" OnClick="btn_click" />
                        <asp:Label runat="server" ID="ErrorLabel"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <asp:DropDownList runat="server" ID="MonthsDDL" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="MonthsDDL_IndexChanged">
                            <asp:ListItem Value="January"> January </asp:ListItem>
                            <asp:ListItem Selected="True" Value="February"> February </asp:ListItem>
                            <asp:ListItem Value="March"> March </asp:ListItem>
                            <asp:ListItem Value="April"> April </asp:ListItem>
                            <asp:ListItem Value="May"> May </asp:ListItem>
                            <asp:ListItem Value="June"> June </asp:ListItem>
                            <asp:ListItem Value="July"> July </asp:ListItem>
                            <asp:ListItem Value="August"> August </asp:ListItem>
                            <asp:ListItem Value="September"> September </asp:ListItem>
                            <asp:ListItem Value="October"> October </asp:ListItem>
                            <asp:ListItem Value="November"> November </asp:ListItem>
                            <asp:ListItem Value="December"> December </asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <hr />

            <div runat="server" id="table" class="container-fluid" style="display: none;">
            <table id="BudgetTable" class="table" style="font-family: 'Century Gothic';">
                <caption runat="server" id="MonthCaption" style="text-align: left;">Win The Month: February</caption>
                <thead>
                    <tr>
                        <th>Day</th>
                        <th>Spent</th>
                        <th>Allowance</th>
                        <th>WTD</th>
                        <th>WTM</th>
                        <th>New Allowance</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day1" Style="text-align: center;">1</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent1" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance1" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD1" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM1" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance1" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day2" Style="text-align: center;">2</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent2" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance2" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD2" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM2" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance2" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day3" Style="text-align: center;">3</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent3" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance3" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD3" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM3" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance3" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day4" Style="text-align: center;">4</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent4" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance4" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD4" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM4" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance4" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day5" Style="text-align: center;">5</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent5" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance5" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD5" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM5" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance5" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day6" Style="text-align: center;">6</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent6" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance6" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD6" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM6" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance6" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day7" Style="text-align: center;">7</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent7" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance7" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD7" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM7" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance7" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day8" Style="text-align: center;">8</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent8" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance8" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD8" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM8" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance8" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day9" Style="text-align: center;">9</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent9" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance9" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD9" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM9" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance9" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day10" Style="text-align: center;">10</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent10" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance10" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD10" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM10" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance10" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day11" Style="text-align: center;">11</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent11" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance11" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD11" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM11" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance11" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day12" Style="text-align: center;">12</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent12" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance12" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD12" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM12" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance12" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day13" Style="text-align: center;">13</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent13" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance13" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD13" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM13" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance13" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day14" Style="text-align: center;">14</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent14" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance14" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD14" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM14" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance14" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day15" Style="text-align: center;">15</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent15" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance15" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD15" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM15" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance15" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day16" Style="text-align: center;">16</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent16" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance16" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD16" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM16" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance16" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day17" Style="text-align: center;">17</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent17" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance17" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD17" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM17" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance17" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day18" Style="text-align: center;">18</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent18" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance18" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD18" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM18" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance18" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day19" Style="text-align: center;">19</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent19" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance19" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD19" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM19" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance19" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day20" Style="text-align: center;">20</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent20" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance20" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD20" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM20" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance20" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day21" Style="text-align: center;">21</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent21" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance21" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD21" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM21" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance21" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day22" Style="text-align: center;">22</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent22" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance22" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD22" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM22" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance22" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day23" Style="text-align: center;">23</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent23" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance23" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD23" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM23" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance23" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day24" Style="text-align: center;">24</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent24" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance24" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD24" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM24" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance24" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day25" Style="text-align: center;">25</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent25" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance25" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD25" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM25" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance25" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day26" Style="text-align: center;">26</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent26" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance26" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD26" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM26" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance26" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day27" Style="text-align: center;">27</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent27" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance27" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD27" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM27" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance27" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day28" Style="text-align: center;">28</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent28" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance28" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD28" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM28" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance28" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="Day29" Style="text-align: center;">29</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent29" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance29" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD29" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM29" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance29" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr runat="server" id="row30" visible="false">
                        <td>
                            <asp:Label runat="server" ID="Day30" Style="text-align: center;">30</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent30" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance30" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD30" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM30" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance30" Style="text-align: center;"></asp:Label></td>
                    </tr>
                    <tr runat="server" id="row31" visible="false">
                        <td>
                            <asp:Label runat="server" ID="Day31" Style="text-align: center;">31</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="Spent31" CssClass="form-control" Placeholder="Spent" Width="100px" AutoPostBack="true" OnTextChanged="spentChanged"></asp:TextBox></td>
                        <td>
                            <asp:Label runat="server" ID="Allowance31" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTD31" Style="text-align: center; "></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="WTM31" Style="text-align: center;"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="NewAllowance31" Style="text-align: center;"></asp:Label></td>
                    </tr>
                </tbody>
                 <thead>
                    <tr>
                        <th>Total:</th>
                        <th runat="server" id="SpentTotal"></th>
                        <th runat="server" id="AllowanceTotal"></th>
                        <th runat="server" id="WTDTotal"></th>
                        <th runat="server" id="WTMTotal"></th>
                        <th id="NewAllowanceTotal"></th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
    <script>

        $(document).ready(function () {

            $('#UpdateBudgetBtn').click(function () {
                $("#table").fadeIn(1000);
            });
        });

    </script>


</asp:Content>
