#!/bin/sh
#set -xv
set -v

#Kill it if exist
ps axu |grep -v 'grep' |egrep "test_video_shm"|awk '{system("kill -9 "$2)}'
ps axu |grep -v 'grep' |egrep "isli_icon_srv"|awk '{system("kill -9 "$2)}'
ps axu |grep -v 'grep' |egrep "isli_line_srv"|awk '{system("kill -9 "$2)}'
ps axu |grep -v 'grep' |egrep "bar_srv"|awk '{system("kill -9 "$2)}'
ps axu |grep -v 'grep' |egrep "out_server"|awk '{system("kill -9 "$2)}'
ps axu |grep -v 'grep' |egrep "cam_view"|awk '{system("kill -9 "$2)}'


nohup ../decoder/decoder_srv/test_video_shm ./decoder/decoder_srv/video >./log/test_video_shm.txt &
sleep 1s

nohup ../decoder/decoder_srv/isli_icon_srv >../log/isli_icon_srv.txt &
nohup ../decoder/decoder_srv/isli_line_srv >../log/isli_lin_srv.txt &
nohup ../decoder/decoder_srv/bar_srv >../log/bar_srv.txt &

nohup ../interface/out_server /dev/hidg0 /dev/ttyS3 >../log/out_server.txt &

nohup ../camera/cam_view &

