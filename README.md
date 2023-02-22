
<h1 align="center">Custom Progress Bar for Roku</h1>

<p align="center">
  <i>This is a custom progress bar component for Roku that uses only Roku native components. It provides a simple and easy-to-use way to display progress information in your Roku channel.</i>
</p>

![dev](https://user-images.githubusercontent.com/52960334/220727141-4ccf3dc8-a780-4623-a81c-5902113a0a75.jpg)


## 🏁 Getting Started

To use this progress bar component in your Roku channel, you'll need to follow these steps:

1. Download the `ProgressBar.brs` and `ProgressBar.xml` files from this repository.

2. Copy these files to your Roku project directory.

3. In your Roku SceneGraph XML file, add the following line to import the progress bar component:

```xml
    <ProgressBar id="progressBar" width="1000" height="10" translation="[500, 500]" />
```
4. In your Roku BrightScript code, get the instance of progressBar and give progress value

```
progressBar = m.top.findNode("progressBar")
progressBar.progress = 0.5
```

## 🖌️ Customization

You can customize the appearance and behavior of the progress bar with interfaces exposed for this purposes. Or, you can have additional modifications by directly accessing the progressBar.xml file. This file contains the scene graph definition for the progress bar component, which you can modify to change its appearance, behavior, and functionality. 

Interfaces available for customization are
```
<field id="progressBarBackgroundColor" value="#FFFF00" alias="backgroundRect.color" />
<field id="progressBarColor" value="#FF0000" alias="progressRect.color" />
<field id="scrubberColor" value="#FFFFFF" alias="scrubber.blendColor" />
```

The rectangles in this progressBar can be replaced with posters. This will help us achieve rounded corners for the bars.- But, for simplicity I'm not doing that here.

## 🏦 Contributing

If you find a bug or would like to contribute to this project, please submit an issue or a pull request. I would be more than happy to see if someone actually using my code.

## 👮🏽‍♀️ License

Feel free to use it anywhere you want.

## 📬 Contact

If you have any questions or comments about this project, please contact me at gokulplkl@gmail.com
