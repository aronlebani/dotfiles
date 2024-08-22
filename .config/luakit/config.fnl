(local settings (require :settings))

(settings.window.home_page "https://lebani.dev/quicklinks")

(local downloads (require :downloads))

(downloads.default_dir (.. (os.getenv "HOME") "/temp"))
