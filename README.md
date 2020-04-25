# RDP Status - Batch Validation

<h3><b>Summary</b></h3>
This script was designed to validate a long list of hostnames and IP addresses with one command.  Simply modify the CSV that is in the root of this script with your own hostnames and IP Addresses and the script will validate the RDP Status for each hostname/IP address.  This script gives you the option to simply view the results in the console or export your results to a CSV file.

<h3><b>Usage</b></h3>

```powershell
isRDPEnabled.ps1 
```

simply run the command above and the script will look at the file <b>hostnames.csv</b> within the root of this script and will begin validating.  Modify <b>hostnames.csv</b> with your own hostnames/IP Addresses and your all set.