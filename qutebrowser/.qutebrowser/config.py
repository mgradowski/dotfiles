config.load_autoconfig()
c.backend = 'webengine'
c.content.autoplay = False
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
c.content.blocking.method = 'auto'
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
c.editor.command = ['vim', '-f', '{file}', '-c', 'normal {line}G{column0}l']
c.scrolling.bar = 'never'
c.scrolling.smooth = False
c.tabs.position = 'bottom'
c.tabs.show = 'always'
c.tabs.title.format = '{audio}{index}: {current_title}'
c.url.searchengines = {'DEFAULT': 'https://google.com/search?q={}'}
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('M', "hint links spawn mpv --hwdec=auto '{hint-url}'")
config.bind('m', "spawn mpv --hwdec=auto '{url}'")
config.bind(',p', 'spawn --userscript qute-pass')

