#################################################################################################################################################################
# CT-8ball.tcl
#################################################################################################################################################################
#Author    ComputerTech
#IRC       Irc.DareNet.Org  #ComputerTech
#Email     ComputerTech@DareNet.Org
#GitHub    https://github.com/computertech312
#Version   0.1
#Released  25/02/2021
#################################################################################################################################################################
# Description:
#
#                 8Ball Script
#               
#
# History:
#
#               - 0.1: First Release.
#
#################################################################################################################################################################
# Start Of Configuration #
##########################
#variable trigger of the commands.
#
variable ct8ball(trig) "!"
#
###################
#variable flag for Commands.
##
#Owner     = n
#Master    = m
#Op        = o
#Voice     = v
#Friend    = f
#Everyone  = -
variable ct8ball(flag) "-"
#
#################
#variable Output of Commands
##
#1 = Notice
#2 = Privmsg
#
variable ct8ball(msg) "1"
#
#################
#variable Language output of Script
#
#English    = en
#French     = fr
#Spanish    = sp
#German     = ge
#Russian    = ru
#
variable ct8ball(lang) "en"
#
#################
#variable Colour of Output
##
#White       = 0
#Black       = 1
#Dark Blue   = 2
#Green       = 3
#Red         = 4
#Brown       = 5
#Purple      = 6
#Orange      = 7
#Yellow      = 8
#Light Green = 9
#DarkCyan    = 10
#LightCyan   = 11
#LightBlue   = 12
#Pink        = 13
#Dark Grey   = 14
#Light Grey  = 15
#
variable ct8ball(col) "3"
#
########################
# End Of Configuration #
#################################################################################################################################################################
namespace eval ct:8ball {

set ct8ball(1en)) {                         ;
"Shakes the magic 8ball and it reveals..."  ;
"Shakes the stupid 8ball and it says..."    ;
"Shakes and Rolls the 8ball and it shows...";
}
set ct8ball(1fr)) {
"Secoue la boule magique 8 et elle révèle..."
"Secoue le stupide 8bapl et il dit..."
"Secoue et fait rouler la balle 8 et ça se voit..."
}
set ct8ball(1sp) { 
"Sacude la bola 8 mágica y revela..."
"Sacude la estúpida bola 8 y dice..."
"Sacude y rueda la bola 8 y se nota..."
}
set ct8ball(1ge) {
"Schüttelt den magischen 8ball und es zeigt sich..."
"chütteltt den blöden 8ball und es heißt..."
""Schüttelt und rollt das 8bal und es zeigt..."
}
set ct8ball(1ru) {
"Встряхивает волшебный шар 8, и он открывает..."
"Shakea глупый 8ball, и он говорит..."
"Встряхивает и катит шар 8, и он показывает..."
}
set ct8ball(2eu) {
"Yes"
"No"
"Maybe"
"Possibly"
"Impossible"
}
set ct8ball(2fr) {
"Oui"
"Non"
"Peut-être"
"Impossible"
}
set ct8ball(2sp) {
"sí"
"No"
"Quizás"
"Posiblemente"
"Imposible"
}
set ct8ball(2ge) {
"Ja"
"Nein"
"Kann sein"
"Möglicherweise"
"Unmöglich"
}
set ct8ball(2ru) {
"да"
"Нет"
"Может быть"
"Возможно"
"Невозможно"
}
bind pub $ct8ball(flag) $ct8ball(trig)8ball ::ct:8ball::8ball

proc 8ball {nick host hand chan text} {
global ct8ball
        switch -- $ct8ball(lang)) {
            en {set ct8ball(out1) [lindex $ct8ball(1en) [rand [llength $ct8ball(1en)]]]}
            fr {set ct8ball(out1) [lindex $ct8ball(1fr) [rand [llength $ct8ball(1fr)]]]}
            sp {set ct8ball(out1) [lindex $ct8ball(1sp) [rand [llength $ct8ball(1sp)]]]}
            ge {set ct8ball(out1) [lindex $ct8ball(1ge) [rand [llength $ct8ball(1ge)]]]}
            ru {set ct8ball(out1) [lindex $ct8ball(1ru) [rand [llength $ct8ball(1ru)]]]}
   }
set line1 [string map [list %nick $nick] $ct8ball(1)] 
set line2 [string map [list %nick $nick] $ct8ball(2)] 
puthelp "PRIVMSG $chan :\001ACTION $ct8ball(out1)\001"
puthelp "PRIVMSG $chan :\[\0030${ct8ball(col)}8Ball\003\] $ct8ball(out2)"
  }
}
