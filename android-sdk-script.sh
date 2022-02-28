update && yes |apt install default-jdk

# Getting the android sdk command line tools 
sudo apt install wget

wget https://dl.google.com/android/repository/commandlinetools-linux-8092744_latest.zip

# Creating a directory to keep the sdk contents
# # This directory will be the path for ANDROID_HOME in environment variables
# # SET the variable name as ANDROID_HOME and /android-sdk/ as value
mkdir android-sdk

sudo apt install unzip

# Unzipping the contents of the zip file to the android-sdk directory
unzip commandlinetools-linux-7302050_latest.zip -d android-sdk/

# Creating a directory and adding a sub folder as the sdk manager would not work without it
mkdir -p ./android-sdk/latest 
mv ./android-sdk/cmdline-tools/* ./android-sdk/latest/
mv ./android-sdk/latest ./android-sdk/cmdline-tools/

# Accepting the licenses in sdkmanager
yes |./android-sdk/cmdline-tools/latest/bin/sdkmanager --licenses

# Creating an image of the android v
yes |android-sdk/cmdline-tools/latest/bin/sdkmanager 'system-images;android-30;google_apis;x86'
