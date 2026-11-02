# Godot ASCII Renderer

A two-step Godot shader that converts a texture to a grid of colored characters.

![The Godot icon spinning, rendered as colored ASCII characters](docs/spinning-icon.gif)

All files in [project/](project/) except those excluded by [project/NOTICE](project/NOTICE) are available under a [CC0 License](project/LICENSE).

## Usage

### Sizing

* $\text{GlyphData size} = \text{Character grid size}$

    Since JetBrains Mono is 0.6 times as wide as it is tall, I used $\left(\frac{\text{Window size}_x}{0.6 \, \cdot \, 8}, \frac{\text{Window size}_y}{8}\right)$ as the character grid size.

* $\text{Content size} = \text{Character grid size} \cdot \text{NUM\_SAMPLES}$

    NUM_SAMPLES is defined as $4$ in [glyph_data.gdshader](project/glyph_data.gdshader#L6).

### Input Forwarding

To forward inputs, put the content SubViewport into a SubViewportContainer and update the reference in the glyph data shader parameters.

## Attribution

[**JetBrainsMono-Bold.ttf**](atlas/JetBrainsMono-Bold.ttf): From [JetBrains Mono](https://www.jetbrains.com/lp/mono/) ([SIL Open Font License 1.1](https://github.com/JetBrains/JetBrainsMono/blob/master/OFL.txt))

**Demo**: Dodge the Creeps from [godot-demo-projects](http://github.com/godotengine/godot-demo-projects/) ([MIT License](demo/LICENSE))