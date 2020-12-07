import urllib3
def handler(event, context):
  http = urllib3.PoolManager()
  r = http.request('GET', 'https://ip-ranges.amazonaws.com/ip-ranges.json')
  
  return r.data

