#!/bin/bash

# Ensure the script is executable
# chmod +x run-parallel.sh

# Remove old reports and log files
rm -rf reports
rm -f *.log

# Functions to avoid code repetition
uninstall_app() {
    local device="$1"
    adb -s "$device" uninstall io.appium.uiautomator2.server
    adb -s "$device" uninstall io.appium.uiautomator2.server.test
    adb -s "$device" uninstall id.co.duniagames
}

install_app() {
    local device="$1"
    adb -s "$device" install app/android/duniagames.apk
}

run_test() {
    local url="$1"
    local udid="$2"
    local outputdir="$3"
    local testcase="$4"
    robot --variable REMOTE_URL:"$url" --variable UDID:"$udid" --outputdir "$outputdir" "$testcase" &
}

# Configuration for emulators, ports, report directories, and test cases
emulators=("emulator-5554" "emulator-5556")        # Add more emulator IDs here
appium_ports=(4723 4725)                          # Corresponding Appium ports
report_dirs=("reports/device-1" "reports/device-2")  # Define report directories
test_cases=("test-cases/Landing.robot" "test-cases/Guest.robot")  # Define test cases

# Validate input arrays have the same length
if [ "${#emulators[@]}" -ne "${#appium_ports[@]}" ] || [ "${#emulators[@]}" -ne "${#report_dirs[@]}" ] || [ "${#emulators[@]}" -ne "${#test_cases[@]}" ]; then
    echo "Array sizes of emulators, appium_ports, report_dirs, and test_cases must match."
    exit 1
fi

# Prepare Appium servers dynamically
for port in "${appium_ports[@]}"; do
    ./appium-server.sh "$port" &
done

# Uninstall existing apps and servers
for emulator in "${emulators[@]}"; do
    uninstall_app "$emulator"
done

# Install the new app on all emulators
for emulator in "${emulators[@]}"; do
    install_app "$emulator"
done

# Run tests on emulators in parallel
for i in "${!emulators[@]}"; do
    run_test "http://localhost:${appium_ports[i]}" "${emulators[i]}" "${report_dirs[i]}" "${test_cases[i]}"
done

# Wait for all parallel tests to complete
wait

# Prepare files for merging reports
output_files=()
for dir in "${report_dirs[@]}"; do
    output_files+=("$dir/output.xml")
done

# Merge reports using the gathered output files
rebot --outputdir reports/final --log log.html --report report.html --reporttitle "Automation Result" "${output_files[@]}"

# Kill all Appium servers
pkill -9 -f appium