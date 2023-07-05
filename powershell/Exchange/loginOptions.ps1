$user = "EMAIL"
$creds = Get-Credential -UserName $user -Message "Add Password"

# Install the Exchange Online Module
Install-Module -Name ExchangeOnlineManagement -Force

# Import the Exchange Online Module
Import-Module -Name ExchangeOnlineManagement

# Connect to Exchange Online using modern authentication
Connect-ExchangeOnline - Credential $creds -ShowProgress $true

# Install the Microsft Graph Module
Install-Module Microsoft.Graph

# Import the Microsoft Graph Module
Select-MgProfile -Name "beta"
Import-Module Microsoft.Graph

# Connect for managing mailboxes and mail
Connect-MgGraph -Scopes "Mail.ReadWrite", "Mail.ReadWrite.Shared", "MailboxSettings.ReadWrite"
