$computers = Import-Csv -Path "$PSScriptRoot\hostnames.csv"

$result = new-object System.Collections.ArrayList

foreach ($computer in $computers) {
   
   $obj = New-Object psobject | Select-Object -Property hostname, RDP

   $obj.hostname = $computer.hostname

   $obj.RDP = Test-NetConnection -ComputerName $computer.hostname -CommonTCPPort RDP | Select-Object -ExpandProperty TcpTestSucceeded

   $result.Add($obj) | out-null
    
}

DO 
{
    Clear-Host

    $result | Out-String -Stream

    $choice = Read-Host -Prompt "1) Export to CSV`r`nQ) Quit"

    switch ($choice)
    {
        1 { 
            if (Test-Path -Path "$PSScriptRoot\RDPed_hostnames.csv") {
                Remove-Item -Path "$PSScriptRoot\RDPed_hostnames.csv"
            }

            $result | Export-Csv -NoClobber -NoTypeInformation -Path "$PSScriptRoot\RDPed_hostnames.csv" -Force

            Write-Host -ForegroundColor Green "Exported"

          }
        q { break }
    }
} Until ($choice -ieq "Q" -or $choice -ieq 1)

Read-Host -Prompt "Press Enter to exit"