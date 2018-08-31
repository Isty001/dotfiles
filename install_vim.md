* Edit src/Make_mvc.mak, set correct `RUBY_VER` and `RUBY_VER_LONG`
* ./configure --with-features=huge --with-ruby-command=ruby \
                                                        --enable-multibyte \
                                                        --enable-rubyinterp=yes \
                                                        --enable-python3interp=yes \
                                                        --with-python3-config-dir=/usr/lib/python3.6/config \
                                                        --enable-perlinterp=yes \
                                                        --enable-luainterp=yes \
                                                        --enable-gui=gtk2 \
                                                        --enable-cscope \
                                                        --prefix=/usr/local
* sudo make install
