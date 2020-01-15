git clean -e ".idea" -xfd
git submodule foreach --recursive git clean -e ".idea" -xfd
git reset --hard
git submodule foreach --recursive git reset --hard
git submodule update --init --recursive
