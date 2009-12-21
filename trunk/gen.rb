class Entry
  @@id = 0
  attr_reader :rank, :waza, :attack, :tech, :misc, :youtube, :sec, :comment
  def self.dummy
    Entry.new("", "", "", "", "", "", 0, nil)
  end  
    
  def initialize(rank, waza, attack, tech, misc, youtube, sec, comment)
    @rank = rank
    @waza = waza
    @attack = attack
    @tech = tech
    @misc = misc
    @youtube = youtube
    @sec = sec
    @comment = comment
    @id = @@id
    @@id += 1
  end
  
  def id
    "e#{@id}"
  end  
    
  def link    
    "http://www.youtube.com/watch?v=#{@youtube}#t=#{@sec/60}m#{@sec%60}"
  end
  
  def embed
    s = '<object width="560" height="340"><param name="movie" value="http://www.youtube.com/v/'
    s += @youtube
    s += '&autoplay=1&hl=de_DE&fs=1&start='
    s += @sec.to_s
    s += '"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/'
    s += @youtube
    s += '&autoplay=1&hl=de_DE&fs=1&start='
    s += @sec.to_s
    s += '" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="560" height="340"></embed></object>'
    s
  end
end

def add(h, rank, waza, attack, tech, misc, youtube, time, comment=nil)
  h[rank].push Entry.new(rank, waza, attack, tech, misc, youtube, time, comment)
end

def dictify(s)
  # http://www.aikido-rheinstrasse.de/Woerterbuch.de.html
  # http://www.karatetiger.wg.am/lexikon.html
  dict = [
    ["suwari waza", "&Uuml;bungstechniken im Sitzen"],
    ["tachi waza", "&Uuml;bungstechniken im Stehen"],
    ["hanmi handachi waza", "&Uuml;bungstechniken, wobei Nage sitzt und Uke steht"],
    ["ryote dori", "beide H&auml;nde greifen je ein Handgelenk"],
    ["kokyo ho", "&Uuml;bung bei der der Partner mit Hilfe der Atemkraft gef&uuml;hrt wird"],
    ["katate tori", "Greifen eines Handgelenks mit einer Hand"],
    ["ai hanmi", "diagonales Greifen eines Handgelenks mit einer Hand (z.B. rechts greift rechts)"],
    ["gyaku hanmi", "direktes Greifen eines Handgelenks mit entgegengesetzter Hand (z.B. rechts greift links)"],
    ["ikkyo", "erste Form"],
    ["nikyo", "zweite Form"],
    ["sankyo", "dritte Form"],
    ["yonkyo", "vierte Form"],
    ["gokyo", "f&uuml;nfte Form"],
    ["irimi nage", "Wurf durch direktes Eintreten in den Partner"],
    ["kote gaeshi", "Handgelenksaussendrehwurf"],
    ["tai no henka", "Drehung der H&uuml;fte, aber Beibehaltung der Beinstellung"],
    ["omote", "Vorderseite"],
    ["ura", "R&uuml;ckseite"],
    ["shiho nage", "Vierrichtungswurf (Schwertwurf)"],
    ["sumi otoshi", "Eckenkippwurf (sumi = Winkel)"],
    ["Shomen uchi", "gerader Schlag von oben an den Kopf (zur Stirn)"],
    ["osae", "osaeru = festhalten"],
    ["ude kime nage", "Armstreckwurf"],
    ["tenchi nage", "Himmel-Erde-Wurf, die Energie wird aufgespalten und somit zerstreut"],
    ["kokyu nage",	"Atemkraftwurf"],
    ["kokyu ho", "Übung bei der der Partner mit Hilfe der Atemkraft geführt wird"]
  ]
  
  dict.each do |regex, replace|
    r = "\\b#{regex}\\b"
    s.gsub!(Regexp.new(r, Regexp::IGNORECASE), "<span class=\"dict\" title=\"#{replace}\">\\0</span>")
  end
  s
end


