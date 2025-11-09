%let pgm=utl-altair-slc-separate-invoices-for-a-mailing-list-and-adressing-tools;

https://community.altair.com/discussion/19505?tab=all

Altair slc separate invoices for a mailing list and adressing tools

Too long to post in a listserv, see github for complete solution

github
https://github.com/rogerjdeangelis/utl-altair-slc-separate-invoices-for-a-mailing-list-and-adressing-tools

  CONTENTS

     1 Split invoices into separate files
     2 Tools for mailing lists and geocoding,

OPS PROBLEM

I have a file with 1000 statements that need to be separated in order to be printed and mailed.
Normally, this would be handled by an outside mailing provider,
but we no longer have access to that resource.  I have been asked
to see if I can accomplish this task.  Reaching out to my colleagues for
discussion regarding, if this is something that can be handled by Data Prep and what
would the concept look like.  I have attached 3 of the statements as it appears in the file.

My interpretaion
If you just want to separate the invoices in separate files.

Note it is  easy to standardize and verify the home or business address exists.
However the occupants name is not availbale in any of my databases,
You have to use 'Current Resident' in the mailpeice.
I do have every address in the US , 141 million addresses, you can check against.

THIS CODE WILL SPLIT THE INVOICES INTO 1000 FILES

data _null_;

  length fname $32;
  retain fyl 0 fname;

  infile "d:/txt/invoices.txt";

  input;
  if index(_infile_,'Page:') then do;
     fyl=fyl+1;
     fname = cats("d:/txt/file", put(fyl, 8.), ".txt");
     file dummy filevar=fname;
     put _infile_;
  end;
  else do;
     fname = cats("d:/txt/file", put(fyl, 8.), ".txt");
     file dummy filevar=fname;
     put _infile_;
     * putlog _infile_;
  end;

run;quit;

/*            _ _ _     _                 _
/ | ___ _ __ | (_) |_  (_)_ ____   _____ (_) ___ ___  ___
| |/ __| `_ \| | | __| | | `_ \ \ / / _ \| |/ __/ _ \/ __|
| |\__ \ |_) | | | |_  | | | | \ V / (_) | | (_|  __/\__ \
|_||___/ .__/|_|_|\__| |_|_| |_|\_/ \___/|_|\___\___||___/
 _     |_|           _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

Save the attachement LAS6202-75D_test.txt to d:/txt/invoices.txt

https://us.v-cdn.net/6038102/uploads/attachments/66a4afcbdbe9fc50e8863978f49619c6/LAS6202-75D_test.txt

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

/*--- only needed for development or testing. Production does not need this ---*/
/*--- files will automaticall be rewritten                                  ---*/

%utlfkil(d:/txt/file1.txt);
%utlfkil(d:/txt/file2.txt);
%utlfkil(d:/txt/file3.txt);

&_init_;
data _null_;

  length fname $32;
  retain fyl 0 fname;

  infile "d:/txt/invoices.txt";

  input;
  if index(_infile_,'Page:') then do;
     fyl=fyl+1;
     fname = cats("d:/txt/file", put(fyl, 8.), ".txt");
     file dummy filevar=fname;
     put _infile_;
  end;
  else do;
     fname = cats("d:/txt/file", put(fyl, 8.), ".txt");
     file dummy filevar=fname;
     put _infile_;
     * putlog _infile_;
  end;

run;quit;

/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/

d:/txt/file1.txt
d:/txt/file2.txt
d:/txt/file3.txt

FILE1.TST

