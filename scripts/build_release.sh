#!/bin/sh

echo "Clean flutter application"
flutter clean

echo "Building app bundle for application 🏛"
flutter build appbundle --obfuscate --split-debug-info=debug-info
echo "App bundle generated successfuly 🎉"