d = Hash.new { |h, k| h[k] = Array.new }
# 6th kyu done
add(d, "6. Kyu", "Suwari waza", "Ryote dori", "Kokyo ho", "", "US_FYDzNh0w", 12)
add(d, "6. Kyu", "Tachi waza", "Katate tori ai hanmi", "Ikkyo", "omote", "I2N27C23208", 6)
add(d, "6. Kyu", "Tachi waza", "Katate tori ai hanmi", "Ikkyo", "ura", "GGDiPLFFCNQ", 0)
add(d, "6. Kyu", "Tachi waza", "Katate tori ai hanmi", "Irimi nage", "", "0GEnGBA2slA", 0)
add(d, "6. Kyu", "Tachi waza", "Katate tori ai hanmi", "Kote gaeshi", "", "EwNboRZqy9o", 7)
add(d, "6. Kyu", "Tachi waza", "Katate tori gyaku hanmi", "Tai no henka", "", "v9JoO5LfjGs", 0)
add(d, "6. Kyu", "Tachi waza", "Katate tori gyaku hanmi", "Shiho nage", "omote", "3cEIQW7eM-s", 7)
add(d, "6. Kyu", "Tachi waza", "Katate tori gyaku hanmi", "Shiho nage", "ura", "oEhCM96Og44", 8)
add(d, "6. Kyu", "Tachi waza", "Katate tori gyaku hanmi", "Sumi otoshi", "", "zo3X-4DCp3U", 3)
add(d, "6. Kyu", "Tachi waza", "Katate tori gyaku hanmi", "Kokyo ho", "", "hlbIcnvjXhc", 3)

add(d, "5. Kyu", "Suwari waza", "Shomen uchi Kiawaze", "Irimi nage", "kein osae lt. Hombu", "xq4XUvzMOvo", 3)
add(d, "5. Kyu", "Suwari waza", "Shomen uchi Kiawaze", "Ikkyo", "omote", "wR7vdqrZ5OM", 0)
add(d, "5. Kyu", "Suwari waza", "Shomen uchi Kiawaze", "Ikkyo", "ura", "wR7vdqrZ5OM", 17)
add(d, "5. Kyu", "Hanmi handachi waza", "Katate tori gyaku hanmi", "Irimi nage", "", "jArM4st5E6E", 0)
add(d, "5. Kyu", "Hanmi handachi waza", "Katate tori gyaku hanmi", "Sumi otoshi", "", "YF5pjL7YHD0", 2)
add(d, "5. Kyu", "Tachi waza", "Katate tori ai hanmi", "Ikkyo", "omote", "xYtwiUW4KrY", 0)
add(d, "5. Kyu", "Tachi waza", "Katate tori ai hanmi", "Ikkyo", "ura", "GGDiPLFFCNQ", 0)
add(d, "5. Kyu", "Tachi waza", "Katate tori ai hanmi", "Nikyo", "omote", "FHLxdqMA3Hc", 0, "Video zeigt Shomen uchi anstatt Ai hanmi")
add(d, "5. Kyu", "Tachi waza", "Katate tori ai hanmi", "Nikyo", "ura", "FHLxdqMA3Hc", 39, "Video zeigt Shomen uchi anstatt Ai hanmi")
add(d, "5. Kyu", "Tachi waza", "Katate tori gyaku hanmi", "Irimi nage", "", "lrtncT0tuWs", 0)
add(d, "5. Kyu", "Tachi waza", "Katate tori gyaku hanmi", "Kote gaeshi", "", "iHrRRblN5uk", 26)
add(d, "5. Kyu", "Tachi waza", "Katate tori gyaku hanmi", "Ude kime nage", "", "inuH8-XZlsQ", 3)
add(d, "5. Kyu", "Tachi waza", "Ryote dori", "Tenchi nage", "", "UWA6bmXeKPs", 35)
add(d, "5. Kyu", "Tachi waza", "Ryote dori", "Shiho nage", "omote", "a--a1fxyHV8", 152)
add(d, "5. Kyu", "Tachi waza", "Ryote dori", "Shiho nage", "ura", "a--a1fxyHV8", 165)
add(d, "5. Kyu", "Tachi waza", "Ryote dori", "Kokyu nage / Otoshi", "", "sX6ktC6ZtBg", 0)
add(d, "5. Kyu", "Tachi waza", "Ryote dori", "Kokyu ho", "", "a--a1fxyHV8", 356, "Video zeigt Kokyu nage, Kokyu ho ist ohne wurf")
add(d, "5. Kyu", "Tachi waza", "Shomen uchi Kiawaze", "Irimi nage", "", "NE4jkH204pM", 0)
add(d, "5. Kyu", "Tachi waza", "Shomen uchi Kiawaze", "Kote gaeshi", "", "fm7_t4BwzZg", 0)


