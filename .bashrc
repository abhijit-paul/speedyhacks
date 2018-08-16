# Locate a program file; following symbolic link
function ls_which() {
 ls -ltr $(which $1)
}

# Docker build and run on 8080 port
function docker_build_and_run_8080() {
 CURR_DIR=$(pwd | awk -F'/' '{print $NF}')
 docker build -t $CURR_DIR .
 docker run -p 8000:8000 $CURR_DIR
}
# Stop last run docker container
function docker_stop_last_container() {docker container stop $(docker ps -n1 | tail -1 | awk '{print $1}')}


# Get remote file size
# USAGE: get_remote_file_size <remote http location>
#   Need python and get_remote_file_size.py file in user's home
#   Makes a head request to the file and gets the size in KB
alias get_remote_file_size='python ~/get_remote_file_size.py'


# Remove deleted branches from local
# USAGE: remove_deleted_branches
function remove_deleted_branches() {
    git fetch -p && for branch in $(git branch -vv --no-color | grep ": gone]" | awk '{print $1}'); do git branch -D $branch; done
}

# Managing multiple git users in a single machine
function my_commit() {git commit --author="<username> <email_id@domain.com>" -m $2}
alias mycommit='my_commit'
function my_push() {
    git push $(git remote -v | tail -1 | awk '{print $2}' | sed s/'https\:\/\/'/'https:\/\/<github-username>@'/g | sed s/'git@github.com:'/'https:\/\/<github-username>@github.com\/'/g) --set-upstream $(git branch | grep '*' | awk '{print $2}')
}
alias mypush='my_push'

# Compress Images(JPEG/ PNG/ GIF)
#  Need python with PIL library globally available
#  Running this in a folder goes through all the images and compresses them
#  What's the compression ratio? The sweet spot of using qualiy scale of 50 using PIL library has been working for me since end of 2015. Anything more screws up the image.
#  Can one improve the compression ratio? Feel free to play with the quality parameter value to try it out
alias compress_image='find -E . -iregex ".*\.(jpg|jpeg|png|gif)" -exec python -c "from PIL import Image; image = Image.open(\"{}\"); image.save(\"{}\", quality=50, optimize=True);" \;'
alias image_compress='compress_image'

# Compress Videos(MP4/ M4V/ MOV)
#  Need ffmpeg 
alias compress_video='find -E . -iregex ".*\.(mp4|m4v|mov)" -exec ffmpeg -i {} -vcodec libx264 -crf 30 outputvid.mp4 \; -exec mv outputvid.mp4 {} \;'

# Convert webm to mp4 video
#  Need ffmpeg
alias webm2mp4='find -E . -iregex ".*\.(webm)" -exec ffmpeg -fflags +genpts -i {} -r 24 outputMP4vid.mp4 \; -exec mv outputMP4vid.mp4 {}.mp4 \;'

# Save text to pastebin
# USAGE: savepaste <your text>
# TIP: Put your text within quotations to save multi-line text
#  Need python and savepaste account and savepaste.py in user's HOME
alias savepaste="python ~/savepaste.py"


# Get program running in port
# USAGE: runningport <port number>
#  Needs lsof installed
#  Will ask for sudo password
function runningport() {sudo lsof -i :$1}

# MAC OS specific
# Show/Hide .dotfile in Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Build and run a java file
# Creates a build and runs it
function javarun() {
    filename="$1"
    javac $filename || return;
    ref=$(echo $filename | sed -e 's/.java//');
    jar cfe build.jar $ref *.class;
    java -jar build.jar
}
