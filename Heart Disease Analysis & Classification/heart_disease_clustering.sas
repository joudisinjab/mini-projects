PROC IMPORT 
DATAFILE = 
OUT = heart_disease
DBMS = csv replace;
GETNAMES = yes;
RUN;

/* Printing First 10 Observations of Heart Disease Dataset */
PROC PRINT DATA = heart_disease(OBS = 10);
TITLE "Heart Disease Dataset";
RUN; 

/* Printing Heart Disease Dataset Contents */ 
PROC CONTENTS
DATA = heart_disease;
RUN;

/* Descriptive Analysis on Numerical Variables in Heart Disease Dataset */
PROC MEANS 
DATA = heart_disease;
var age trestbps chol thalach oldpeak;
RUN;

/* Descriptive Analysis on Categorical Variables in Heart Disease Dataset */ 
PROC FREQ
DATA = heart_disease;
TABLES sex cp fbs restecg exang slope thal target; 
RUN;

/* Applying Standardization to Numeric Features in Heart Disease Dataset */ 
PROC STDIZE
DATA = heart_disease
METHOD = std
OUT = stand_HD; 
VAR age trestbps chol thalach oldpeak;
RUN;

/* Printing First 10 Observations of Standardized Heart Disease Dataset */
PROC PRINT DATA = stand_HD (OBS = 10);
TITLE "Standardized Heart Disease Dataset";
RUN;

/* Visualizing Original Heart Disease Dataset */
PROC SGPLOT
DATA = heart_disease;
SCATTER X = age Y = chol / GROUP = target;
TITLE "Scatterplot of Heart Disease Dataset";
RUN; 

/* Appling K-Means Clustering to Standardized Heart Disease Dataset */ 
%MACRO doFASTCLUS; 
	%DO k = 2 %TO 5;
			TITLE "HD Clusters with &k-Means";
			PROC FASTCLUS
				DATA = stand_HD
				OUT = HD_Clusters
				MAXITER = 100
				MAXCLUSTERS = &k
				SUMMARY;
			RUN;
			
			/* Scatter Plot of Clusters */
       		PROC SGPLOT DATA = HD_Clusters;
            	SCATTER X = age Y = chol / DATALABEL = Cluster
            	GROUP = Cluster;
            	TITLE "Scatterplot of HD Clusters with &k-Means";  
        	RUN;
	%END;
%MEND;
%doFASTCLUS;