# check order!
add(d, "4. Kyu", "Suwari waza", "Shomen uchi", "Kote gaeshi", "osae", "6uVEZo-09jw", 0)
add(d, "4. Kyu", "Suwari waza", "Shomen uchi", "Nikyo", "omote", "tRoYyF2lCgY", 0)
add(d, "4. Kyu", "Suwari waza", "Shomen uchi", "Nikyo", "ura", "tRoYyF2lCgY", 30)
add(d, "4. Kyu", "Hanmi handachi waza", "Katate tori gyaku hanmi", "Ikkyo", "omote", "lnMNyIQ3Wl4", 0)
add(d, "4. Kyu", "Hanmi handachi waza", "Katate tori gyaku hanmi", "Ikkyo", "ura", "HHNvGzh10S4", 0, "Tachi waza anstatt Hanmi handachi waza")
add(d, "4. Kyu", "Hanmi handachi waza", "Katate tori gyaku hanmi", "Nikyo", "omote", "rk0Dz6EA1V4", 0, "Tachi waza statt Hanmi handachi")
add(d, "4. Kyu", "Hanmi handachi waza", "Katate tori gyaku hanmi", "Nikyo", "ura", "rk0Dz6EA1V4", 50, "Tachi waza statt Hanmi handachi")
add(d, "4. Kyu", "Hanmi handachi waza", "Katate tori gyaku hanmi", "Kote gaeshi", "", "gYhQCOH8m8Y", 0)

