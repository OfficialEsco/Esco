# Counter-Strike 1.6

Launch Options:
```
-novid -freq 240 -noforcemparms -noforcemaccel -noforcemspd -stretchaspect
```

## Linux Launch Options:
### Enable Wayland support
```sh
LD_PRELOAD=/usr/lib/libSDL2-2.0.so SDL_VIDEODRIVER=wayland
```

### Enable Mesa's GL threading
> For AMD/Intel users. This enables OpenGL threading in the Mesa driver, which can help stabilize FPS in GoldSrc.
```sh
mesa_glthread=true
```

### MangoHud support
Install `lib32-mangohud`

### Other launch options
* `-nofbo` disables the use of Frame Buffer Objects.
* `-noipx` disables the use of IPX networking.

```
mangohud gamemoderun %command% -console -nojoy -noipx -nofbo
```

### Known Net_Graph instability issue
> There is a documented issue where the game's internal clock on Linux slowly drifts over time
* https://github.com/ValveSoftware/halflife/issues/2043

### Mouse Wheel Bug in Steam_Legacy
fix: https://gist.github.com/p3nj/94093f3c7db8b0f2faf11a1c2869a4c5

Replace `libSDL2-2.0.so.0` with system's `/usr/lib/libSDL2-2.0.so.0` while keeping Steam Overlay support

```sh
cd ~/.local/share/Steam/steamapps/common/Half-Life/

# Backup the old library
mv libSDL2-2.0.so.0 libSDL2-2.0.so.0.bak

# Create symlink to system's 32-bit SDL2
ln -s /usr/lib/libSDL2-2.0.so.0 libSDL2-2.0.so.0
```
