from datetime import datetime, timedelta
import os
import subprocess

# Get today's date
today = datetime.today()

# Calculate the number of days until Friday (4 days after Monday)
days_until_friday = (4 - today.weekday() + 7) % 7

# Get the date of Friday of the current week
friday_date = today + timedelta(days_until_friday)

# Format the date as MMDDYY
friday_date_str = friday_date.strftime('%m%d%y')

# Interpolate the date into a folder name - ADD FILE PATH
folder_name = f"C:\\Users\\...\\...\\..AS OF {friday_date_str}"

# Create the folder
os.makedirs(folder_name, exist_ok=True)
print(f"The folder '{folder_name}' has been created.")
