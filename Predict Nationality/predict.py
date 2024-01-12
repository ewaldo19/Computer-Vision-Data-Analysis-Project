import requests
import json
import os

url = "https://v2.namsor.com/NamSorAPIv2/api2/json/countryBatch"

payload = {
    #Input the author names based on conference of each year
    'personalNames': []
}

headers = {
    "X-API-KEY": "", # Insert Valid API Key
    "Accept": "application/json",
    "Content-Type": "application/json"
}

response = requests.request("POST", url, json=payload, headers=headers)

try:
    response_json = json.loads(response.text)

    data_list = response_json.get("personalNames", [])

    # Define the specific folder name
    folder_path = "cvpr"

    # Check if the folder exist or not, if it doesn't exist, it will automatically create it
    if not os.path.exists(folder_path):
        os.makedirs(folder_path)

    # Define the file name
    file_path = os.path.join(folder_path, "cvpr2023_author_nationality.json")

    # Open the file with the full path
    with open(file_path, "w") as json_file:
        json.dump(data_list, json_file, indent=4)
    print("Data saved successfully")

except json.JSONDecodeError:
    # If the response is not valid JSON, print the raw text
    print(response.text)