add(d, "4. Kyu", "Tachi waza", "Katate tori ai hanmi", "Sankyo", "omote", "", 0)
add(d, "4. Kyu", "Tachi waza", "Katate tori ai hanmi", "Sankyo", "ura", "", 0)
add(d, "4. Kyu", "Tachi waza", "Katate tori ai hanmi", "Yonkyo", "omote", "", 0)
add(d, "4. Kyu", "Tachi waza", "Katate tori ai hanmi", "Yonkyo", "ura", "", 0)
add(d, "4. Kyu", "Tachi waza", "Katate tori ai hanmi", "Kaiten nage", "", "", 0)
add(d, "4. Kyu", "Tachi waza", "Katate tori ai hanmi", "Jijuwaza", "", "", 0)
add(d, "4. Kyu", "Tachi waza", "Katate tori ai hanmi", "Kokyu ho", "ko tai (wie Iriminage)", "", 0)
add(d, "4. Kyu", "Tachi waza", "Ryote dori", "Ikkyo", "omote", "a--a1fxyHV8", 5)
add(d, "4. Kyu", "Tachi waza", "Ryote dori", "Ikkyo", "ura", "a--a1fxyHV8", 20)
add(d, "4. Kyu", "Tachi waza", "Ryote dori", "Irimi nage", "", "", 0)
add(d, "4. Kyu", "Tachi waza", "Ryote dori", "Kote gaeshi", "", "", 0)
add(d, "4. Kyu", "Tachi waza", "Katate ryote dori", "Ikkyo", "omote", "", 0)
add(d, "4. Kyu", "Tachi waza", "Katate ryote dori", "Ikkyo", "ura", "", 0)
add(d, "4. Kyu", "Tachi waza", "Katate ryote dori", "Nikyo", "omote", "", 0)
add(d, "4. Kyu", "Tachi waza", "Katate ryote dori", "Nikyo", "ura", "", 0)
add(d, "4. Kyu", "Tachi waza", "Katate ryote dori", "Kokyunage/Otoshi", "", "", 0)
add(d, "4. Kyu", "Tachi waza", "Shomen uchi kiawase", "Ikkyo", "omote", "", 0)
add(d, "4. Kyu", "Tachi waza", "Shomen uchi kiawase", "Ikkyo", "ura", "", 0)
add(d, "4. Kyu", "Tachi waza", "Shomen uchi kiawase", "Nikyo", "omote", "", 0)
add(d, "4. Kyu", "Tachi waza", "Shomen uchi kiawase", "Nikyo", "ura", "", 0)
add(d, "4. Kyu", "Tachi waza", "Shomen uchi kiawase", "Sankyo", "omote", "", 0)
add(d, "4. Kyu", "Tachi waza", "Shomen uchi kiawase", "Sankyo", "ura", "", 0)
add(d, "4. Kyu", "Tachi waza", "Shomen uchi kiawase", "Yonkyo", "omote", "", 0)
add(d, "4. Kyu", "Tachi waza", "Shomen uchi kiawase", "Yonkyo", "ura", "", 0)
add(d, "4. Kyu", "Tachi waza", "Shomen uchi", "Irimi nage", "", "", 0)
add(d, "4. Kyu", "Tachi waza", "Shomen uchi", "Kote gaeshi", "", "", 0)
add(d, "4. Kyu", "Tachi waza", "Chudan tsuki", "Iriminage", "", "", 0)
add(d, "4. Kyu", "Tachi waza", "Chudan tsuki", "Sumiotoshi", "", "", 0)
add(d, "4. Kyu", "Tachi waza", "Chudan tsuki", "Kote gaeshi", "", "", 0)




#############################
add(d, "4. Kyu", "Tachi waza", "Shomen uchi Kiawaze", "Irimi nage", "", "NE4jkH204pM", 0)

add(d, "3. Kyu", "Tachi waza", "Shomen uchi Kiawaze", "Ikkyo", "omote", "sw0TPWL-bhY", 0)
add(d, "3. Kyu", "Tachi waza", "Shomen uchi Kiawaze", "Ikkyo", "ura", "sw0TPWL-bhY", 20)

head = <<-EOF
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head profile="http://gmpg.org/xfn/11"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
<meta name="distribution" content="global" /> 
<meta name="robots" content="follow, all" /> 
<style type="text/css">
/* START aikido techniques */
.hidden {
display:none;
padding:1em 0 2em 1em;
}
.waza {
float:left;
position:absolute;
margin-bottom:1.5em;
}
.attack {
float:left;
position:absolute;
margin-left:12em;
}
.tech {
float:left;
position:absolute;
margin-left:28em;
}
.misc {
float:left;
position:absolute;
margin-left:35em;
}
.dict {
cursor:help;
}
.dict:hover {
background-color:#000;
color:#fff;
-moz-border-radius: 3px; -webkit-border-radius: 3px;
}
.techenum {
clear:both;
}
.techenum:hover {
background-color:#f0f0f0;
}
/* END aikido techniques */
</style>
<script type="text/javascript">
<!--
    function toggle_visibility(id) {
       var e = document.getElementById(id);
       if(e.style.display == 'block')
          e.style.display = 'none';
       else
          e.style.display = 'block';
    }
//-->
</script>
</head>
<body>
EOF

prelude = <<-EOF
<h1>Aikido Techniken</h1>
Hier ist eine Liste s&auml;mtlicher Techniken aus dem Pr&uuml;fungsprogramm 2009 des Aikikai - Verband &ouml;sterreichischer Aikidoschulen. Hinter jeder Technik findet sich ein video, einfach draufklicken um es anzuzeigen.

