; CLIPS batch file — load via IDE: File -> Load Batch...
; Or from clipsdos:  CLIPS> (batch "run.bat")
(clear)
(load "data.clp")
(load "main.clp")
(watch facts)
(watch rules)
(start)
(facts)
