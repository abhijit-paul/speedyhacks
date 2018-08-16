# List of hacks:
1. Locate a program file; following symbolic link
2. Docker build and run on 8080 port
3. Stop last run docker container
4.  Get remote file size. 
 - Usage: `get_remote_file_size <remote http location>`
 - Need python and `get_remote_file_size.py` file in user's home
 - Makes a head request to the file and gets the size in KB

5. Remove deleted branches
6.  Managing multiple git users in a single machine
 - Modify the user name(`<username>`) and emailID (`<email_id@domain.com>`) in `my_commit` to your user name and email ID respectively
 - Modify the github username(`<github-username>`) in `my_push` to your Github ID
7. Compress Images(JPEG/ PNG/ GIF)
 - Need python with PIL library globally available
 - Running this in a folder goes through all the images and compresses them
 - What's the compression ratio? The sweet spot of using the quality scale of 50 using PIL library consistently compresses image while retaining quality. Anything more screws up the image.
 - Can one improve the compression ratio? Feel free to play with the quality parameter value to try it out
7.  Compress Videos(MP4/ M4V/ MOV)
 - Need ffmpeg 
9. Convert webm to mp4 video
 - Need ffmpeg
 - Save text to pastebin
 - USAGE: `savepaste <your text>`
 - TIP: Put your text within quotations to save multi-line text
 - Need python and savepaste account and savepaste.py in user's HOME
10. Get program running in port
 - Usage: runningport <port number>
 - Needs `lsof` installed
 - Will ask for sudo password
11. Show/Hide .dotfiles in MAC OS
12. Compile, build a jar and run it in a single command