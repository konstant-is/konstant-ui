# Konstant UI

Konstant UI is a Flutter component generator package that simplifies the creation of UI components, allowing for more efficient Flutter app development.

## Table of Contents

- [Konstant UI](#konstant-ui)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Features](#features)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Generating Components](#generating-components)
  - [Contributing](#contributing)
  - [Components](#components)

## Introduction

Konstant UI is designed to streamline the UI component creation process in Flutter projects. It provides a way to generate common UI components quickly and easily, saving developers time and effort.

## Features

- **Efficient Component Generation:** Generate Flutter UI components with just a few simple commands.
- **Customizable Templates:** Customize the generated components through a simple configuration file.
- **Easy to Use:** Straightforward usage and integration with existing Flutter projects.

## Installation

To get started with Konstant UI, add it as a development dependency in your Flutter project's `pubspec.yaml` file:

```yaml
dev_dependencies:
  konstant_ui: ^1.0.0
```

## Usage

Konstant UI simplifies the process of creating Flutter UI components. To generate components, run the following command:

```
flutter pub run konstant_ui add button
```

This command triggers Konstant UI to read the configuration file (konstant_ui.json) and generate the specified components in the project directory.

## Generating Components

Konstant UI uses a konstant_ui.json configuration file to determine which components to generate. The JSON file includes details about the components and their configurations. Here's an example configuration:

```json
{
  "colors": {
    "primary": "#3498db",
    "secondary": "#2ecc71"
  },
  "components": ["button", "card", "textfield"]
}
```

In this example, Konstant UI will generate components for buttons, cards, and text fields based on the specified colors.

## Contributing

Contributions to Konstant UI are welcome! Feel free to open issues, make feature requests, or submit pull requests. Please follow the Contributing Guidelines when contributing to this project.

## Components

- [x] Accordion
- [x] Alert
- [x] Alert Dialog
- [ ] Aspect ratio
- [x] Avatar
- [x] Badge
- [x] Button
- [ ] Calendar
- [ ] Card
- [x] Checkbox
- [ ] Collapsible
- [ ] Combobox
- [ ] Command
- [ ] Context menu
- [ ] Data table
- [ ] Date picker
- [x] Dialog
- [ ] Dropdown menu
- [ ] Form
- [ ] Hover Card
- [x] Input
- [ ] Label
- [ ] Menubar
- [ ] Navigation menu
- [ ] Popover
- [ ] Progress
- [x] Radio group
- [ ] Scroll area
- [ ] Select
- [x] Seperator
- [ ] Sheet
- [x] Skeleton
- [ ] Slider
- [x] Switch
- [ ] Table
- [x] Tabs
- [ ] Textarea
- [ ] Toast
- [x] Toggle
- [ ] Tooltip
