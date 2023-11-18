rule Riddle_Stealer {
    meta:
        author = "Seyit (@h3xecute) - ThreatMon"
        description = "Detects the Riddle stealer"
        date = "23.10.2023"
        hash = "3771E204B354353A88A9E180E56BFD043A39F9AF40F9672E6370D4A7081C3F21"
        
    strings:
        $s1 = "127.0.0.1 www.virustotal.com" ascii
        $s2 = "SELECT * FROM AntiVirusProduct" wide
        $s3 = "HARDWARE\\DESCRIPTION\\System\\CentralProcessor\\0" ascii
        $s4 = "http://myexternalip.com/raw" ascii
        $s5 = "ActivitiesCache.db" ascii
        
    condition:
	    uint16(0) == 0x5A4D and
	    filesize < 1MB and
	    all of them
}