/***********************************************************************************************/
/*                                                                                             */
/*  FILES CREATED                                                                              */
/*                                                                                             */
/*    d:/txt/file1.txt                                                                         */
/*    d:/txt/file2.txt                                                                         */
/*    d:/txt/file3.txt                                                                         */
/*                                                                                             */
/*---------------------------------------------------------------------------------------------*/
/*                                                                                             */
/* FILE1.TXT                                                                                   */
/*                                                                         Page:    1          */
/*                                               Note:      XXXXXXXXXXXXXX  07/23/2021         */
/*                                                                                             */
/*                                                                                             */
/*                                                                                             */
/*                                                                                             */
/*                                                                                             */
/*                                                                                             */
/*                                                                                             */
/*                                                                                             */
/*                                                                                             */
/*                                                                                             */
/*                                                                                             */
/*                                                                                             */
/*                         XXXXXXXXXXX                                                         */
/*                         XXXXXXXXXXXXXX                                                      */
/*                         XXXXXXXXXXXXXXXXXXXXXXX                                             */
/*                                                                                             */
/*                                                                                             */
/*                                                                                             */
/*                  Statement of (40) OVERDRAFT PROTECTION CONSUMER Note                       */
/*                              From 06/23/21 Thru 07/23/21                                    */
/*    ================================================================================         */
/*                             -----Payment Split-----     Transaction       Principal         */
/*      Date   Description     Principal      Interest        Amount          Balance          */
/*    ================================================================================         */
/*                                                                                             */
/*    06/23/21 Beginning Balance                                                482.09         */
/*    07/15/21 Regular Payment     18.10          6.90           25.00          463.99         */
/*                                                                                             */
/*    - - - - - - -  F i n a n c e   C h a r g e   C a l c u l a t i o n  - - - - - -          */
/*      From      ** Annual **   Daily Periodic                             Accrued            */
/*      Date     Percentage Rate      Rate              Principal Days  Finance Charge         */
/*    06/23/21      18.000000     .00049315                482.09   22           5.23          */
/*    07/15/21      18.000000     .00049315                463.99    9           2.05          */
/*                                                                                             */
/*    - - - - - - - - - - - - S t a t e m e n t   S u m m a r y - - - - - - - - - - -          */
/*     Principal Advances:                .00  Principal Paid:                  18.10          */
/*     Finance Charges Paid:             6.90                                                  */
/*                                                                                             */
/*                     Finance Charge Paid 2021:                48.83                          */
/*                                                                                             */
/*    ~BFOOT                                                                                   */
/*    V:~~                                                                                     */
/*    2:00001~3:0~5:XXXXXXXXX~8:01007~9:000~~                                                  */
/*    ~AFOLDER                                                                                 */
/*    1:154~4:NOTE XXXXXXXXXXX~6:XXX-XX-XXXX~7:XXXXXXXXXXX~~                                   */
/*    ~EFOOT                                                                                   */
/*                                                                                             */
/*                                                                                             */
/*                                                                                             */
/*                                                                                             */
/***********************************************************************************************/
/*
| | ___   __ _
| |/ _ \ / _` |
| | (_) | (_| |
|_|\___/ \__, |
         |___/
*/

1                                          Altair SLC       11:07 Sunday, November  9, 2025

NOTE: Copyright 2002-2025 World Programming, an Altair Company
NOTE: Altair SLC 2026 (05.26.01.00.000758)
      Licensed to Roger DeAngelis
NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
NOTE: AUTOEXEC source line
1       +  ï»¿;;;;
           ^
ERROR: Expected a statement keyword : found "ï"

NOTE: 1 record was written to file PRINT

NOTE: The data step took :
      real time : 0.034
      cpu time  : 0.000


NOTE: AUTOEXEC processing completed

1
2         /*--- only needed for development or testing. Production does not need this ---*/
3         /*--- files will automaticall be rewritten                                  ---*/
4
5         %utlfkil(d:/txt/file1.txt);
6         %utlfkil(d:/txt/file2.txt);
7         %utlfkil(d:/txt/file3.txt);
8
9         &_init_;
10        data _null_;
11
12          length fname $32;
13          retain fyl 0 fname;
14
15          infile "d:/txt/invoices.txt";
16
17          input;
18          if index(_infile_,'Page:') then do;
19             fyl=fyl+1;
20             fname = cats("d:/txt/file", put(fyl, 8.), ".txt");
21             file dummy filevar=fname;
22             put _infile_;
23          end;
24          else do;
25             fname = cats("d:/txt/file", put(fyl, 8.), ".txt");
26             file dummy filevar=fname;
27             put _infile_;
28             * putlog _infile_;
29          end;
30
31        run;

NOTE: The infile 'd:\txt\invoices.txt' is:
      Filename='d:\txt\invoices.txt',
      Owner Name=T7610\Roger,
      File size (bytes)=5695,
      Create Time=10:43:22 Nov 09 2025,
      Last Accessed=11:06:58 Nov 09 2025,
      Last Modified=10:43:22 Nov 09 2025,
      Lrecl=32767, Recfm=V

