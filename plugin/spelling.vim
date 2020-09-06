" Command Abbreviations
cabbrev sord sort

" The following command abbreviation allows typing :tabv myfile.txt to view
" the specified file in a new tab; the buffer is read-only and nomodifiable so
" you cannot accidentally change it.
cabbrev tabv tab sview +setlocal\ nomodifiable

