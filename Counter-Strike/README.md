# Counter-Strike 1.6

Launch Options:
```
-novid -freq 240 -noforcemparms -noforcemaccel -noforcemspd -stretchaspect
```

## Linux Launch Options:
### Enable Wayland support
```
LD_PRELOAD=/usr/lib/libSDL2-2.0.so SDL_VIDEODRIVER=wayland
```

### Enable Mesa's GL threading
> For AMD/Intel users. This enables OpenGL threading in the Mesa driver, which can help stabilize FPS in GoldSrc.
```
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

