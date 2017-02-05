FROM alpine:edge
RUN apk add --update curl build-base git autoconf readline-dev openssl-dev bash
RUN apk add --update lua5.3 lua5.3-dev luarocks5.3 \
 && echo 'variables = { CFLAGS = "-O2 -fPIC -I/usr/include/lua5.3", LIBFLAGS = "-L/usr/lib/lua5.3" }' >> /etc/luarocks/config-5.3.lua \
 && ln -snf /usr/bin/lua5.3 /usr/bin/lua \
 && ln -snf /usr/bin/luarocks-5.3 /usr/bin/luarocks \
 && luarocks-5.3 install luacheck \
 && luarocks-5.3 --server=http://luarocks.org/dev install ldoc scm-2 \
 && luarocks-5.3 --server=http://luarocks.org/dev install busted scm-0
CMD [ "lua" ]
