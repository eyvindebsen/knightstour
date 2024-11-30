1 rem knights tour;https://en.wikipedia.org/wiki/Knight%27s_tour
2 hh=17:input"movement speed (default 17)";hh:rem speed of movement; hestehastighed ;)
3 x=rnd(-ti):poke53280,11:poke53281,11
4 mx=7:my=7:cx=27:cy=7:mo=0:ws=0
6 print "{clear}";:dim cb(mx,my),pm(15,2):forx=.tomx:fory=.tomy:cb(x,y)=1:next:next
7 gosub 170
10 print"{home}";
11 printspc(26)"knight's tour"
12 printspc(26)"v0.3; 2024 by"
14 printspc(26)"eyvind ebsen"
15 printspc(26)"-------------":?
16 printspc(26)"{green}    moves":print"{home}{light gray}";
17 forx=.to7:print spc(25)"B":print spc(24)chr$(56-x)"B":print spc(25)"B":next
18 print" a  b  c  d  e  f  g  h  B";
31 forx=.to63*2:reada:poke832+x,a:next
42 v=53248:pokev+21,1:poke2040,13:poke v+39,14:rem enable sprite 1
43 hx=0:hy=0
44 hx=int(rnd(1)*8):hy=int(rnd(1)*8)
45 cp=0
46 pokev,24+hx*24:pokev+1,51+hy*24:gosub130
50 goto80:rem print hx,hy
59 rem check possible moves
60 if hx>1thenifhy>0thenifcb(hx-2,hy-1)=1thenpm(cp,0)=hx-2:pm(cp,1)=hy-1:cp=cp+1
62 if hx>0thenifhy>1thenifcb(hx-1,hy-2)=1thenpm(cp,0)=hx-1:pm(cp,1)=hy-2:cp=cp+1
64 if hx<7thenifhy>1thenifcb(hx+1,hy-2)=1thenpm(cp,0)=hx+1:pm(cp,1)=hy-2:cp=cp+1
66 if hx<6thenifhy>1thenifcb(hx+2,hy-1)=1thenpm(cp,0)=hx+2:pm(cp,1)=hy-1:cp=cp+1
68 if hx<6thenifhy<7thenifcb(hx+2,hy+1)=1thenpm(cp,0)=hx+2:pm(cp,1)=hy+1:cp=cp+1
70 if hx<7thenifhy<6thenifcb(hx+1,hy+2)=1thenpm(cp,0)=hx+1:pm(cp,1)=hy+2:cp=cp+1
72 if hx>0thenifhy<6thenifcb(hx-1,hy+2)=1thenpm(cp,0)=hx-1:pm(cp,1)=hy+2:cp=cp+1
74 if hx>1thenifhy<7thenifcb(hx-2,hy+1)=1thenpm(cp,0)=hx-2:pm(cp,1)=hy+1:cp=cp+1
76 rem print"found"cp"possible moves"
78 return
79 rem find pos moves, and check for lowest pos moves
80 gosub60:ox=hx:oy=hy:oc=cp:lw=17:lp=17:cb(hx,hy)=0:gosub102
81 if oc=0 then goto150
82 for x=.tooc-1:cp=oc:hx=pm(x,0):hy=pm(x,1)
84 gosub60:pm(x,2)=cp
86 if cp<lw then lw=cp:lp=x
88 next
90 rem print "best move"lp,pm(lp,0),pm(lp,1)
92 if hh>0 then gosub200:rem animate movement
94 hx=pm(lp,0):hy=pm(lp,1):mo=mo+1:goto45
100 end
101 rem clear square
102 for q=.to2:poke781,q+hy*3:poke782,hx*3:sys 65520:print"{reverse on}{blue}   ":next
104 return
129 rem show move notation
130 poke781,cy:poke782,cx:sys 65520
132 print"{light green}"chr$(65+hx)+chr$(56-hy);:ifcx<35 and mo<63then print"-"
134 cx=cx+3:ifcx>37thencx=27:cy=cy+1
138 return
139 rem flip sprite
140 ws=ws+1:ifws=1thenpoke2040,14:goto146
142 poke2040,13
146 ifws>1then ws=0
148 return
149 rem no moves, messed up or win win ?
150 ifmo=63thenprint"{home}{white}i win! :-)":forx=.to1step.:gosub190:poke2040,13:gosub190:poke2040,14:next
160 print"{home}{white}i'm a horses ass :--(":end
169 rem show board fast
170 fory=.to3:forx=.to2
172 print"{reverse on}{white}   {black}   {white}   {black}   {white}   {black}   {white}   {black}   "
174 next:forx=.to2
176 print"{reverse on}{black}   {white}   {black}   {white}   {black}   {white}   {black}   {white}   "
178 next:next:return
179 rem wait a bit
180 fory=.to99:next:return
189 rem wait a bit longer
190 fory=.to399:next:getq$:ifq$<>""then end
192 return
199 rem move knight
200 px=24+ox*24:py=51+oy*24:dx=24+(pm(lp,0)*24):dy=51+(pm(lp,1)*24)
205 ax=(dx-px)/hh:ay=(dy-py)/hh
208 rem print"{white}" px,py,dx,dy,ax,ay:end
210 for y=.tohh-1:pokev,px:pokev+1,py:px=px+ax:py=py+ay:next
220 return
1010 DATA 0,0,0,1,8,0,1,156
1020 DATA 0,1,255,192,1,255,240,2
1030 DATA 127,248,4,127,252,4,255,252
1040 DATA 15,255,252,15,255,254,31,252
1050 DATA 254,31,252,254,63,248,254,63
1060 DATA 240,254,95,224,254,79,129,254
1070 DATA 127,1,254,118,1,254,0,3
1080 DATA 254,0,3,252,0,0,0,0
1090 rem sprite2
1110 DATA 0,0,0,0,16,128,0,57
1120 DATA 128,3,255,128,15,255,128,31
1130 DATA 254,64,63,254,32,63,255,32
1140 DATA 63,255,240,127,255,240,127,63
1150 DATA 248,127,63,248,127,31,252,127
1160 DATA 15,252,127,7,250,127,129,242
1170 DATA 127,128,254,127,128,110,127,192
1180 DATA 0,63,192,0,0,0,0,0