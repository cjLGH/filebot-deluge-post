## FileBot CLI
http://www.filebot.net/cli.html

FileBot Commands
```bash
-script fn:amc (Automated Media Center [https://github.com/filebot/scripts/blob/master/amc.groovy])
--action move (Creates directory where [seriesFormat, movieFormat] is pointing.)
-non-strict (Opportunistic match mode, Rename mode: required for tricky filenames)
--log-file (Logging)
--def (Defenitions)
   excludeList="PATH" (Excludes list, keep from flooding)
   plex=HOST:TOKEN (Current setup [IP:TOKEN])
   seriesFormat (Formatting TV Series)
   movieFormat (Formatting Movies)
```

## Definitions
### Music
```
--def music=y musicFormat="/media/sdb/Music/{n}/{album+'/'}{pi.pad(2)} {t}"
```
