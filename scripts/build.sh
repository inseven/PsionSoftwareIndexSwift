#!/bin/bash

# Copyright (c) 2024 Jason Morley
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

set -e
set -o pipefail
set -x

SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ROOT_DIRECTORY="${SCRIPT_DIRECTORY}/.."

DEFAULT_IPHONE_DESTINATION="${DEFAULT_IPHONE_DESTINATION:-platform=iOS Simulator,name=iPhone 16 Pro}"

cd "$ROOT_DIRECTORY"

xcodebuild -scheme PsionSoftwareIndexSwift -showdestinations

# Build.
xcodebuild -scheme PsionSoftwareIndexSwift -destination "platform=macOS" clean build
xcodebuild -scheme PsionSoftwareIndexSwift -destination "$DEFAULT_IPHONE_DESTINATION" clean build

# Test.
xcodebuild -scheme PsionSoftwareIndexSwift -destination "platform=macOS" test
xcodebuild -scheme PsionSoftwareIndexSwift -destination "$DEFAULT_IPHONE_DESTINATION" test

# N.B. We skip code-signing to allow us to sign without a development certificate; this is fine for builds but wouldn't
# allow us to run the app for local testing.

# macOS
xcodebuild \
    -scheme Example \
    -config Debug \
    CODE_SIGN_IDENTITY="" \
    CODE_SIGNING_REQUIRED=NO \
    CODE_SIGNING_ALLOWED=NO \
    clean build

# iOS
xcodebuild \
    -scheme Example \
    -sdk iphoneos \
    -config Debug \
    CODE_SIGN_IDENTITY="" \
    CODE_SIGNING_REQUIRED=NO \
    CODE_SIGNING_ALLOWED=NO \
    clean build
