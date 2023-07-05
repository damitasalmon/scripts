
# Connect to Exchange Online using modern authentication
Connect-ExchangeOnline 

# Install the Microsft Graph Module
Install-Module Microsoft.Graph -Force

# Import the Microsoft Graph Module
Select-MgProfile -Name "beta"
Import-Module Microsoft.Graph