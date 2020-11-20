import os

c.NotebookApp.allow_origin = os.environ.get("NOTEBOOK_ALLOW_ORIGIN", '')
c.NotebookApp.cookie_secret = os.environ.get("NOTEBOOK_COOKIE_SECRET", "").encode()
c.NotebookApp.local_hostnames = os.environ.get("NOTEBOOK_LOCAL_HOSTNAMES", "localhost").split(",")
c.NotebookApp.password = os.environ.get("PASSWORD", 'argon2:$argon2id$v=19$m=10240,t=10,p=8$1NZ/QILz1C9C8+MAqlnK/A$jQqwCgWZPWJsZwcRkpmRWQ')

c.NotebookApp.allow_root = True
c.NotebookApp.enable_mathjax = os.environ.get("NOTEBOOK_DISABLE_MATHJAX", "").lower() in ("", "0", "disable", "no", "false")
c.NotebookApp.ip = os.environ.get("NOTEBOOK_LISTEN_IP", "0.0.0.0")
c.NotebookApp.port = int(os.environ.get("NOTEBOOK_PORT", "8888"))
c.NotebookApp.notebook_dir = os.environ.get("NOTEBOOK_NOTEBOOK_DIR", "/data")

c.NotebookApp.base_url = os.environ.get('NOTEBOOK_BASE_URL', '/')
c.NotebookApp.custom_display_url = os.environ.get("NOTEBOOK_CUSTOM_DISPLAY_URL", '')
c.NotebookApp.custom_display_url = os.environ.get("NOTEBOOK_DEFAULT_URL", '/tree')

c.NotebookApp.open_browser = False
c.NotebookApp.webbrowser_open_new = 2
try:
    c.NotebookApp.webbrowser_open_new = int(os.environ.get("NOTEBOOK_OPEN_NEW", "2")) % 3
except:
    pass
