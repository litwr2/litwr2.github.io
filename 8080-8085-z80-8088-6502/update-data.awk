BEGIN {
}
/ma.push/ {
    s = $0
    gsub("^ma.push\\(\\{\\s*", "", s)
    gsub("\\s*\\}\\s*\\).*", "", s)
    n = 0
    while (s != "") {
        re = "^[^:]+"
        if (match(s, re) != 1) { print "key-error"; exit }
        k[n] = substr(s, 1, RLENGTH)
        gsub(re ":\\s*", "", s)
        if (substr(s, 1, 1) == "\"") {
            re = "^\"[^\"]*\""
            t[n] = 0
        }
        else if (substr(s, 1, 1) == "t") {
            re = "^true"
            t[n] = 2
        }
        else if (substr(s, 1, 1) == "f") {
            re = "^false"
            t[n] = 2
        }
        else {
            re = "^-?[0-9\\.]+"
            t[n] = 1
        }
        if (match(s, re) != 1) { print "value-error"; exit }
        v[n++] = substr(s, 1, RLENGTH)
        gsub(re "\\s*,?\\s*", "", s)
    }
    s = "ma.push({"
    for (i = 0; i < n; i++) {
        s = s k[i] ": " v[i]
        if (i < n - 1) s = s ", "; else s = s "})"
        if (k[i] == "x86sz") s = s "m6502: \"\", f6502: \"\", t6502: \"\", sz6502: \"\", "
    }
    $0 = s
}
{
    print
}
