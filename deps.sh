#! /bin/bash
pushd ~/.mjolnir
luarocks install mjolnir.application
luarocks install mjolnir.window
luarocks install mjolnir.hotkey
luarocks install mjolnir.fnutils
luarocks install mjolnir.alert
luarocks install mjolnir.bg.grid
luarocks install mjolnir.lb.spotify
luarocks install mjolnir._asm.sys.audiodevice
luarocks install mjolnir._asm.ui.sound
popd
