#!/bin/bash

flutter --version
flutter pub get
flutter pub run build_runner build

mkdir -p artifact/

flutter test --coverage --coverage-path="artifact/lcov.info"

sudo apt-get install lcov -y
lcov --remove artifact/lcov.info '*.g.dart' -o artifact/lcov.info
genhtml artifact/lcov.info -o artifact/html