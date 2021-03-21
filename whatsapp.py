import base64
with open("object-detection.jpg", "rb") as img_file:
    my_string = base64.b64encode(img_file.read())
#print("data:image/jpeg;base64,"+str(my_string))
import requests
phonenumber = "917845671280","919003366217","919884915977","919843846458"
body = str(my_string,'utf-8')
for phone in phonenumber:
    print (phone)
    url = "https://api.chat-api.com/instance241711/sendFile?token=xtomvz79mpfs1fer"
    data = {
    "phone": phone,
    "body": "data:image/jpeg;base64,"+body,
    "caption": "RED ALERT!! Intruder detected Please check the mail for more info",
    "filename": "detection.jpg"
    }
    req = requests.post(url, json=data)
    print(req)