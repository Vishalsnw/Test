#!/usr/bin/env sh

#
# Copyright 2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

##############################################################################
##
##  Gradle start up script for UN*X
##
##############################################################################

# Attempt to set APP_HOME
# Resolve links: $0 may be a link
PRG="$0"
# Need this for relative symlinks.
while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`"/$link"
    fi
done
SAVED="`pwd`"
cd "`dirname \"$PRG\"/`"
APP_HOME="`pwd -P`"
cd "$SAVED"

APP_NAME="Gradle"
APP_BASE_NAME=`basename "$0"`

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS="-Xmx64m -Xms64m"

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

warn () {
    echo "$*"
}

die () {
    echo
    echo "$*"
    echo
    exit 1
}

# OS specific support (must be 'true' or 'false').
cygwin=false
darwin=false
linux=false
case "`uname`" in
    CYGWIN*) cygwin=true ;;
    Darwin*) darwin=true ;;
    Linux) linux=true ;;
esac

# For Cygwin, ensure paths are in UNIX format before anything is touched.
if $cygwin ; then
    [ -n "$JAVA_HOME" ] && JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
    [ -n "$GRADLE_HOME" ] && GRADLE_HOME=`cygpath --unix "$GRADLE_HOME"`
fi

# Attempt to find JAVA_HOME if not already set.
if [ -z "$JAVA_HOME" ] ; then
    if $darwin ; then
        [ -x '/usr/libexec/java_home' ] && export JAVA_HOME=`/usr/libexec/java_home`
        [ -z "$JAVA_HOME" ] && [ -d "/Library/Java/Home" ] && export JAVA_HOME="/Library/Java/Home"
    else
        javaExecutable="`which javac`"
        if [ -n "$javaExecutable" ] ; then
            javaExecutable="`readlink -f "$javaExecutable"`"
            javaHome="`dirname "$javaExecutable"`"
            javaHome="`cd "$javaHome/.." && pwd`"
            export JAVA_HOME="$javaHome"
        fi
    fi
fi
if [ -z "$JAVA_HOME" ] ; then
    die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
fi

# Set JAVA_EXE
JAVA_EXE="$JAVA_HOME/bin/java"

# Check for JAVA_EXE
if [ ! -x "$JAVA_EXE" ] ; then
  die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
fi

# Set GRADLE_OPTS
GRADLE_OPTS="-Dorg.gradle.appname=$APP_BASE_NAME"

# Find the project's build file, build.gradle or build.gradle.kts
if [ -f "build.gradle" ] ; then
    BUILD_FILE=build.gradle
elif [ -f "build.gradle.kts" ] ; then
    BUILD_FILE=build.gradle.kts
fi

# Read build file to determine the wrapper version
if [ -n "$BUILD_FILE" ] && [ -r "$BUILD_FILE" ] ; then
    WRAPPER_VERSION=`grep -e "^[ 	]*task[ 	].*wrapper(type:[ 	]*Wrapper)" "$BUILD_FILE"`
    if [ -z "$WRAPPER_VERSION" ] ; then
        WRAPPER_VERSION=`grep -e "^wrapper[ 	]*{[ 	]*gradleVersion[ 	]*=[ 	]*\"\(.*\)\"" "$BUILD_FILE"`
        if [ -n "$WRAPPER_VERSION" ] ; then
            WRAPPER_VERSION=`echo "$WRAPPER_VERSION" | sed 's/.*gradle-\(.*\)-bin.zip/\1/'`
        fi
    fi
    if [ -n "$WRAPPER_VERSION" ] ; then
        echo "Wrapper version from build.gradle: $WRAPPER_VERSION"
    fi
fi

# If not found in build.gradle, try to read from gradle/wrapper/gradle-wrapper.properties
if [ -z "$WRAPPER_VERSION" ] && [ -r "gradle/wrapper/gradle-wrapper.properties" ] ; then
    WRAPPER_VERSION=`grep -e "^distributionUrl=.*gradle-\(.*\)-bin.zip" "gradle/wrapper/gradle-wrapper.properties"`
    if [ -n "$WRAPPER_VERSION" ] ; then
        WRAPPER_VERSION=`echo "$WRAPPER_VERSION" | sed 's/.*gradle-\(.*\)-bin.zip/\1/'`
        echo "Wrapper version from gradle-wrapper.properties: $WRAPPER_VERSION"
    fi
fi

# For Cygwin, switch paths to Windows format before running java
if $cygwin ; then
    APP_HOME=`cygpath --path --windows "$APP_HOME"`
    JAVA_HOME=`cygpath --path --windows "$JAVA_HOME"`
    CLASSPATH=`cygpath --path --windows "$CLASSPATH"`
    CYGHOME=`cygpath --path --windows "$HOME"`
fi

# Split up the JVM options only if the variable is not quoted
if [ -z "${JVM_OPTS_QUOTED}" ]; then
    JVM_OPTS=$(echo "$DEFAULT_JVM_OPTS" $JAVA_OPTS $GRADLE_OPTS)
fi

exec "$JAVA_EXE" $JVM_OPTS -classpath "$APP_HOME/gradle/wrapper/*" org.gradle.wrapper.GradleWrapperMain "$@"
