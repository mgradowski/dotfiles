c.backend = 'webengine'
c.content.autoplay = False
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
c.content.headers.user_agent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.2 Safari/605.1.15'
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version} Edg/{upstream_browser_version}', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')
c.content.host_blocking.enabled = True
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
config.set('content.media.audio_capture', False, 'https://www.messenger.com')
config.set('content.media.audio_video_capture', False, 'https://www.messenger.com')
config.set('content.media.video_capture', False, 'https://www.messenger.com')
config.set('content.notifications', False, 'https://www.reddit.com')
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
