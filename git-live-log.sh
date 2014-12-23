while :
do
 clear
 date +"%A %B %d, %Y at %T"
 lines=`tput lines`
 lines=`expr $lines - 5`
 git --no-pager log --graph --decorate --pretty=oneline --abbrev-commit --color --all $* | head -n $lines
 sleep 1
done