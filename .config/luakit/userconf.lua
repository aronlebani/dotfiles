local settings = require "settings"

settings.window.home_page = "https://lebani.dev/quicklinks"
settings.window.new_tab_page = "https://lebani.dev/quicklinks"

settings.window.search_engines = {
	default = "https://duckduckgo.com?q=%s",
	github = "https://github.com/search?q=%s",
	wikipedia = "https://en.wikipedia.org/wiki/Special:Search?search=%s",
    mdn = "https://developer.mozilla.org/en-US/search?q=%s",
    wayback = "http://web.archive.org/web/*/%s",
    clhs = "http://www.xach.com/clhs?q=%s",
    so = "https://stackoverflow.com/search?q=%s",
    esp = "https://spanishdict.com/translate/%s",
}

local downloads = require "downloads"

downloads.default_dir = os.getenv("HOME") .. "/temp"

local webinspector = require "webinspector"

local adblock = require "adblock"
