## Common keybindings

These are custom keybinds I have configured either in `keybindings.json` or `settings.json`. AFAIK I have not changed or over-ridden any default
VS-Code keybindings so they should all work (command period, command p, command P, etc)

For some of these commands to feel "natural" you want to re-map CAPSLOCK to control.

### VIm

leader: <SPC>

### accessing the left menu

open file explorer

```
command shift e
<leader> e
```

open file search

```
command shift f
<leader> f
```

open source control

```
control shift g
<leader> g
```

hide left menu

> (has issues in some file types, like md)

```
command b
<leader> b
```

### General movement

fuzzy file

```
command p
```

fuzzy program/command

```
command shift p
```

focus pane (not tab)

```
command 0, 1, 2, etc
control H, L
```

cycle tabs (wraps around)

```
control tab (left to right)
control shift tab (right to left)
```

split new pane

> conflicts with 1password

```
command \
<leader> w
```

move pane right/left

```
command control left-arrow
command control right-arrow
```

jump block down (extension)

```
control shift j
```

jump block up (extension)

```
control shift h
```

### Text

visual selection increase indent

```
<select visually>
shift > (pushes to the right)
or
shift < (pushes to the left)
```

quick switch to normal mode

```
control j
control k
```
