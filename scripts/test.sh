echo "SwiftyKit Test Start"
set -o pipefail && env "NSUnbufferedIO=YES" xcodebuild "-project" "SwiftyKit.xcodeproj" "-scheme" "SwiftyKit" "build" "test" "-destination" "id=9E4B7E0D-7346-407E-B592-EC786C0ED538" | xcpretty "--color"
echo "SwiftyKit Test End"

echo "Example Test Start"
set -o pipefail && env "NSUnbufferedIO=YES" xcodebuild "-project" "SwiftyKit.xcodeproj" "-scheme" "Example" "build" "test" "-destination" "id=9E4B7E0D-7346-407E-B592-EC786C0ED538" | xcpretty "--color"
echo "Example Test End"
