import requests

url = 'http://localhost:32456/get/baa'
data = {'count': 3, 'order_type': 'uses'}

headers = {"Content-Type": "application/json; charset=utf-8"}
x = requests.get(url, json = data, headers=headers)
print(x.text)