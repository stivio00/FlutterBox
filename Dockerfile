# Latest Ubuntu LTS
FROM ubuntu:24.04

# Update ubuntu image and upgrade pckgs
RUN apt update -y &&  apt upgrade -y;

# Download Flutter Dependencies
RUN apt install -y curl wget git unzip xz-utils zip libglu1-mesa

# Download Java-17 SDK
RUN apt install -y openjdk-17-jdk

# Download a temporal  Android commandline tools(sdkmannager)
WORKDIR /opt/tmp
RUN curl https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip > cmdlinetools.zip
RUN unzip cmdlinetools.zip
RUN rm cmdlinetools.zip

# Install latest cmd-tools and remove temporal tools
RUN mkdir -p /opt/android_sdk
RUN yes|./cmdline-tools/bin/sdkmanager --sdk_root=/opt/android_sdk "cmdline-tools;latest"
RUN rm -r /opt/tmp
ENV ANDROID_HOME="/opt/android_sdk"
ENV PATH="${PATH}:/opt/android_sdk/cmdline-tools/latest/bin"

# Install Android build-tools , platform-tools and platform 33
RUN yes|sdkmanager --sdk_root="/opt/android_sdk" "platform-tools" "platforms;android-33"  "build-tools;34.0.0"
RUN yes|sdkmanager --licenses

#  Install flutter
WORKDIR /opt
RUN curl https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.19.6-stable.tar.xz > flutter.tar.xz
RUN tar xf flutter.tar.xz
RUN rm flutter.tar.xz
ENV PATH="${PATH}:/opt/flutter/bin"

# Add /opt flutter to safe directory
RUN git config --global --add safe.directory '*'

# Check installation and cache plattform tools
RUN flutter config --no-cli-animations
RUN yes|flutter doctor --android-licenses
RUN flutter precache
