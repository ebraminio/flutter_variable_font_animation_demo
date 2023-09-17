# variable_font_animation_demo

Variable Font Animation

## Getting Started

Anicons fonts are coming from https://github.com/Typogram/Anicons/releases/tag/1.0

lottie2vf-examples fonts are coming from https://github.com/simoncozens/lottie2vf/tree/main/examples

Maintainance script:

`rm -rf build-web-html build-web--canvaskit && flutter build web --web-renderer html --base-href '/flutter_variable_font_animation_demo/build-web-html/' && mv build/web build-web-html && flutter build web --web-renderer canvaskit --base-href '/flutter_variable_font_animation_demo/build-web-canvaskit/' && mv build/web build-web-canvaskit`
