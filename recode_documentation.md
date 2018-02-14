<h1>
Recodes
</h1>
Here is a description of the recoding I did of the raw ANES data to produce the campaign participation (button-wearing, rally attendence, etc.) graphs and tables.
<br>
<br>
<h2> Yes and No </h2>
ANES data was listed as 1. No and 2. Yes. <br>
Recode:<br>
1. No == 2<br>
2. Yes == 1<br>
<br>
<h2> Party ID </h2>
Omitted NA and DKs <br>
Collapsed None + Neither + Other <br>

<h2> Omitting NAs </h2>
-Removed observations that had NAs across all three questions (VCF0718, VC0719, VCF0720)
-This accounted for 8,430 observations (reducing N from 55,674 to 47,244)
-Political mobilization questions were not asked in 1948, 1954, 1958, and 1966 waves
-Button question was not asked in 1952, which is a shame because that was probably a banner year for campaign chum:
![alt text](https://github.com/lizmckenna/ANES/images/i-like-ike-two-ike-button.jpg)
