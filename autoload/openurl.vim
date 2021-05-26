py3 << EOF
def popen_url():
  import vim
  import re
  import os

  regex = re.compile('((https?):((//)|(\\\\))+([\w\d:#@%/;$()~_?\+-=\\\.&](#!)?)*)', re.DOTALL)

  line = vim.current.line
  urls = re.findall(regex,line)
  if urls:
    # collect found urls and enclose in single quotes
    found = [f"'{x[0]}'" for x in urls]
    urls_str = ' '.join(found)
    browser = vim.eval("g:open_url_browser")
    for url in found:
      os.system("%s %s" % (browser, url))

EOF

function! openurl#OpenURL()
  py3 popen_url()
endfunction


