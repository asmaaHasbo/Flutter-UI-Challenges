## task2_clean_arch_and_widgets_tour

# Task Manager Challenge 🎯

A Flutter-based task management app with interactive features and clean design.

## 📱 Challenge Overview
Allows viewing, deleting, marking as completed, and reordering tasks with confirmation dialogs and undo functionality.

## ✨ Features
- **Task List Management**: Shows an interactive task list.
- **Swipe-to-Delete**: Swipe to delete with a confirmation dialog.
- **Undo Deletion**: Offers "Undo" via SnackBar.
- **Reorderable List**: Drag and drop to reorder tasks.
- **Task Completion**: Toggles checkboxes with strikethrough.

## 🏗️ Code Summary
- **`ChallengeOneScreen`**: Main screen with `ReorderableListView`, manages tasks and reordering.
- **`DismissibleForList`**: Handles swipe deletion with confirmation and undo SnackBar.
- **`ListItem`**: Displays tasks with drag handle and checkbox.
- **`buildSnackBarForUndoDelete`**: Utility for undo SnackBar in `snackbar_utils.dart`.
- **`buildConfirmationForDelete`**: Shows deletion confirmation dialog.

Uses callbacks for modular state management.

## 🔧 File Structure
- `/lib/`
  - `challenge_one_screen.dart`
  - `dismissible_for_list.dart`
  - `list_item.dart`
  - `snackbar_utils.dart`



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