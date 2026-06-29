export PATH="$HOME/.local/bin:$PATH"

if [[ "$(uname)" == "Darwin" ]]; then
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home
fi