NOTE: The file  is:
      Filename='d:\txt\file1.txt',

2

      Owner Name=T7610\Roger,
      File size (bytes)=0,
      Create Time=10:16:32 Nov 09 2025,
      Last Accessed=11:07:19 Nov 09 2025,
      Last Modified=11:07:19 Nov 09 2025,
      Lrecl=32767, Recfm=V

NOTE: The file  is:
      Filename='d:\txt\file2.txt',
      Owner Name=T7610\Roger,
      File size (bytes)=0,
      Create Time=10:16:32 Nov 09 2025,
      Last Accessed=11:07:19 Nov 09 2025,
      Last Modified=11:07:19 Nov 09 2025,
      Lrecl=32767, Recfm=V

NOTE: The file  is:
      Filename='d:\txt\file3.txt',
      Owner Name=T7610\Roger,
      File size (bytes)=0,
      Create Time=10:16:32 Nov 09 2025,
      Last Accessed=11:07:19 Nov 09 2025,
      Last Modified=11:07:19 Nov 09 2025,
      Lrecl=32767, Recfm=V

NOTE: 155 records were read from file 'd:\txt\invoices.txt'
      The minimum record length was 1
      The maximum record length was 80
NOTE: 50 records were written to file
      The minimum record length was 1
      The maximum record length was 80
NOTE: The data step took :
      real time : 0.007
      cpu time  : 0.000


31      !     quit;
32
ERROR: Error printed on page 1

NOTE: Submitted statements took :
      real time : 0.137
      cpu time  : 0.093


/*___    _              _        __                              _ _
|___ \  | |_ ___   ___ | |___   / _| ___  _ __   _ __ ___   __ _(_) |
  __) | | __/ _ \ / _ \| / __| | |_ / _ \| `__| | `_ ` _ \ / _` | | |
 / __/  | || (_) | (_) | \__ \ |  _| (_) | |    | | | | | | (_| | | |
|_____|  \__\___/ \___/|_|___/ |_|  \___/|_|    |_| |_| |_|\__,_|_|_|

*/

Select address from d:/git/git_010_repos.sasbdat

REPO
---------------------------------------------------------------------------------------------------------------------------
https://github.com/rogerjdeangelis/utl-classic-matrix-problem-ordering-data-using-a-column-of-pointers-indirect-addressing
https://github.com/rogerjdeangelis/utl-dept-of-trans-address-database-to-sas-wps-tables-for-geocoding-and-reverse-geocoding
https://github.com/rogerjdeangelis/utl-free-unlimited-geocoding-reverse-geocoding-wps-aprox-I41-million-addresses-with-gps
https://github.com/rogerjdeangelis/utl-given-a-list-of-messy-addresses-geocode-and-reverse-geocode-using-us-address-database
https://github.com/rogerjdeangelis/utl-indirect-addressing-indexed-lookup-in-sas-r-and-python-sql-multi-language
https://github.com/rogerjdeangelis/utl-indirect-addressing-to-access-variable-names
https://github.com/rogerjdeangelis/utl-ipv4-ipaddress-in-four-binary-bytes-or-five-or-fewer-printable-characters
https://github.com/rogerjdeangelis/utl-join-us-addresses-with-census-acs-five-yr-block-group-data-most-granular
https://github.com/rogerjdeangelis/utl-openaddress-database-to-sas-wps-tables-for-geocoding-and-reverse-geocoding
https://github.com/rogerjdeangelis/utl-standardize-address-suffix-using-usps-abreviations
https://github.com/rogerjdeangelis/utl-use-geo-fencing-to-find-all-addresses-in-a-latitude-longitude-quadrangle-reverse-geocoding
https://github.com/rogerjdeangelis/utl-validate-email-address-and-domain-python
https://github.com/rogerjdeangelis/utl-wordcloud-past-participle-verbs-in-two-inaugural-addresses
https://github.com/rogerjdeangelis/utl_US_address-standardization
https://github.com/rogerjdeangelis/utl_checking_a_valid_telephone_number_ssns_and_email_address
https://github.com/rogerjdeangelis/utl_geocode_and_reverse_geocode_netherland_addresses_and_latitudes_longitudes
https://github.com/rogerjdeangelis/utl_web_scrape_23_separate_pages_one_per_state_for_all_whole_food_store_addresses

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
