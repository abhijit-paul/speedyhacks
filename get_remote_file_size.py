import requests
import sys
r=requests.get(sys.argv[1])
print len(r.content)/1024, "KB"
