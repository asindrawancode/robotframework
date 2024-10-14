## Prerequisites

Before setting up the project, ensure you have the following software installed:

- [Python 3.x](https://www.python.org/downloads/)
- [Java JDK 8 or higher](https://www.oracle.com/java/technologies/javase-jdk8-downloads.html)
- [Android SDK](https://developer.android.com/studio)
- [Node.js and npm](https://nodejs.org/)
- [Appium](http://appium.io/)
- Robot Framework and necessary libraries:
  - `robotframework`
  - `Appium-Python-Client`
  - `robotframework-appiumlibrary`

You can install the Robot Framework and required libraries using pip:

```bash
pip install robotframework
pip install Appium-Python-Client
pip install robotframework-appiumlibrary
```

## Setup Instructions

1. **Clone the repository**:
   ```bash
   git clone https://github.com/asindrawancode/robotframework.git
   cd robotframework
   ```

2. **Install Appium**:
   Install Appium globally using npm:

   ```bash
   npm install -g appium
   ```

3. **Verify Installation**:
   Check that all installations are correct by using:

   ```bash
   appium -v
   adb --version
   java -version
   ```

4. **Configure Android Emulator or Real Device**:
   Make sure you have an Android emulator set up or a real device connected with USB debugging enabled.

5. **Set Environment Variables**:
   Ensure that `ANDROID_HOME` is set to your Android SDK's location and `PATH` includes the `platform-tools` directory.

6. **Put the .apk file into app/android**
   Put duniagames.apk into

   ```bash
   app/android/
   ```

8. **Modify run-parallel.sh to perform parallel execution**:
    Modify run-parallel.sh file especially on this section to config :

    ```bash
    emulators=("emulator-5554" "emulator-5556")        # Add more emulator IDs here
    appium_ports=(4723 4725)                          # Corresponding Appium ports
    report_dirs=("reports/device-1" "reports/device-2")  # Define report directories
    test_cases=("test-cases/Landing.robot" "test-cases/Guest.robot")  # Define test cases
    ```

9. **Run Parallel Execution**:
    Execute this on terminal
   
   ```bash
     ./run-parallel.sh
   ```
