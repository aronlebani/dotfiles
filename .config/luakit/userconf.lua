local settings = require "settings"
local downloads = require "downloads"
local webinspector = require "webinspector"
local adblock = require "adblock"

settings.window.home_page = "https://old.reddit.com/new"
settings.window.new_tab_page = "https://lebani.dev/quicklinks"
settings.window.reuse_new_tab_pages = true
settings.window.default_search_engine = "duckduckgo"

downloads.default_dir = os.getenv("HOME") .. "/temp"
