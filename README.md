## task2_clean_arch_and_widgets_tour

### --------------------------------- challang one ----------------------

### Project Overview

The Task Manager App is a Flutter-based mobile application designed to manage tasks efficiently. It allows users to view, delete, mark as completed, and reorder tasks interactively. Built with Flutter's widget system, the app features a responsive and intuitive interface with swipe-to-delete, confirmation dialogs, and undo functionality. This project showcases clean code practices, modular design, and proper state management, making it an excellent learning resource for structuring Flutter applications.

---

### Features

- **Task List Management**: Displays an interactive list of tasks.
- **Swipe-to-Delete**: Swipe tasks to delete, with a confirmation dialog to prevent errors.
- **Undo Deletion**: Shows a SnackBar with an "Undo" option to restore deleted tasks.
- **Reorderable List**: Allows drag-and-drop reordering of tasks.
- **Task Completion**: Marks tasks as completed with a checkbox and strikethrough effect.

---

### <span style="color: #E91E63;">Code Summary</span>

The Task Manager App follows a clean architecture approach in Flutter, emphasizing modularity and maintainability. Below is a summary of the key components and their roles:

- **`ChallengeOneScreen` (StatefulWidget)**:

  - The main screen, featuring a `Scaffold` with an `AppBar` and a `ReorderableListView`.
  - Manages the task list state (`List<String> tasks`) and handles reordering via the `onReorder` callback.
  - Provides callbacks (`_removeTask` and `_undoRemoveTask`) to `DismissibleForList` to handle task deletion and undo operations, ensuring a single source of truth for state changes.

- **`DismissibleForList` (StatelessWidget)**:

  - A reusable widget wrapping each task in a `Dismissible` for swipe-to-delete functionality.
  - Displays a red background with a delete icon during swipes.
  - Triggers a confirmation dialog before deletion and a SnackBar with an "Undo" option after deletion.
  - Relies on callbacks from `ChallengeOneScreen` to avoid direct state manipulation.

- **`ListItem` (StatefulWidget)**:

  - Represents a single task as a `Card` with a `ListTile`.
  - Includes a drag handle for reordering, a task title, and a checkbox for marking tasks as completed.
  - Applies a strikethrough effect to the title when the checkbox is checked.

- **`buildSnackBarForUndoDelete` (Utility Function)**:

  - Defined in `snackbar_utils.dart`, builds a `SnackBar` for undoable task deletions.
  - Accepts a task, index, and callback for the undo action, promoting reusability.

- **`buildConfirmationForDelete` (Utility Function)**:
  - Displays an `AlertDialog` to confirm task deletion.
  - Returns `true` to confirm or `false` to cancel, ensuring user intent is verified.

The code ensures modularity by separating UI components, state management, and utilities. Callbacks are used to prevent direct state changes in child widgets, maintaining consistency and scalability.

---

### <span style="color: #9C27B0;">File Structure</span>

```plaintext
lib/
├── main.dart
├── challenge1/
│   ├── challenge_one_screen.dart          # Main screen with task list
│   ├── widgets/
│   │   ├── build_dismissible_for_list.dart  # Dismissible widget for tasks
│   │   ├── build_confirmation_for_delete.dart  # Confirmation dialog utility
│   │   ├── build_snack_bar_for_undo_delete.dart  # SnackBar utility
│   │   ├── list_item.dart                # Task item widget
├── utils/
│   ├── snackbar_utils.dart               # SnackBar utility function
```

### ------------------------------ challang two ----------------------------------
# Drag and Drop Challenge 🔴🔵🟢

A simple Flutter project for a drag-and-drop game where colored balls can be placed into matching colored boxes.

## 📱 Project Overview
This app lets you drag balls (red, blue, green) and drop them into boxes of the same color. The box changes color and shows a checkmark when a ball is dropped.

## ✨ Features
- **🎯 Drag and Drop**: Drag balls to matching boxes.
- **🎨 Visual Feedback**: Boxes highlight and change color on valid drops.
- **✅ Success Indicator**: Checkmark appears in the box when a ball is dropped.

## 🏗️ Code Structure
- **📦 Main Components**:
  - `ChallangeTwo`: Main widget.
  - `DragableBallsRow`: Displays draggable balls.
  - `DragTargetBox`: Handles drop zones.

## 🔧 Customization
- **Change Ball Colors**: Modify `balls` list in `_ChallangeTwoState`.
- **Adjust Box Size**: Update `height` in `DragTargetBox`.

## 🎯 Requirements Achieved
- ✅ Supports dragging and dropping balls.
- ✅ Matches balls to boxes by color.
- ✅ Visual feedback on drop.

## 🔍 How It Works
- Drag a ball and drop it into a box of the same color.
- The box turns the ball's color and shows a checkmark.
- Balls stay visible after dropping.
### ------------------------------ challang three ----------------------------------
# Sequential Loading Dots Animation 🔵🔵🔵

A simple Flutter project that creates a smooth loading animation with three dots. The dots animate one after the other with a cool scaling and fading effect.

## 📱 Project Overview
This project builds a sequential loading dots animation using Flutter. The dots scale up, fade in and out, and overlap slightly for a polished look. It runs in a continuous loop.

## ✨ Features
- **🎯 Sequential Animation**: 
  - Each dot starts 150ms after the previous one.
  - Subtle overlap during scaling.
  - Loops endlessly without stopping.
- **🎨 Visual Effects**: 
  - Dots grow to 1.4x their size.
  - Opacity changes from 30% to 100%.
  - Soft shadow around each dot.
  - Smooth transitions with easing curves.
- **🛡️ Safety**: 
  - Prevents errors like RangeError.
  - Avoids freezing during animation.
  - Cleans up memory with `dispose()`.

## 🏗️ Code Structure
- **📦 Main Components**:
  - `SequentialLoadingDots`: The main widget.
  - `DotsContainer`: Holds the dots.
  - `AnimatedDot`: Controls each dot's animation.
  - `AnimationConfig`: Stores animation settings.

## 🔧 Customization
You can tweak the animation easily:
- **Change Dot Color**:
  ```dart
  static const Color dotColor = Colors.red; // Default is Colors.blue