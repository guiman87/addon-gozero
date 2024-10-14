# Go-Zero Home Assistant Add-On

Welcome to the Go-Zero Home Assistant Add-On project! This custom add-on integrates a voice assistant built using Next.js and TensorFlow.js into your Home Assistant environment. This add-on provides a smart assistant experience similar to Alexa, but is tailored for Home Assistant users and can be customized by the community.

## Overview

Go-Zero is a Home Assistant add-on that installs a voice-controlled web app from the following GitHub repository: [Go-Zero GitHub Repository](https://github.com/guiman87/go-zero.git). This app is a custom-built voice assistant that utilizes TensorFlow.js and browser-based speech recognition to offer a similar experience to Amazon Alexa or Google Home.

### Key Features

- **Wake Word Detection**: Uses the wake word "go zero" to activate the assistant, implemented with TensorFlow.js.
- **Custom Voice Assistant**: A Next.js app that acts as a custom voice assistant, responding to commands after wake word detection.
- **Local and Secure**: This add-on allows for local processing of voice commands through Home Assistant, without reliance on third-party cloud services.
- **Voice Control UI**: The Next.js app provides a simple and intuitive user interface to control the assistant.

## Installation and Setup

1. Clone or download this repository.
2. Extract the contents of the repository and copy the add-on folder to your Home Assistant `addons` directory.
3. Navigate to the Home Assistant Supervisor UI and click on "Add-on Store."
4. Click on the "+" button and then select the add-on from your local repository.
5. Configure the add-on as per your needs, including the Home Assistant URL and token for integration.
6. Start the add-on to deploy the Go-Zero web app and run the assistant.

## Add-On Configuration

The add-on configuration is customizable and includes options such as:

- **Wake Word Sensitivity**: Control the sensitivity for recognizing the wake word "go zero."
- **Speech Synthesis Settings**: Options for selecting voice, pitch, rate, and start delay for the assistant's responses.
- **Next.js Application Integration**: Deploys the Go-Zero web app, which uses speech recognition and the Speech Synthesis API.

### Configuration Example
Below is an example configuration for the add-on (`config.yaml`):

```yaml
name: "Go-Zero Voice Assistant"
version: "1.0.0"
init: false
slug: "go-zero-assistant"
description: "Custom Home Assistant Add-On for Go-Zero Voice Assistant"
arch:
  - armv7
  - amd64
map:
  - share:rw
services:
  - mqtt:need
environment:
  HOME_ASSISTANT_TOKEN: "YOUR_HA_TOKEN"
  HOME_ASSISTANT_URL: "YOUR_HA_URL"
  REPOSITORY_URL: "https://github.com/guiman87/go-zero.git"
options:
  smtp_server: "smtp.example.com"
  smtp_port: 587
  smtp_user: "user@example.com"
  smtp_password: "password"
  auth_token: "Actitime API token"
  recipient_email: "recipient@example.com"
  cc_email: "guiman.uy@gmail.com"
  hour_rate: 25
schema:
  smtp_server: str
  smtp_port: int
  smtp_user: str
  smtp_password: str
  auth_token: str
  recipient_email: str
  cc_email: str
  hour_rate: float
```

## Wake Word Detection with TensorFlow.js

The Go-Zero assistant uses TensorFlow.js to recognize the wake word "go zero." The model is a browser-based speech commands model that listens for specific audio patterns. Once the wake word is detected, the assistant becomes active and ready to receive and process spoken commands.

### How It Works
- **TensorFlow.js and Speech Commands**: The model is loaded and configured using TensorFlow.js, specifically the `speech-commands` package.
- **WebGL Backend**: The app tries to use the WebGL backend for optimal performance, but falls back to CPU if necessary.
- **Wake Word Buffer**: The wake word "go zero" is detected by maintaining a small buffer of recently recognized words and matching them in sequence.

## Speech Recognition and Synthesis

- **Speech Recognition**: After detecting the wake word, the assistant utilizes the browser's built-in Speech Recognition API to listen to user commands.
- **Speech Synthesis**: The assistant responds using the Speech Synthesis API, providing verbal feedback to the user.
- **Voice Customization**: Users can customize the assistant's voice, including pitch, rate, and voice selection, through the app's UI.

## Contributing

This add-on is an open-source project, and contributions are welcome! To contribute:

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature-branch-name`).
3. Make your changes and test thoroughly.
4. Commit and push your branch.
5. Open a Pull Request.

### Issues and Improvements
If you encounter issues or have suggestions for improvement, please open an issue on the GitHub repository. The goal is to make the Go-Zero assistant more capable, customizable, and easy to use.

## License
This project is licensed under the MIT License.

## Acknowledgements
- **Home Assistant Community**: For providing an excellent open-source platform for home automation.
- **TensorFlow.js**: For providing a flexible and powerful library for machine learning in the browser.

