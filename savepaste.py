import sys
import requests
expiry_date = '1M'
if len(sys.argv) < 2:
	raise ValueError('Format: savepaste <text> [<expiry>]')
elif len(sys.argv) == 3:
	expiry_date = sys.argv[2]
params = (
    ('api_option', 'paste'),
    ('api_user_key', ''),
    ('api_paste_private', '2'),
    ('api_paste_name', 'somename'),
    ('api_paste_expire_date', expiry_date),
    ('api_paste_format', 'python'),
    ('api_dev_key', '<API_KEY>'),
    ('api_paste_code', sys.argv[1]),
)

r=requests.post('https://pastebin.com/api/api_post.php', data=params)

content = r.content
listc=content.split('/')
listc.insert(3, 'raw')
content='/'.join(listc)
print content
