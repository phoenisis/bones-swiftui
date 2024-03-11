#!/bin/zsh

if [[ -n "$CI" ]] || [[ $1 == "--fail-on-errors" ]] ; then
 FAIL_ON_ERRORS=true
 echo "Running in --fail-on-errors mode"
 ERROR_START=""
 COLOR_END=""
 INFO_START=""
else
 echo "Running in local mode"
 ERROR_START="\e[31m"
 COLOR_END="\e[0m"
 INFO_START="\e[34m"
fi

final_status=0
PROJECT_DIR=${PROJECT_DIR:-$(pwd)}

if [[ `xcode-select -p` =~ CommandLineTools ]] ; then 
 echo "${ERROR_START}Your toolchain won't run Swiftlint. Use\n sudo xcode-select -s /path/to/Xcode.app\nto fix this.${COLOR_END}"
fi

function process() {
 echo "\n${INFO_START}# Running $1 #${COLOR_END}"
 local initial_git_diff=`git diff --no-color`
 local start=`date +%s`
 
 eval "$2"

 if [ "$FAIL_ON_ERRORS" = "true" ] && [[ "$initial_git_diff" != `git diff --no-color` ]]
 then
 echo "${ERROR_START}$1 generates git changes, run './Scripts/process.sh' and review the changes${COLOR_END}"
 final_status=1
 fi

 local end=`date +%s`
 echo Execution time was `expr $end - $start` seconds.
}

process  "SwiftLint" "swiftlint --fix --quiet && swiftlint --quiet"

if [[ $final_status -gt 0 ]]
then
 echo "\n${ERROR_START}Changes required. Run './Scripts/process.sh' and review the changes${COLOR_END}"
fi

git add .

exit $final_status