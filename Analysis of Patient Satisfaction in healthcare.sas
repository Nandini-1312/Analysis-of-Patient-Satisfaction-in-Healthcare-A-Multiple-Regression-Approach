filename detain '/home/u63997746/';
	data Hw8_patientsatisfaction;
		infile detain("patientsatisfaction.txt") ;
		input   Satisfaction_Score Patient_Age Length_of_Stay No_of_Nurses_Attended Average_Staff_Visits;
run;
proc means data=Hw8_patientsatisfaction mean std min median max;
    var  Satisfaction_Score Patient_Age Length_of_Stay No_of_Nurses_Attended Average_Staff_Visits;
run;




proc corr data=Hw8_patientsatisfaction;
    var Satisfaction_Score Patient_Age Length_of_Stay No_of_Nurses_Attended Average_Staff_Visits;
run;


proc corr data=Hw8_patientsatisfaction fisher;
    var Satisfaction_Score;
    with Average_Staff_Visits;
run;


proc reg data=Hw8_patientsatisfaction;
    model Satisfaction_Score = Patient_Age Length_of_Stay No_of_Nurses_Attended Average_Staff_Visits;
run;




data future_patient;
    input Patient_Age Length_of_Stay No_of_Nurses_Attended Average_Staff_Visits;
    datalines;
    50 3 10 5
    ;
run;


data Updated_Hw8_patientsatisfaction;
    set Hw8_patientsatisfaction future_patient;
run;


proc reg data=Updated_Hw8_patientsatisfaction;
    model Satisfaction_Score = Patient_Age Length_of_Stay No_of_Nurses_Attended Average_Staff_Visits;
    output out=prediction p=Predicted lclm=LCLM uclm=UCLM lcl=LCL ucl=UCL;
run;


proc print data=prediction;
    where Satisfaction_Score = .;
run;


/* 4.h */

/* Full Model with all four predictors*/
proc reg data=Updated_Hw8_patientsatisfaction;
    model Satisfaction_Score = Patient_Age Length_of_Stay No_of_Nurses_Attended Average_Staff_Visits;
run;
quit;


/* Reduced Model with the number of nurses on the patient’s floor 
and the average daily visits by medical staff dropped from the model*/

proc reg data=Updated_Hw8_patientsatisfaction;
    model Satisfaction_Score = Patient_Age Length_of_Stay;
run;
quit;


/* Direct Approach to obtain F value*/
proc reg data=Updated_Hw8_patientsatisfaction;
    model satisfaction_score = Patient_Age Length_of_Stay No_of_Nurses_Attended Average_Staff_Visits;
    test No_of_Nurses_Attended = 0, Average_Staff_Visits = 0; 
run;
quit;


/* Finding critical F value */

data F_critical_value;
   alpha = 0.05;         
   df1 = 2;               
   df2 = 50;              
   F_critical = quantile('F', 1-alpha, df1, df2);  
 
run;


proc print data=F_critical_value;
    var F_critical;
run;




/* 4.i */

/* Model fit and residuals are obtained in a dataset */
proc reg data=Updated_Hw8_patientsatisfaction;
    model Satisfaction_Score = Patient_Age Length_of_Stay No_of_Nurses_Attended Average_Staff_Visits;
    output out=residuals_data r=residuals;
   
run;

/* performing Shapiro-Wilk test */
proc univariate data=residuals_data normal;
    var residuals;
    qqplot residuals / normal(mu=est sigma=est);
run;

/* Homoscedasticity */
proc reg data=Updated_Hw8_patientsatisfaction;
    model Satisfaction_Score = Patient_Age Length_of_Stay No_of_Nurses_Attended Average_Staff_Visits;
    output out=output_data r=residuals p=Predicted;
   
run;
proc sgplot data=output_data;
    scatter x=Predicted y=residuals;
    refline 0 / axis=y;
run;

/* Linearity */
proc sgplot data=output_data;
    scatter x=Predicted y=residuals / markerattrs=(symbol=circlefilled color=red);
    refline 0 / axis=y;
    xaxis label="Fitted Values";
    yaxis label="Residuals";
run;

