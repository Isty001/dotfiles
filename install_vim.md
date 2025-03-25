# for clipboard: sudo apt install libx11-dev libxtst-dev libxt-dev libsm-dev libxpm-dev
# create ~/.vim/tmp

* Edit src/Make_mvc.mak, set correct `RUBY_VER` and `RUBY_VER_LONG`

./configure --with-features=huge --with-ruby-command=ruby \
                --enable-multibyte \
                --enable-python3interp=yes \
                --enable-pythoninterp=yes \
                --with-python3-config-dir=/usr/lib/python3.10/config-3.10-x86_64-linux-gnu \
                --with-python-config-dir=/usr/lib/python3.10/config-3.10-x86_64-linux-gnu \
                --enable-perlinterp=yes \
                --enable-luainterp=yes \
                --enable-gui=gtk2 \
                --enable-cscope \
                --prefix=/usr/local --with-lua-prefix=/usr/local

sudo make install
