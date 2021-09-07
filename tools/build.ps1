#Requires -PSEdition Core

rm ~/Desktop/app.aab

flutter clean
flutter build appbundle

cp build/app/outputs/bundle/release/app-release.aab ~/Desktop/app.aab