Vorerst gibt es nur die Techniken f&uuml;r den 6. und 5. Kyu, ich werde das nach und nach erweitern. Falls ein Video nicht funktioniert, oder selbst fehlende gefunden wurden, bitte <a href="mailto:martin.ankerl.com">mir mitteilen</a>! Ich bin &uuml;ber jede Hilfe dankbar :)
EOF

tail = <<-EOF
<p>
<h2>Allgemeines</h2>
Bei Pr&uuml;fungen ist nicht nur das technische K&ouml;nnen des Sch&uuml;lers zu beurteilen, sondern vor allem auch die Entwicklung (Do) des Sch&uuml;lers, sowohl technisch als auch charakterlich. Prinzipien wie "Stand", "aufrechte Haltung", "Distanz zum Partner", "Blickfeld" sind im niedrigen Kyubereich sicherlich wichtiger als die konkrete Ausf&uuml;hrung der Technik. Erst im h&ouml;heren Kyubereich werden Prinzipien wie "Technik", "Integrit&auml;t" oder "&Ouml;konomie der Bewegung" wichtig und sollten bei der Pr&uuml;fung auch sichtbar sein.

Ein &Uuml;berspringen von Kyupr&uuml;fungen ist nicht erw&uuml;nscht, da es dem Sch&uuml;ler die M&ouml;glichkeit nimmt, sich mit allen Techniken im Rahmen der Pr&uuml;fungsvorbereitung auseinanderzusetzen (das Programm ist so aufgebaut, dass kaum Techniken doppelt gepr&uuml;ft werden).

Ein Durchfallen bei Kyupr&uuml;fungen ist nach M&ouml;glichkeit zu vermeiden (aber nicht verboten!); eine schlechte Pr&uuml;fung dient dem Lehrer als R&uuml;ckmeldung seiner Kompetenz, den Kyugrads eines Sch&uuml;lers einzusch&auml;tzen. Hat der Lehrer (noch) nicht die Kompetenz, schon vor der Pr&uuml;fung richtig zu urteilen, sollte der Sch&uuml;ler daf&uuml;r nicht bestraft werden. Der Lehrer sollte hinter seiner Entscheidung stehen, den Sch&uuml;ler zum entsprechenden Grad antreten zu lassen.

Wenn es die Technik erlaubt soll der Pr&uuml;fling omote und ura zeigen, jene Techniken im Programm bei denen omote/ura extra angegeben ist, sollten auch als eigenst&auml;ndige Technik gepr&uuml;ft werden. Das Pr&uuml;fungsprogramm versteht sich als Mindestanforderung an den Pr&uuml;fling, weitere Techniken und Techniken von vorherigen Kyugraden d&uuml;rfen gepr&uuml;ft werden.
<hr>
HTML-Version erstellt von Martin Ankerl 2009. Videos gefunden auf youtube, generiert mit Ruby. Text &uuml;bernommen aus dem Pr&uuml;fungsprogramm 2009.
</body>
</html>
EOF


File.open("out.html", "w") do |f|
  f.puts head
  f.puts dictify(prelude)
  last = Entry.dummy
  
  d.to_a.sort.reverse.each do |rank, entries|
    f.puts "<h2>#{rank}</h2>"
    f.puts "<ul>"
    
    entries.each do |e|
      f.puts "<li class=\"techenum\" onclick=\"toggle_visibility('#{e.id}');\">" 
      f.print "<span class=\"waza\">#{dictify(e.waza)}</span> "
      f.print "<span class=\"attack\">#{dictify(e.attack)}</span> "
      f.print "<span class=\"tech\">#{dictify(e.tech)}</span> "
      f.print "<span class=\"misc\">#{dictify(e.misc)}</span> " 
      f.puts "&nbsp;<br /><div class=\"hidden\" id=\"#{e.id}\"><div style=\"float:left; margin-right:0.5em;\">#{e.embed}</div>"
      f.puts e.comment if e.comment
      f.puts "<div style=\"clear:both;\"></div>"
      f.puts "</div>" # close hidden
      f.puts "</li>"
    end 
    f.puts "</ul>"
  end
  f.puts tail
end

