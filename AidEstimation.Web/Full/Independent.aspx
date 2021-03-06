<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Independent.aspx.cs" Inherits="Ucsb.Sa.FinAid.AidEstimation.Web.Full.Independent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">

    <p>
        This Financial Aid Estimator provides an estimation of financial aid for <strong>prospective full-time,
        independent undergraduate students</strong>. The estimated values produced by this tool are <strong>not</strong>
        the actual amounts that will be offered by an institution. All estimated values are <strong>subject to the
        availability of funding</strong>. To begin the actual financial aid application process, complete a
        <a href="http://www.fafsa.ed.gov/">FAFSA</a>.
    </p>

    <asp:Placeholder ID="formPlaceholder" runat="server" Visible="true">

        <asp:Repeater ID="errorList" runat="server">
            <HeaderTemplate>
                <p class="error">There was an error with the values for the following fields:</p>
                <ul class="error error-list">
            </HeaderTemplate>
            <ItemTemplate>
                <li><%# Eval("Message") %></li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>

        <form method="post" action="Independent.aspx" runat="server">
            <asp:ValidationSummary ID="validationSummary" runat="server" CssClass="validation-summary" Display="Dynamic" DisplayMode="BulletList" HeaderText="There was an error with the values for the following fields:" />
            <ul>
                <li>
                    <asp:Label runat="server" AssociatedControlID="inputStudentAge">Age of Student</asp:Label>
                    <asp:TextBox runat="server" ID="inputStudentAge"></asp:TextBox>
                    <span class="validation-message">
                        <asp:RequiredFieldValidator ID="valStudentAgeReq" ControlToValidate="inputStudentAge" EnableClientScript="true" runat="server" Display="Dynamic" ErrorMessage="Please enter a value for: Age of Student"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="valStudentAgeExp" ControlToValidate="inputStudentAge" EnableClientScript="true" runat="server" Display="Dynamic" ValidationExpression="[1-9][0-9]+" ErrorMessage="Please enter a postitive numeric value for: Age of Student"></asp:RegularExpressionValidator>
                    </span>
                </li>
                <li>
                    <fieldset>
                        <legend>Marital Status</legend>
                        <asp:RadioButtonList runat="server" ID="inputMaritalStatus" RepeatLayout="UnorderedList" CssClass="radio-input-list">
                            <asp:ListItem Value="single" Selected="True">Single/Separated/Divorced</asp:ListItem>
                            <asp:ListItem Value="married">Married/Remarried</asp:ListItem>
                        </asp:RadioButtonList>
                    </fieldset>
                </li>
                <li>
                    <fieldset>
                        <legend>Did the Student Work?</legend>
                        <asp:RadioButtonList runat="server" ID="inputStudentWorking" RepeatLayout="UnorderedList" CssClass="radio-input-list" OnSelectedIndexChanged="inputStudentWorking_SelectedIndexChanged">
                            <asp:ListItem Value="true" Selected="True">Yes, I worked</asp:ListItem>
                            <asp:ListItem Value="false">No, I did <em>not</em> work</asp:ListItem>
                        </asp:RadioButtonList>
                    </fieldset>
                </li>
                <li>
                    <asp:Label runat="server" AssociatedControlID="inputStudentWorkIncome">Student's Income Earned From Work</asp:Label>
                    <asp:TextBox runat="server" ID="inputStudentWorkIncome"></asp:TextBox>
                    <span class="validation-message">
                        <asp:RequiredFieldValidator ID="valStudentWorkIncomeReq" ControlToValidate="inputStudentWorkIncome" EnableClientScript="true" runat="server" Display="Dynamic" ErrorMessage="Please enter a value for: Student's Income Earned From Work"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="valStudentWorkIncomeRegExp" ControlToValidate="inputStudentWorkIncome" EnableClientScript="true" runat="server" Display="Dynamic" ValidationExpression="[1-9][0-9]*" ErrorMessage="Please enter a postitive numeric value (no decimals) for: Student's Income Earned From Work"></asp:RegularExpressionValidator>
                    </span>
                </li>
                <li>
                    <fieldset>
                        <legend>Did the Spouse Work?</legend>
                        
                        <asp:RadioButtonList runat="server" ID="inputSpouseWorking" RepeatLayout="UnorderedList" CssClass="radio-input-list" OnSelectedIndexChanged="inputSpouseWorking_SelectedIndexChanged">
                            <asp:ListItem Value="true" Selected="True">Yes, my Spouse worked</asp:ListItem>
                            <asp:ListItem Value="false">No, my Spouse did <em>not</em> work</asp:ListItem>
                        </asp:RadioButtonList>
                    </fieldset>
                </li>
                <li>
                    <asp:Label runat="server" AssociatedControlID="inputSpouseWorkIncome">Spouse's Income Earned From Work</asp:Label>
                    <asp:TextBox runat="server" ID="inputSpouseWorkIncome"></asp:TextBox>
                    <span class="validation-message">
                        <asp:RequiredFieldValidator ID="valSpouseWorkIncomeReq" ControlToValidate="inputSpouseWorkIncome" EnableClientScript="true" runat="server" Display="Dynamic" ErrorMessage="Please enter a value for: Spouse's Income Earned From Work"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="valSpouseWorkIncomeRegExp" ControlToValidate="inputSpouseWorkIncome" EnableClientScript="true" runat="server" Display="Dynamic" ValidationExpression="[0-9]*" ErrorMessage="Please enter a numeric value (no decimals) for: Spouse's Income Earned From Work"></asp:RegularExpressionValidator>
                    </span>
                </li>
                <li>
                    <fieldset>
                        <legend>Did the Student and Spouse File Taxes?</legend>
                        
                        <asp:RadioButtonList runat="server" ID="inputStudentTaxFiler" RepeatLayout="UnorderedList" CssClass="radio-input-list" OnSelectedIndexChanged="inputStudentTaxFiler_SelectedIndexChanged">
                            <asp:ListItem Value="true" Selected="True">Yes, we filed taxes</asp:ListItem>
                            <asp:ListItem Value="false">No, we did <em>not</em> files taxes</asp:ListItem>
                        </asp:RadioButtonList>
                    </fieldset>
                </li>
                <li>
                    <asp:Label runat="server" AssociatedControlID="inputStudentAgi">Student and Spouse's Adjusted Gross Income (AGI)</asp:Label>
                    <asp:TextBox runat="server" ID="inputStudentAgi">0</asp:TextBox>
                    <span class="validation-message">
                        <asp:RequiredFieldValidator ID="valStudentAgiReq" ControlToValidate="inputStudentAgi" EnableClientScript="true" runat="server" Display="Dynamic" ErrorMessage="Please enter a value for: Student and Spouse's Adjusted Gross Income (AGI)"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="valStudentAgiRegExp" ControlToValidate="inputStudentAgi" EnableClientScript="true" runat="server" Display="Dynamic" ValidationExpression="[0-9]*" ErrorMessage="Please enter a numeric value (no decimals) for: Student and Spouse'sAdjusted Gross Income (AGI)"></asp:RegularExpressionValidator>
                    </span>
                </li>
                <li>
                    <asp:Label runat="server" AssociatedControlID="inputStudentIncomeTax">Student and Spouse's Total Income Taxes Paid</asp:Label>
                    <asp:TextBox runat="server" ID="inputStudentIncomeTax">0</asp:TextBox>
                    <span class="validation-message">
                        <asp:RequiredFieldValidator ID="valStudentIncomeTaxReq" ControlToValidate="inputStudentIncomeTax" EnableClientScript="true" runat="server" Display="Dynamic" ErrorMessage="Please enter a value for: Student and Spouse's Income Tax Paid"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="valStudentIncomeTaxRegExp" ControlToValidate="inputStudentIncomeTax" EnableClientScript="true" runat="server" Display="Dynamic" ValidationExpression="[0-9]*" ErrorMessage="Please enter a numeric value (no decimals) for: Student and Spouse's Income Tax Paid"></asp:RegularExpressionValidator>
                    </span>
                </li>
                <li>
                    <asp:Label runat="server" AssociatedControlID="inputStudentUntaxedIncomeAndBenefits">
                        Student and Spouse's Untaxed Income and Benefits
                        <span class="description">Including child support and money received from friends or relatives</span>
                    </asp:Label>
                    <asp:TextBox runat="server" ID="inputStudentUntaxedIncomeAndBenefits">0</asp:TextBox>
                    <span class="validation-message">
                        <asp:RequiredFieldValidator ID="valStudentUntaxedIncomeAndBenefitsReq" ControlToValidate="inputStudentUntaxedIncomeAndBenefits" EnableClientScript="true" runat="server" Display="Dynamic" ErrorMessage="Please enter a value for: Student and Spouse's Untaxed Income and Benefits"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="valStudentUntaxedIncomeAndBenefitsRegExp" ControlToValidate="inputStudentUntaxedIncomeAndBenefits" EnableClientScript="true" runat="server" Display="Dynamic" ValidationExpression="[0-9]*" ErrorMessage="Please enter a numeric value (no decimals) for: Student and Spouse's Untaxed Income and Benefits"></asp:RegularExpressionValidator>
                    </span>
                </li>
                <li>
                    <asp:Label runat="server" AssociatedControlID="inputStudentAdditionalFinancialInfo">Student and Spouse's Additional Financial Information</asp:Label>
                    <asp:TextBox runat="server" ID="inputStudentAdditionalFinancialInfo">0</asp:TextBox>
                    <span class="validation-message">
                        <asp:RequiredFieldValidator ID="valStudentAdditionalFinancialInfoReq" ControlToValidate="inputStudentAdditionalFinancialInfo" EnableClientScript="true" runat="server" Display="Dynamic" ErrorMessage="Please enter a value for: Student and Spouse's Additional Financial Information"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="valStudentAdditionalFinancialInfoRegExp" ControlToValidate="inputStudentAdditionalFinancialInfo" EnableClientScript="true" runat="server" Display="Dynamic" ValidationExpression="[0-9]*" ErrorMessage="Please enter a numeric value (no decimals) for: Student and Spouse's Additional Financial Information"></asp:RegularExpressionValidator>
                    </span>
                </li>
                <li>
                    <asp:Label runat="server" AssociatedControlID="inputStudentCashSavingsChecking">Student and Spouse's Cash, Savings, and Checking</asp:Label>
                    <asp:TextBox runat="server" ID="inputStudentCashSavingsChecking">0</asp:TextBox>
                    <span class="validation-message">
                        <asp:RequiredFieldValidator ID="valStudentCashSavingsCheckingReq" ControlToValidate="inputStudentCashSavingsChecking" EnableClientScript="true" runat="server" Display="Dynamic" ErrorMessage="Please enter a value for: Student and Spouse's Cash, Savings, and Checking"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="valStudentCashSavingsCheckingRegExp" ControlToValidate="inputStudentCashSavingsChecking" EnableClientScript="true" runat="server" Display="Dynamic" ValidationExpression="[0-9]*" ErrorMessage="Please enter a numeric value (no decimals) for: Student and Spouse's Cash, Savings, and Checking"></asp:RegularExpressionValidator>
                    </span>
                </li>
                <li>
                    <asp:Label runat="server" AssociatedControlID="inputStudentInvestmentNetWorth">Net Worth of Student and Spouse's Investments</asp:Label>
                    <asp:TextBox runat="server" ID="inputStudentInvestmentNetWorth">0</asp:TextBox>
                    <span class="validation-message">
                        <asp:RequiredFieldValidator ID="valStudentInvestmentNetWorthReg" ControlToValidate="inputStudentInvestmentNetWorth" EnableClientScript="true" runat="server" Display="Dynamic" ErrorMessage="Please enter a value for: Net Worth of Student and Spouse's Investments"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="valStudentInvestmentNetWorthRegExp" ControlToValidate="inputStudentInvestmentNetWorth" EnableClientScript="true" runat="server" Display="Dynamic" ValidationExpression="[0-9]*" ErrorMessage="Please enter a numeric value (no decimals) for: Net Worth of Student and Spouse's Investments"></asp:RegularExpressionValidator>
                    </span>
                </li>
                <li>
                    <asp:Label runat="server" AssociatedControlID="inputStudentBusinessFarmNetWorth">Net Worth of Student and Spouse's Business and/or Investment Farm</asp:Label>
                    <asp:TextBox runat="server" ID="inputStudentBusinessFarmNetWorth">0</asp:TextBox>
                    <span class="validation-message">
                        <asp:RequiredFieldValidator ID="valStudentBusinessFarmNetWorthReq" ControlToValidate="inputStudentBusinessFarmNetWorth" EnableClientScript="true" runat="server" Display="Dynamic" ErrorMessage="Please enter a value for: Net Worth of Student and Spouse's Business and/or Investment Farm"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="valStudentBusinessFarmNetWorthRegExp" ControlToValidate="inputStudentBusinessFarmNetWorth" EnableClientScript="true" runat="server" Display="Dynamic" ValidationExpression="[0-9]*" ErrorMessage="Please enter a numeric value (no decimals) for: Net Worth of Student and Spouse's Business and/or Investment Farm"></asp:RegularExpressionValidator>
                    </span>
                </li>
                <li>
                    <fieldset>
                        <legend>Student has Dependents</legend>
                        
                        <asp:RadioButtonList runat="server" ID="inputHasDependents" RepeatLayout="UnorderedList" CssClass="radio-input-list">
                            <asp:ListItem Value="true">Yes, I have dependents</asp:ListItem>
                            <asp:ListItem Value="false" Selected="True">No, I do <em>not</em> have dependents</asp:ListItem>
                        </asp:RadioButtonList>
                    </fieldset>
                </li>
                <li>
                    <asp:Label runat="server" AssociatedControlID="inputNumberInHousehold">
                        Number in Household
                        <span class="description">Total number in your household during the last academic year. Include you, your spouse, your children, and any other dependents</span>
                    </asp:Label>
                    <asp:TextBox runat="server" ID="inputNumberInHousehold">1</asp:TextBox>
                    <span class="validation-message">
                        <asp:RequiredFieldValidator ID="valNumberInHouseholdreq" ControlToValidate="inputNumberInHousehold" EnableClientScript="true" runat="server" Display="Dynamic" ErrorMessage="Please enter a value for: Number in Household"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="valNumberInHouseholdRegExp" ControlToValidate="inputNumberInHousehold" EnableClientScript="true" runat="server" Display="Dynamic" ValidationExpression="[1-9][0-9]*" ErrorMessage="Please enter a value of 1 or more for: Number in Household"></asp:RegularExpressionValidator>
                    </span>
                </li>
                <li>
                    <asp:Label runat="server" AssociatedControlID="inputNumberInCollege">
                        Number in College
                        <span class="description">Total number of people in your household that will attend college in the next academic year</span>
                    </asp:Label>
                    <asp:TextBox runat="server" ID="inputNumberInCollege">1</asp:TextBox>
                    <span class="validation-message">
                        <asp:RequiredFieldValidator ID="valNumberInCollegeReq" ControlToValidate="inputNumberInCollege" EnableClientScript="true" runat="server" Display="Dynamic" ErrorMessage="Please enter a value for: Number in College"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="valNumberInCollegeRegExp" ControlToValidate="inputNumberInCollege" EnableClientScript="true" runat="server" Display="Dynamic" ValidationExpression="[1-9][0-9]*" ErrorMessage="Please enter a numeric value (no decimals) for: Number in College"></asp:RegularExpressionValidator>
                    </span>
                </li>
                <li>
                    <asp:Label runat="server" AssociatedControlID="inputStateOfResidency">State of Residency</asp:Label>
                    <asp:DropDownList runat="server" ID="inputStateOfResidency">
                        <asp:ListItem Value="Alabama">Alabama</asp:ListItem>
                        <asp:ListItem Value="Alaska">Alaska</asp:ListItem>
                        <asp:ListItem Value="AmericanSamoa">American Samoa</asp:ListItem>
                        <asp:ListItem Value="Arizona">Arizona</asp:ListItem>
                        <asp:ListItem Value="Arkansas">Arkansas</asp:ListItem>
                        <asp:ListItem Value="California" Selected="True">California</asp:ListItem>
                        <asp:ListItem Value="CanadaAndCanadianProvinces">Canada And Canadian Provinces</asp:ListItem>
                        <asp:ListItem Value="Colorado">Colorado</asp:ListItem>
                        <asp:ListItem Value="Connecticut">Connecticut</asp:ListItem>
                        <asp:ListItem Value="Delaware">Delaware</asp:ListItem>
                        <asp:ListItem Value="DistrictOfColumbia">District Of Columbia</asp:ListItem>
                        <asp:ListItem Value="FederatedStatesOfMicronesia">Federated States Of Micronesia</asp:ListItem>
                        <asp:ListItem Value="Florida">Florida</asp:ListItem>
                        <asp:ListItem Value="Georgia">Georgia</asp:ListItem>
                        <asp:ListItem Value="Guam">Guam</asp:ListItem>
                        <asp:ListItem Value="Hawaii">Hawaii</asp:ListItem>
                        <asp:ListItem Value="Idaho">Idaho</asp:ListItem>
                        <asp:ListItem Value="Illinois">Illinois</asp:ListItem>
                        <asp:ListItem Value="Indiana">Indiana</asp:ListItem>
                        <asp:ListItem Value="Iowa">Iowa</asp:ListItem>
                        <asp:ListItem Value="Kansas">Kansas</asp:ListItem>
                        <asp:ListItem Value="Kentucky">Kentucky</asp:ListItem>
                        <asp:ListItem Value="Louisiana">Louisiana</asp:ListItem>
                        <asp:ListItem Value="Maine">Maine</asp:ListItem>
                        <asp:ListItem Value="MarshallIslands">Marshall Islands</asp:ListItem>
                        <asp:ListItem Value="Maryland">Maryland</asp:ListItem>
                        <asp:ListItem Value="Massachusetts">Massachusetts</asp:ListItem>
                        <asp:ListItem Value="Mexico">Mexico</asp:ListItem>
                        <asp:ListItem Value="Michigan">Michigan</asp:ListItem>
                        <asp:ListItem Value="Minnesota">Minnesota</asp:ListItem>
                        <asp:ListItem Value="Mississippi">Mississippi</asp:ListItem>
                        <asp:ListItem Value="Missouri">Missouri</asp:ListItem>
                        <asp:ListItem Value="Montana">Montana</asp:ListItem>
                        <asp:ListItem Value="Nebraska">Nebraska</asp:ListItem>
                        <asp:ListItem Value="Nevada">Nevada</asp:ListItem>
                        <asp:ListItem Value="New Hampshire">New Hampshire</asp:ListItem>
                        <asp:ListItem Value="NewJersey">New Jersey</asp:ListItem>
                        <asp:ListItem Value="NewMexico">New Mexico</asp:ListItem>
                        <asp:ListItem Value="NewYork">New York</asp:ListItem>
                        <asp:ListItem Value="NorthCarolina">North Carolina</asp:ListItem>
                        <asp:ListItem Value="NorthDakota">North Dakota</asp:ListItem>
                        <asp:ListItem Value="NorthernMarianaIslands">Northern Mariana Islands</asp:ListItem>
                        <asp:ListItem Value="Ohio">Ohio</asp:ListItem>
                        <asp:ListItem Value="Oklahoma">Oklahoma</asp:ListItem>
                        <asp:ListItem Value="Oregon">Oregon</asp:ListItem>
                        <asp:ListItem Value="Palau">Palau</asp:ListItem>
                        <asp:ListItem Value="Pennsylvania">Pennsylvania</asp:ListItem>
                        <asp:ListItem Value="PuertoRico">Puerto Rico</asp:ListItem>
                        <asp:ListItem Value="RhodeIsland">Rhode Island</asp:ListItem>
                        <asp:ListItem Value="SouthCarolina">South Carolina</asp:ListItem>
                        <asp:ListItem Value="SouthDakota">South Dakota</asp:ListItem>
                        <asp:ListItem Value="Tennessee">Tennessee</asp:ListItem>
                        <asp:ListItem Value="Texas">Texas</asp:ListItem>
                        <asp:ListItem Value="Utah">Utah</asp:ListItem>
                        <asp:ListItem Value="Vermont">Vermont</asp:ListItem>
                        <asp:ListItem Value="VirginIslands">Virgin Islands</asp:ListItem>
                        <asp:ListItem Value="Virginia">Virginia</asp:ListItem>
                        <asp:ListItem Value="Washington">Washington</asp:ListItem>
                        <asp:ListItem Value="WestVirginia">West Virginia</asp:ListItem>
                        <asp:ListItem Value="Wisconsin">Wisconsin</asp:ListItem>
                        <asp:ListItem Value="Wyoming">Wyoming</asp:ListItem>
                        <asp:ListItem Value="Other">Other</asp:ListItem>
                    </asp:DropDownList>
                </li>
                <li>
                    <asp:Label runat="server" AssociatedControlID="inputHousing">Housing Option</asp:Label>
                    <asp:DropDownList runat="server" ID="inputHousing">
                        <asp:ListItem Value="1" Selected="True">On Campus</asp:ListItem>
                        <asp:ListItem Value="2">Off-Campus</asp:ListItem>
                        <asp:ListItem Value="3">Commuter</asp:ListItem>
                    </asp:DropDownList>
                </li>
                <li class="button-wrapper">
                    <asp:Button runat="server" UseSubmitBehavior="true" Text="Calculate EFC" CssClass="button" CausesValidation="true" OnClientClick="Page_ClientValidate();" />
                </li>
            </ul>
        </form>

    </asp:Placeholder>

    <asp:Placeholder ID="resultsPlaceholder" runat="server" Visible="false">
        
		<h3>Expected Family Contribution</h3>

		<ul class="results">
			<li>
				<span class="result-label">
					Student Contribution
					<span class="description">Amount that you are expected to contribute towards the cost of your education</span>
				</span>
				<span class="result-amount"><asp:Literal ID="studentContributionOutput" runat="server" /></span>
			</li>
			<li class="total">
				<span class="result-label">
					Expected Family Contribution
					<span class="description">Sum of the Student Contribution (SC) and Parent Contribution (PC)</span>
				</span>
				<span class="result-amount"><asp:Literal ID="expectedFamilyContributionOutput" runat="server" /></span>
			</li>
		</ul>

        <h3>Estimated Award Letter</h3>

        <ul class="results">
	        <li>
		        <span class="result-label">
			        Grant Award
			        <span class="description">Estimated total amount of grants that you will be offered in your Financial Aid Award Letter</span>
			        </span>
		        <span class="result-amount"><asp:Literal ID="grantAwardOutput" runat="server" /></span>
	        </li>
	        <li>
		        <span class="result-label">
			        Self Help Award
			        <span class="description">Estimated total amount of student loans and Work-Study you will be offered in your Financial Aid Award Letter</span>
		        </span>
		        <span class="result-amount"><asp:Literal ID="selfHelpAwardOutput" runat="server" /></span>
	        </li>
	        <li>
		        <span class="result-label">
			        Family Help Award
			        <span class="description">Estimated total amount of parent loans and private loan eligiblity you will be offered in your Financial Aid Award Letter</span>
		        </span>
		        <span class="result-amount"><asp:Literal ID="familyHelpAwardOutput" runat="server" /></span>
	        </li>
        </ul>

        <h3>Estimated Total Price of Attendance</h3>

        <ul class="results">
	        <li>
		        <span class="result-label">
			        Tuition and Fees
			        <span class="description">Includes cost of education and miscellaneous university fees</span>
		        </span>
		        <span class="result-amount"><asp:Literal ID="tuitionFeesOutput" runat="server" /></span>
	        </li>
	        <li>
		        <span class="result-label">
			        Room and Board
			        <span class="description">Includes rent, food, and utilities</span>
		        </span>
		        <span class="plus-operator">+</span>
		        <span class="result-amount"><asp:Literal ID="roomBoardOutput" runat="server" /></span>
	        </li>
	        <li>
		        <span class="result-label">
			        Books and Supplies
			        <span class="description">Includes books and supplies</span>
		        </span>
		        <span class="plus-operator">+</span>
		        <span class="result-amount"><asp:Literal ID="booksSuppliesOutput" runat="server" /></span>
	        </li>
	        <li>
		        <span class="result-label">
			        Other Expenses
			        <span class="description">Includes transportation and miscellaneous personal expenses</span>
		        </span>
		        <span class="plus-operator">+</span>
		        <span class="result-amount"><asp:Literal ID="otherExpensesOutput" runat="server" /></span>
	        </li>
	        <li>
		        <span class="result-label">
			        Health Insurance Fee
			        <span class="description">The UC health insurance fee</span>
		        </span>
		        <span class="plus-operator">+</span>
		        <span class="result-amount"><asp:Literal ID="healthInsuranceOutput" runat="server" /></span>
	        </li>
	        <li class="total">
		        <span class="result-label">
			        Total Cost of Attendance
			        <span class="description">The total cost of attendance</span>
		        </span>
		        <span class="result-amount"><asp:Literal ID="totalCostOutput" runat="server" /></span>
	        </li>
	        <li>
		        <span class="result-label">
			        Grant Award
			        <span class="description">Total estimated Grant Award</span>
		        </span>
		        <span class="minus-operator">-</span>
		        <span class="result-amount"><asp:Literal ID="estimatedGrantOutput" runat="server" /></span>
	        </li>
	        <li class="total">
		        <span class="result-label">
			        Estimated Net Cost
			        <span class="description">The total cost of attendance that you must contribute towards your education through either loans or out-of-pocket expense</span>
		        </span>
		        <span class="result-amount"><asp:Literal ID="estimatedNetCostOutput" runat="server" /></span>
	        </li>
        </ul>
        
        <p id="cohort-notice">
	        <strong><asp:Literal ID="percentageGrantOutput" runat="server" />%</strong> of first-year full-time independent, undergraduate students received grant aid in 2017-2018
        </p>

        <span class="button-wrapper">
            <a href="Independent.aspx" class="button">&laquo; Return to Calculator</a>
        </span>

    </asp:Placeholder>

</asp:Content>