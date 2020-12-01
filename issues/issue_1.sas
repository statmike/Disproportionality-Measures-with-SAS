data data001;
   infile datalines delimiter='	';
   input drug $ ae $ nij;
   datalines;
A	X	3
A	Y	17
A	Z	4
A	P	19
A	Q	8
A	R	20
A	S	18
A	T	16
A	U	13
A	V	20
B	X	3
B	Y	13
B	Z	16
B	P	5
B	Q	8
B	R	12
B	S	1
B	T	1
B	U	12
B	V	18
C	X	4
C	Y	12
C	Z	14
C	P	19
C	Q	14
C	R	14
C	S	5
C	T	9
C	U	5
C	V	18
D 	X	13
D	Y	12
D	Z	14
D	P	6
D	Q	2
D	R	8
D	S	1
D	T	16
D	U	17
D	V	19
;
run;

data data001b; set data001;
	do i = 1 to Nij;
		caseid=_n_+i/1000;
		output;
	end;
run;

%include "/Local_Files/Disproportionality-Measures-with-SAS/Macros/create2x2.sas";

%create2x2(data001b,data002,caseid,drug,ae);


