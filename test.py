import requests
import os

url = "https://agricma-backend.onrender.com/api/imgdata/1"

payload = {}
files={}
headers = {
  'Authorization': 'YAAI5Vim.CDcomUFQOpsu7ZNoglbpi66pqUgEdaP7'
}

response = requests.request("GET", url, headers=headers, data=payload, files=files)
print(response)

# with open('media/images/api_img/trial.jpg', 'w') as image_file:
#     response = image_file.write(response.content)


# Check if the request was successful (status code 200)
if response.status_code == 200:
    # Specify the directory where you want to save the image
    directory_path = 'media/images/api_img/'
    
    # Create the directory if it doesn't exist
    os.makedirs(directory_path, exist_ok=True)

    # Specify the file path
    file_path = os.path.join(directory_path, 'example.jpg')

    # Open the file in binary write mode ('wb')
    with open(file_path, 'wb') as file:
        # Write the content of the response to the file
        file.write(response.content)

    print(f"Image saved to: {file_path}")
else:
    print(f"Failed to retrieve the image. Status code: {response.status_code}")

