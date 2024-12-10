# To reload this config, run :config-source in browser.

# Downloads
c.downloads.location.prompt = True
c.downloads.location.directory = "~/temp/"

# Bookmarklets
# They don't work, so the workaround is to set up aliases for each bookmarklet. See
# [this issue](https://github.com/qutebrowser/qutebrowser/issues/221).
c.aliases.update({ "bugmenot": "jseval --url javascript: (function() { var url = ('http://www.bugmenot.com/view/' + escape(location.hostname)); w = open(url, 'w', 'location=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=500,height=400,modal=yes,dependent=yes'); if (w) { setTimeout('w.focus()', 1000) } else { location = url } })();" })
c.aliases.update({ "font": "jseval --url javascript: void((function(d)%7Bvar%20e=d.createElement('script');e.setAttribute('type','text/javascript');e.setAttribute('charset','UTF-8');e.setAttribute('src','https://www.typesample.com/assets/typesample.js?r='+Math.random()*99999999);d.body.appendChild(e)%7D)(document));" })
c.aliases.update({ "edit": "jseval --url javascript: document.body.contentEditable = 'true'; document.designMode = 'on'; void 0" })
c.aliases.update({ "nostyle": "jseval --url javascript: (function() { var i, x; for (i = 0; x = document.styleSheets[i]; ++i) x.disabled = true; })();" })
c.aliases.update({ "fullurl": "jseval --url javascript: (function() { var i, c, x, h; for (i = 0; x = document.links[i]; ++i) { h = x.href; x.title += " " + x.innerHTML; while (c = x.firstChild) x.removeChild(c); x.appendChild(document.createTextNode(h)); } })()" })
c.aliases.update({ "opengraph": "jseval --url javascript: (function(){if(window.ouiseo === undefined){var jsCode=document.createElement('script');jsCode.setAttribute('src', '//carlsednaoui.s3.amazonaws.com/ouiseo/ouiseo.min.js');document.body.appendChild(jsCode);}else if(!!window.ouiseo && !document.getElementById('ouiseo')){ouiseo();}else{console.log('ouiseo is already open');}})();" })

# Start page
c.url.start_pages = ["https://lebani.dev/quicklinks.html"]
c.url.default_page = "https://lebani.dev/quicklinks.html"

# Privacy and security
# Note, these all support URL patterns, so it is possible to adjust them on a site-by-site basis.
c.content.blocking.enabled = True   # Enable the add blocker
c.content.cookies.accept = "no-3rdparty"
c.content.headers.do_not_track = True
c.content.javascript.enabled = True
c.content.notifications.enabled = False
c.content.autoplay = False

# Visual
c.tabs.position = "bottom"
c.tabs.indicator.width = 0
c.statusbar.position = "bottom"
c.completion.height = 300

# Keybindings
config.bind("<Ctrl-h>", "tab-prev")
config.bind("<Ctrl-l>", "tab-next")
config.bind("<Ctrl-o>", "cmd-set-text -s :open -ts")

# Load this config instead of config from UI
config.load_autoconfig(False)
