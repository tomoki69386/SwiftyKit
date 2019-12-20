echo "SwiftyKit Test Start"
set -o pipefail && env "NSUnbufferedIO=YES" xcodebuild "-project" "SwiftyKit.xcodeproj" "-scheme" "SwiftyKit" "build" "test" "-destination" "id=6E9380A8-6A85-4BB3-94CE-7D2FA27CEBD3" | xcpretty "--color"
echo "SwiftyKit Test End"

echo "Example Test Start"
set -o pipefail && env "NSUnbufferedIO=YES" xcodebuild "-project" "SwiftyKit.xcodeproj" "-scheme" "Example" "build" "test" "-destination" "id=6E9380A8-6A85-4BB3-94CE-7D2FA27CEBD3" | xcpretty "--color"
echo "Example Test End"
