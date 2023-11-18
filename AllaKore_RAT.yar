rule AllaKore_RAT {
    meta:
        author = "Seyit (@h3xecute) - ThreatMon"
        description = "Detects the AllaKore RAT generally used by SideCopy"
        date = "06.11.2023"
        hash = "5893b58d6a6a772f8ecd491a4dace11007fd1aac90e5f4a0363288d1376e1ce5"
        
    strings:
        $c1 = "<|CHECKIDPASSWORD|>" wide
        $c2 = "<|DOWNLOADFILE|>" wide
        $c3 = "<|ZIPSELECTED|>" wide
        $c4 = "<|REDIRECT|><|DOWNLOADFILE|>" wide
        $c5 = "<|PING|>" wide
        $c6 = "<|CLIPBOARD|>" wide
        $d1  = "Software\\Embarcadero\\Locales" wide
        $d2  = "Software\\CodeGear\\Locales" wide
        $d3  = "Software\\Borland\\Locales" wide
        $d4  = "Software\\Borland\\Delphi\\Locales" wide

    condition:
        uint16(0) == 0x5A4D and
        filesize < 15MB and
        (2 of ($c*) and 1 of ($d*))
}