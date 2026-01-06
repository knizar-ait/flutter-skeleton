# Product Catalog - Flutter Testing Challenge

This is a Flutter testing challenge project designed to evaluate candidates for mobile Flutter developer positions. The project contains **5 intentional runtime bugs** that candidates must identify, diagnose, and fix.

## Prerequisites

**Required Versions:**
- Flutter SDK: 3.35.0 or higher
- Dart SDK: 3.9.2 or higher
- IDE: VS Code / Android Studio / IntelliJ IDEA with Flutter plugin


## Getting Started

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Run the Application

```bash
# Run on connected device/emulator
flutter run

# Or specify a device
flutter run -d <device-id>

# For web
flutter run -d chrome

# For debugging
flutter run --verbose
```

## Project Overview

**App Name:** Product Catalog

**Tech Stack:**
- Flutter UI framework
- Cubit State management
- Repository Pattern: Data layer separation
- Fake API: Simulated async operations with Future.delayed


## Application Features

- Product list with 5 sample products
- Product detail view with full information
- Favorite/unfavorite toggle functionality
- Async data loading with loading states
- Error handling

## Definition of Done

Your task is to ensure the application meets the following acceptance criteria. Test each scenario and fix any issues you encounter.

### 1. Resource Management
**Expected Behavior:**
- App properly manages and cleans up resources during lifecycle
- No memory leaks or resource warnings
- App can be started and stopped without issues

---

### 2. Favorite Functionality
**Expected Behavior:**
- User can click favorite button without any issues
- Favorite icon updates immediately to reflect current state (filled heart when favorited, outline when not)
- Favorite status persists when navigating between screens
- Favorite toggle works correctly from both home and detail screens

---

### 3. Screen Display
**Expected Behavior:**
- Product list screen displays correctly on all screen sizes
- No overflow warnings or visual glitches
- All products are visible and accessible
- Layout adapts properly to different screen dimensions

---

### 4. Navigation Performance
**Expected Behavior:**
- Navigating to product detail screen is smooth and instant
- No unnecessary loading delays when opening product details
- Navigation back to home screen works without issues
- No repeated API calls for already loaded data

---

### 5. State Consistency
**Expected Behavior:**
- User actions (like toggling favorites) reflect immediately in the UI
- Data remains consistent across screen navigation
- No state loss or unexpected behavior during app usage
- UI updates correctly after any user interaction

---

## How to Approach This Challenge

### Step 1: Explore the App
- Run the app and navigate through all screens
- Test the favorite functionality
- Try different screen sizes
- Monitor the debug console for errors and warnings

### Step 2: Use Debugging Tools
- **Dart DevTools:** Memory profiler, widget inspector, network tab
- **Flutter Inspector:** Check widget tree and properties
- **Debug Console:** Look for error messages and stack traces
- **Hot Reload vs Hot Restart:** Observe differences in behavior

### Step 3: Test Each Scenario
- Full user flow: Home → Detail → Toggle Favorite → Back → Home
- Resize the emulator/window to test different screen sizes
- Toggle favorites multiple times
- Navigate back and forth between screens
- Monitor memory usage over time

### Step 4: Document and Fix
- Identify the root cause of each issue
- Apply proper Flutter best practices
- Test your fixes thoroughly
- Ensure each point meets the expected behavior

## Evaluation Criteria

You will be evaluated on:
1. **Issue Identification:** Can you identify the issues?
2. **Root Cause Analysis:** Do you understand WHY each issue occurs?
3. **Solution Quality:** Are fixes correct and follow Flutter best practices?
4. **Testing Approach:** Do you use appropriate debugging tools and techniques?

---

**Goodspeed! Focus on one issue at a time and trust your debugging skills.**
