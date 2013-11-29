default['emacs']['version']    = '24.3'
default['emacs']['source_uri'] = 'http://ftp.jaist.ac.jp/pub/GNU/emacs/emacs-24.3.tar.gz'
default['emacs']['configure']  = './configure --without-x --with-x-toolkit=no --with-xpm=no --with-jpeg=no --with-gif=no --with-tiff=no --with-png=no --without-selinux'
default['emacs']['packages']   = %w{gcc make zlib-devel ncurses ncurses-devel}
