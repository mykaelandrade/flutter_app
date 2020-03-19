#!/usr/bin/env bash
clear

flutter clean;
flutter upgrade;
flutter packages get;
flutter packages upgrade;

flutter build appbundle --target-platform android-arm,android-arm64
flutter run;

echo ""
echo "----------------------------------------------"
echo ""
echo "BUILD COMPLETE"
echo ""
echo "----------------------------------------------"
