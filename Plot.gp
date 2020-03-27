
# --------------------------------------------------------------------------------------------------------
# --------------------------------- Plot file to be used with gnuplot ------------------------------------

t = 200
set view equal xyz
set view 55,135,1.5 
set ticslevel 0

set origin 0.0,0.2

set xtics textcolor 'white'
set ytics textcolor 'white'

unset ztics
unset border

set xrange[-40:40]
set yrange[-40:40]
set zrange[0:80]
set style line 100 dt 3 lt 2 lc rgb 'white' lw 1
set grid ls 100

set object rectangle from screen 0,0 to screen 1,1 behind fillcolor rgb '#010E36' fillstyle solid noborder

splot 'Data/Data2.dat' every  ::1::t using 2:3:4 w lines  dt 3 lt 2   lc rgb 'blue'   notitle, \
      'Data/Data2.dat' every  ::t::t using 2:3:4 w points pt 7 ps 0.6 lc rgb 'brown'  notitle, \
      'Data/Data3.dat' every  ::1::t using 2:3:4 w lines  dt 3 lt 2   lc rgb 'gray'   notitle, \
      'Data/Data3.dat' every  ::t::t using 2:3:4 w points pt 6 ps 0.3 lc rgb 'purple' notitle, \
      'Data/Data4.dat' every  ::1::t using 2:3:4 w lines  dt 3 lt 2   lc rgb '#1DBDD6'   notitle, \
      'Data/Data4.dat' every  ::t::t using 2:3:4 w points pt 6 ps 0.3 lc rgb '#1DBDD6' notitle, \
      'Data/Data5.dat' every  ::1::t using 2:3:4 w lines  dt 3 lt 2   lc rgb 'brown'   notitle, \
      'Data/Data5.dat' every  ::t::t using 2:3:4 w points pt 6 ps 0.3 lc rgb 'red'   notitle, \
      'Data/Data6.dat' every  ::1::t using 2:3:4 w lines  dt 3 lt 2 lc rgb 'orange' notitle, \
      'Data/Data6.dat' every  ::t::t using 2:3:4 w points pt 7 ps 2.6 lc rgb 'orange'  notitle, \
      'Data/Data6.dat' every  ::t::t using ($2+0.03):($3-0.02):4 w points pt 7 ps 0.3 lc rgb 'red'  notitle, \
      'Data/Data7.dat' every  ::1::t using 2:3:4 w lines  dt 3 lt 2   lc rgb '#DEC89E'  notitle, \
      'Data/Data7.dat' every  ::t::t using 2:3:4 w points pt 7 ps 1.4 lc rgb '#DEC89E'  notitle, \
      'Data/Data7.dat' every  ::t::t using 2:3:4 w points pt 6 ps 2.8 lc rgb '#DEC89E'    notitle, \
      'Data/Data8.dat' every  ::1::t using 2:3:4 w lines  dt 3 lt 2   lc rgb '#1DBDD6'  notitle, \
      'Data/Data8.dat' every  ::t::t using 2:3:4 w points pt 7 ps 2.5   lc rgb '#1DBDD6'  notitle, \
      'Data/Data9.dat' every ::1::t using 2:3:4 w lines  dt 3 lt 2   lc rgb '#451AF7' notitle, \
      'Data/Data9.dat' every ::t::t using 2:3:4 w points pt 7 ps 1   lc rgb '#451AF7' notitle, \
      'Data/Data10.dat' every ::1::t using 2:3:4 w lines  dt 3 lt 2   lc rgb 'brown' notitle, \
      'Data/Data10.dat' every ::t::t using 2:3:4 w points pt 7 ps 1.0 lc rgb '#CABFA3' notitle, \
      'Data/Data1.dat' every  ::1::t using 2:3:4 w lines  dt 3 lt 2 lc rgb 'black' notitle, \
      'Data/Data1.dat' every  ::t::t using 2:3:4 w points pt 7 ps 1.8 lc rgb 'orange' notitle
			

