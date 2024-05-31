# To reload this config, run :config-source in browser.

## Downloads

c.downloads.location.prompt = True

##  Bookmarklets

# They don't work, so the workaround is to set up aliases for each bookmarklet. See
# [this issue](https://github.com/qutebrowser/qutebrowser/issues/221).

c.aliases.update({ "bugmenot": "jseval --url javascript: (function() { var url = ('http://www.bugmenot.com/view/' + escape(location.hostname)); w = open(url, 'w', 'location=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=500,height=400,modal=yes,dependent=yes'); if (w) { setTimeout('w.focus()', 1000) } else { location = url } })();" })
c.aliases.update({ "font": "jseval --url javascript: void((function(d)%7Bvar%20e=d.createElement('script');e.setAttribute('type','text/javascript');e.setAttribute('charset','UTF-8');e.setAttribute('src','https://www.typesample.com/assets/typesample.js?r='+Math.random()*99999999);d.body.appendChild(e)%7D)(document));" })
c.aliases.update({ "edit": "jseval --url javascript: document.body.contentEditable = 'true'; document.designMode = 'on'; void 0" })
c.aliases.update({ "nostyle": "jseval --url javascript: (function() { var i, x; for (i = 0; x = document.styleSheets[i]; ++i) x.disabled = true; })();" })
c.aliases.update({ "fullurl": "jseval --url javascript: (function() { var i, c, x, h; for (i = 0; x = document.links[i]; ++i) { h = x.href; x.title += " " + x.innerHTML; while (c = x.firstChild) x.removeChild(c); x.appendChild(document.createTextNode(h)); } })()" })
c.aliases.update({ "opengraph": "jseval --url javascript: (function(){if(window.ouiseo === undefined){var jsCode=document.createElement('script');jsCode.setAttribute('src', '//carlsednaoui.s3.amazonaws.com/ouiseo/ouiseo.min.js');document.body.appendChild(jsCode);}else if(!!window.ouiseo && !document.getElementById('ouiseo')){ouiseo();}else{console.log('ouiseo is already open');}})();" })

## Start page

c.url.start_pages = ["https://lebani.dev/quicklinks.html"]
c.url.default_page = "https://lebani.dev/quicklinks.html"

## Search engines

c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "ecosia": "https://ecosia.org/search?q={}",
    "mdn": "https://developer.mozilla.org/en-US/search?q={}",
    "wayback": "http://web.archive.org/web/*/{}",
    "wikipedia": "https://en.wikipedia.org/w/index.php?title=Special:Search&search={}",
    "clhs": "http://www.xach.com/clhs?q={}",
    "so": "https://stackoverflow.com/search?q={}",
    "esp": "https://spanishdict.com/translate/{}",
}

## Privacy and security

# Note, these all support ULR patterns, so it is possible to adjust them on a site-by-site basis.

c.content.blocking.enabled = True   # Enable the add blocker
c.content.cookies.accept = "no-3rdparty"
c.content.headers.do_not_track = True
c.content.javascript.enabled = True
c.content.notifications.enabled = False

# Visual

black = "#000000"
red = "#aa0000"
green = "#44aa44"
yellow = "#aa5500"
blue = "#0039aa"
magenta = "#aa22aa"
cyan = "#1a92aa"
grey = "#aaaaaa"

c.tabs.position = "top"
c.tabs.indicator.width = 0
c.statusbar.position = "top"
c.colors.completion.odd.bg = black
c.colors.completion.even.bg = black
c.colors.completion.category.bg = blue
c.colors.completion.match.fg = yellow
c.colors.completion.item.selected.bg = cyan
c.colors.completion.item.selected.border.bottom = cyan 
c.colors.completion.item.selected.border.top = cyan
c.colors.completion.item.selected.match.fg = yellow
c.completion.height = 300

## Load this config instead of config from UI

config.load_autoconfig(False)
