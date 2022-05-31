# for clipboard: sudo apt install libx11-dev libxtst-dev libxt-dev libsm-dev libxpm-dev

* Edit src/Make_mvc.mak, set correct `RUBY_VER` and `RUBY_VER_LONG`
* ./configure --with-features=huge --with-ruby-command=ruby \
                                                        --enable-multibyte \
                                                        --enable-rubyinterp=yes \
                                                        --enable-python3interp=yes \
                                                        --with-python3-config-dir=$(python3-config --configdir) \
                                                        --enable-perlinterp=yes \
                                                        --enable-luainterp=yes \
                                                        --enable-gui=gtk2 \
                                                        --enable-cscope \
                                                        --prefix=/usr/local \
                                                        --with-x
* sudo make install
