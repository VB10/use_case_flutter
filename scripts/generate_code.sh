PROJECT_DIR=$(pwd)/..

args=("$@")

if [[ " ${args[*]} " =~ "library" ]] || [ -z "$1" ]; then
    cd $PROJECT_DIR
    flutter pub get
    flutter pub run easy_localization:generate  -O lib/product/init/language -f keys -o locale_keys.g.dart -S assets/translations
    flutter packages pub run build_runner build  --delete-conflicting-outputs
fi
