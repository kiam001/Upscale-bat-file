D:
cd D:\work\input
FOR %%G In (*) Do (
mkdir "D:\work\tmp\tmp_frames"
mkdir "D:\work\tmp\out_frames"
ffmpeg -i "%%G" -qscale:v 1 -qmin 1 -qmax 1 -vsync 0 "D:\work\tmp\tmp_frames\frame%%08d.jpg"
realesrgan-ncnn-vulkan.exe -i "D:\work\tmp\tmp_frames" -o "D:\work\tmp\out_frames" -n realesr-animevideov3 -s 4 -f jpg
rd /s /q "D:\work\tmp\tmp_frames"
ffmpeg -r 23.976 -i "D:\work\tmp\out_frames\frame%%08d.jpg" -c:v libx264 -r 23.976 -pix_fmt yuv420p -vf scale=1920x1080 "D:\work\output\%%G.mkv"
rd /s /q "D:\work\tmp\out_frames"
)
pause
