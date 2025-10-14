. "C:\Users\champuser\SYS320-01\week6\Event-Logs.ps1"
. "C:\Users\champuser\SYS320-01\week6\Users.ps1"
. "C:\Users\champuser\SYS320-01\week7\Email.ps1"
. "C:\Users\champuser\SYS320-01\week7\Scheduler.ps1"
. "C:\Users\champuser\SYS320-01\week7\Configuration.ps1"
# Get config
$configuration = readConfig
# Get at risk users
$Failed = getAtRiskUsers $configuration.Days
# Send at risk users as email
SendAlertEmail ($Failed | Format-Table | Out-String)
# Set Script to run daily
ChooseTimeToRun($configuration.Days, $configuration.ExecutionTime)