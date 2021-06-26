ruby << EOF
  def open_url()
    re = %r{(?i)\b((?:[a-z][\w-]+:(?:/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\((?:[^\s()<>]+|(?:\([^\s()<>]+\)))*\))+(?:\((?:[^\s()<>]+|(?:\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))}

    line = VIM::Buffer.current.line
    urls = line.scan(re).flatten

    if urls.empty?
      VIM::message("No URL found in line.")
    else
      system(VIM::evaluate("g:open_url_browser"), *urls)
      VIM::message(urls.join(" and "))
    end
  end
EOF


py3 << EOF
def popen_url():
  import vim
  import re
  import os

  regex = re.compile('((https?):((//)|(\\\\))+([\w\d:#@%/;$()~_?\+-=\\\.&](#!)?)*)', re.DOTALL)

  line = vim.current.line
  urls = re.findall(regex,line)
  if urls:
    found = [f"'{x[0]}'" for x in urls]
    urls_str = ' '.join(found)
    #vim.system(vim.evaluate("g:open_url_browser"),  'http:://www.spiegel.de') # ','.join(urls))
    #os.system("%s %s" % (vim.eval("g:open_url_browser"), urls_str))
    for url in found:
      #os.system("%s %s" % ('firefox', urls_str))
      os.system("%s %s" % (vim.eval("g:open_url_browser"), url))

EOF

py3 << EOF
def testme():
  import os
  os.system('geeqie')
EOF

function! openurl#OpenURL()
  "ruby open_url
  py3 popen_url()
endfunction


