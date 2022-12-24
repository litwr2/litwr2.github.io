NR == 1 {
   for (i = 1; i <= NF; i++) a[i] = $i
   n = NF
}
NR == 2 {
   for (i = 1; i <= NF; i++) v[i] = substr($i, 2)
}
{
   for (i = 1; i <= NF; i++) d[NR,i] = $i
}
END {
   for (i = 1; i <= n; i++) {
     printf "ma.push({computer: \"%s\", year: 0, cpu: \"\", freq: 0, efreq: 0, OS: \"\", video_mode: \"\", window_mode: \"\", variant: \"\", version: %d, tnc: %.2f, t: [", a[i], v[i], d[3, i]
     for (k = 1; k <= 15; k++) printf "%.2f, ", d[3 + k, i]
     printf "%.2f], ", d[3 + 16, i]
     printf "source: \"\", comments: \"\", href: \"\", screenshot: \"\", main: 0, tsum: .0, psum: .0})\n"
   }
}
