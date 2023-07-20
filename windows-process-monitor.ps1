# Function to get process information
function Get-ProcessInfo {
    Get-Process | Select-Object ProcessName, Id, CPU, WorkingSet, StartTime
}

# Set the duration of monitoring in seconds (adjust as needed)
$monitoringDuration = 345600 # specify duration in seconds
$collectionInterval = 60 # specify in seconds to collect info

$endTime = (Get-Date).AddSeconds($monitoringDuration)

$processInfoArray = @()

while ((Get-Date) -lt $endTime) {
    $processInfoArray += Get-ProcessInfo
    Start-Sleep -Seconds $collectionInterval
}

# Export the data to a CSV file
$csvPath = "process_data.csv"
$processInfoArray | Export-Csv -Path $csvPath -NoTypeInformation


#How to Run Script :
#1. you can directly run script using powershell
#2. powershell.exe -windowstyle hidden -file C:\windows-process-monitor.ps1
