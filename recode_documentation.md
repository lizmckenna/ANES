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
Except for 2016, when the question was asked in such a way as to collapse Independent and 'Other' (I coded these as Independent)<br>

<h2> Omitting NAs </h2>
-Removed observations that had NAs across all three questions (VCF0718, VC0719, VCF0720)
-This accounted for 8,430 observations (reducing N from 55,674 to 47,244)
-Political mobilization questions were not asked in 1948, 1954, 1958, and 1966 waves
-Button question was not asked in 1952, which is a shame because that was probably a banner year for I Like Ike campaign chum.

<h2> ANES questions </h2>
(Coded as Party): What political party are you registered with, if any?<br>
<br>
(Coded as Rally): Did you go to any political meetings, rallies, speeches, dinners, or things like
that in support of a particular candidate?<br>
<br>
(Coded as Button): Did you wear a campaign button, put a campaign sticker on your car, or
place a sign in your window or in front of your house?<br>
<br>
(Coded as Campaigned): Did you do any (other) work for one of the parties or candidates?<br>
