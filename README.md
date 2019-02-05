# flutter_images_slider

 A carousel slider widget, support infinite scroll and custom indicator, with autoplay feature.

## Installation

Add carousel_slider: ^0.0.1 in your pubspec.yaml dependencies. And import it:

```
import 'package:flutter_images_slider/flutter_images_slider.dart';
```

## How to use

Create a ImagesSlider widget, and pass the required params:

```
        ImagesSlider(
          items: map<Widget>(imgList, (index, i) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(i),
                      fit: BoxFit.cover
                  )
              ),
            );
          }),
          autoPlay: true,
          viewportFraction: 1.0,
          aspectRatio: 2.0,
          distortion: false,
          align: IndicatorAlign.bottom,
          indicatorWidth: 5,
          updateCallback: (index) {
            setState(() {
              _current = index;
            });
          },
        )
```

<img src="example/slider.gif" width="300">

## Credits

[flutter_carousel_slider](https://github.com/serenader2014/flutter_carousel_slider)