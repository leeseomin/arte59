parallel --no-notice rm -r ::: s1/* s2/* s3/* s4/* s5/* s6/* s7/* s8/* s9/* s10/* s11/* s12/* s13/*
parallel --no-notice rm -r ::: s14/* s15/* s16/* s17/* s18/* s19/* s20/* s21/* s22/* s23/* s24/* s25/*
cd s
parallel convert {} -resize 4000x4000 {.}.png ::: *.* 
rm *.jpg
rm *.JPG
parallel convert {} ../s25/{} ::: *.*
cd ..
cd s
for i in *.* 
do 
convert $i /home/lee/arte59/logo/arise6.png -alpha set  -compose darken -composite ../s9/$i 
done 
cd ..
cd s9
parallel convert {}  -set filename:new  ../s25/"%tmon7" "%[filename:new].png" ::: *.*
cd ..
cd s
for i in *.* 
do 
convert $i ../s9/$i -alpha set  -compose linearlight -composite ../s10/$i 
done 
cd ..
cd s10
parallel convert {}  -set filename:new  ../s25/"%tmon7a" "%[filename:new].png" ::: *.*
cd ..
cd s9
for i in *.* 
do 
convert -modulate 100,250,100 $i ../s1/$i
done
cd ..
cd s1
for i in *.* 
do 
convert $i ../s9/$i -alpha set -channel A -evaluate set 100% -compose softlight -composite ../s3/$i 
done 
cd ..
cd s3
for i in *.* 
do 
gmic -input $i -fx_AbstractFlood 1,10,7,2,0,10,5,3,255,255,255,255,0,300,10,90,0.7,0,0,0 -o ../s6/$i 
done
cd .. 
cd s6
for i in *.*; do
   convert $i  -set filename:new ../s25/"%tmon7cpu1" "%[filename:new].png"
done
cd ..
cd s6
for i in *.*
do
gmic $i -fx_custom_deformation "(w+h)/20*cos(y*20/h)","(w+h)/20*sin(x*20/w)",1,1,3 -o ../s15/$i
done
cd ..
cd s15
parallel convert {}  -set filename:new  ../s25/"%tmon7cpu1_cartesian_transform" "%[filename:new].png" ::: *.*
cd ..
cd s15
for i in *.*
do
gmic $i -fx_custom_deformation "(w+h)/20*cos(y*20/h)","(w+h)/20*sin(x*20/w)",1,1,3 -o ../s17/$i
done
cd ..
cd s17
parallel convert {}  -set filename:new  ../s25/"%tmon7cpu1_cartesian_transform_2x" "%[filename:new].png" ::: *.*









