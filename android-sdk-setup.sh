sudo apt-get update
sudo apt-get install -y --force-yes git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3 
sudo apt-get clean 

sudo git clone -b stable https://github.com/flutter/flutter.git /usr/local/flutter 
sudo chown -R jenkins:jenkins /usr/local/flutter

sudo /usr/local/flutter/bin/flutter doctor -v 



export PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

sudo chown -R jenkins:jenkins /usr/local/flutter/bin/cache/lockfile

apt update
yes |apt install default-jdk

# Getting the android sdk command line tools 
# commandlinetools-linux-9477386_latest.zip
wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip


#set this directory as the path for ANDROID_HOME
#add ANDROID_HOME=~/android-sdk to .bashrc file
mkdir android-sdk

# Unzipping the contents of the zip file to the android-sdk directory
unzip commandlinetools-linux-9477386_latest.zip -d android-sdk/

# Creating a directory and adding a sub folder as the sdk manager would not work without it
sudo mkdir ./android-sdk/latest 
cd android-sdk
sudo mv ./cmdline-tools/*  ./latest/ 
sudo  mv ./latest ./cmdline-tools/

cd cmdline-tools/latest/bin/

# Accepting the licenses in sdkmanager
yes | ./sdkmanager --licenses

# Creating an image of the android v
yes | ./sdkmanager 'system-images;android-30;google_apis;x86'

# yes | ./sdkmanager 'system-images;android-30;google_apis;x86'

yes | ./sdkmanager 'platforms;android-31'
yes | ./sdkmanager 'platforms;android-30'
yes | ./sdkmanager 'platforms;android-29'
yes | ./sdkmanager 'platforms;android-28'

yes | ./sdkmanager "build-tools;30.0.3"
yes | ./sdkmanager "build-tools;30.0.2"
yes | ./sdkmanager "build-tools;29.0.2"
yes | ./sdkmanager "build-tools;28.0.2"