var tabs = [data6502, data6809, dataZ80]
var ntabs = ["6502", "6809", "Z80"]
var idx = [1, 0]
var gi, html
var h1 = ["quick", "quick-nr", "shell", "selection", "insertion", "radix-8"]
var h2 = ["random-1", "random-2", "2-values", "reversed", "ordered", "constant"]
var h3 = ["random-1", "random-2", "4-values", "kill-qs-r", "kill-qs-l", "reversed", "ordered", "constant"]
function form100(a1, a2) {
    var s = ""
    if (a2 == 0) s = a1 + "/0"; else s = Math.round(a1/a2*100)/100
    return s
}
function oneline(h, n) {
    var gil = gi + n
    html += "<tr><th>" + h
    for (;gi < gil;gi++) html += "<td align=right>" + form100(tabs[idx[0]][gi],tabs[idx[1]][gi])
    html += "\n"
}
function opchange(n) {
    idx[n] = document.getElementById("cpu" + n).value
    generate_page()
    document.getElementById("maindoc").innerHTML = html
}
function generate_page() {
    gi = 0
    html = "<h1><select id=cpu0 onchange=opchange(0)>\n"
    for (var k = 0; k < tabs.length; k++) {
       html += "<option value=" + k
       if (k == idx[0]) html += " selected"
       html += ">" + ntabs[k] + "</option>\n"
    }
    html += "</select> vs "
    html += "<select id=cpu1 onchange=opchange(1)>\n"
    for (var k = 0; k < tabs.length; k++) {
       html += "<option value=" + k
       if (k == idx[1]) html += " selected"
       html += ">" + ntabs[k] + "</option>\n"
    }
    html += "</select></h1>\n"
    html += "<h3><a href=https://github.com/litwr2/6502-sorting>6502</a> <a href=https://github.com/litwr2/Z80-sorting>Z80</a> <a href=https://github.com/litwr2/6809-sorting>6809</a></h3>"
    html += "<hr>\n"
    html += "<h2>Byte sorting</h2>\n"
    html += "<table border=1>\n"
    html += "<tr><th>Routine<th>Size<th>Stack<th>Memory<th>Startup\n"
    for (var k = 1; k <= h1.length; k++) oneline(h1[k - 1], 4)
    html += "</table>\n"
    html += "<h2>1000 bytes</h2>\n"
    html += "<table border=1>\n<tr><th>"
    for (var k = 0; k < h1.length; k++) html += "<th>" + h1[k]; html += "\n"
    for (var k = 1; k <= h2.length; k++) oneline(h2[k - 1], 6)
    html += "</table>\n"
    html += "<h2>60000 bytes</h2>\n"
    html += "<table border=1>\n<tr><th>"
    for (var k = 0; k < h1.length; k++) html += "<th>" + h1[k]; html += "\n"
    for (var k = 1; k <= h2.length; k++) oneline(h2[k - 1], 6)
    html += "</table>\n"
    html += "<hr>\n"
    html += "<h2>Word sorting</h2>\n"
    html += "<table border=1>\n"
    html += "<tr><th>Routine<th>Size<th>Stack<th>Memory<th>Startup\n"
    for (var k = 1; k <= h1.length - 1; k++) oneline(h1[k - 1], 4)
    html += "</table>\n"
    html += "<h2>1000 words</h2>\n"
    html += "<table border=1>\n<tr><th>"
    for (var k = 0; k < h1.length - 1; k++) html += "<th>" + h1[k]; html += "\n"
    for (var k = 1; k <= h3.length; k++) oneline(h3[k - 1], 5)
    html += "</table>\n"
    html += "<h2>30000 words</h2>\n"
    html += "<table border=1>\n<tr><th>"
    for (var k = 0; k < h1.length - 1; k++) html += "<th>" + h1[k]; html += "\n"
    for (var k = 1; k <= h3.length; k++) oneline(h3[k - 1], 5)
    html += "</table>\n"
}
generate_page()
console.log(html)
