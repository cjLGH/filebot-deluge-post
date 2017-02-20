## FileBot CLI
http://www.filebot.net/cli.html

FileBot Commands
```bash
-script fn:amc (Automated Media Center [https://github.com/filebot/scripts/blob/master/amc.groovy])
--action move (Creates directory where [seriesFormat, movieFormat] is pointing.)
--action test (Tests current commands without performing the action.)
   -non-strict (Opportunistic match mode, Rename mode: required for tricky filenames)
--log-file (Logging)
--def (Defenitions)
   excludeList="PATH" (Excludes list, keep from flooding)
   plex=HOST:TOKEN (Current setup [IP:TOKEN])
   seriesFormat (Formatting TV Series)
   movieFormat (Formatting Movies)
```

## Current FileBot CLI Scripts
```
filebot -script fn:amc --action duplicate -non-strict $PATH --log-file amc.log
filebot -script fn:amc --action test -non-strict $PATH --log-file amc.log
```

## Naming Schemes ([FileBot Forums](https://www.filebot.net/forums/viewtopic.php?f=5&t=2#p51))
### Movies
```
--def "movieFormat=$PATH/{n} ({y})/{n} ({y})"
```
### TV Shows
```
--def "seriesFormat=$PATH/{n}/{'Season '+s.pad(2)}/{n} - {'s'+s.pad(2)}{'e'+e.pad(2)} - {t}"
```
### Music
```
--def music=y musicFormat="/media/sdb/Music/{n}/{album+'/'}{pi.pad(2)} {t}"
```
