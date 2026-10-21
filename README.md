![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![SQLite](https://img.shields.io/badge/sqlite-%2307405e.svg?style=for-the-badge&logo=sqlite&logoColor=white)
![Android](https://img.shields.io/badge/Android-%233DDC84.svg?style=for-the-badge&logo=android&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-%23000000.svg?style=for-the-badge&logo=ios&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)

# Personal Finance Application

A cross-platform mobile application designed to help track, organize, and visualize daily income and expenses intuitively and without needing an internet connection.

<br>

## Table of Contents

- [Personal Finance Application](#personal-finance-application)
  - [Table of Contents](#table-of-contents)
  - [1- Description](#1--description)
    - [1.1- Key Features](#11--key-features)
    - [1.2- Screens](#12--screens)
    - [1.3- Screenshots](#13--screenshots)
  - [2- Architecture](#2--architecture)
    - [2.1- Tech Stack](#21--tech-stack)
    - [2.2- Folder Structure (Layer-First)](#22--folder-structure-layer-first)
  - [3- Requirements](#3--requirements)
    - [3.1- Functional Requirements](#31--functional-requirements)
    - [3.2- Non-Functional Requirements](#32--non-functional-requirements)
  - [4- Development and Execution Guide](#4--development-and-execution-guide)
    - [4.1- Setup Environment](#41--setup-environment)

<br>

## 1- Description

### 1.1- Key Features

- **Transaction Tracking:** Dynamic addition, editing, and deletion of income and expenses
- **Customizable Categories:** Transaction organization through categories with adaptable colors and icons
- **Monthly Budgets:** Spending limits per category with visual progress indicators
- **Data Export:** Backup generation and history export of income and expenses in format
- **Visual Reports:** Expense distribution and monthly evolution, accompanied by daily average metrics and graphics
- **Bank Statement:** Document upload (PDF/CSV) for automatic transaction extraction and adaptation to the app's model
- **Alerts and Notifications System:** Configurable local notifications when approaching or exceeding budget limits

### 1.2- Screens

1. **Home:** Monthly general balance, income/expense summary, and quick access to recent transactions
2. **Transactions:** Filtered history tabs with support for editing or deleting
3. **New Transaction / Edit:** interface for quick entry of amounts, category selection, and notes of transactions
4. **Budgets:** Visualization of total monthly limit, progress bars per category, and remaining days in the cycle
5. **Reports:** Expense distribution chart, monthly evolution, and percentage comparison against the previous month
6. **Alerts & Preferences:** Local notification center and setup for alert thresholds and daily reminders
7. **Categories:** Listing and reordering of active categories with custom creation option
8. **Bank Statement Upload:** Bank file selection interface for automated transaction extraction and reconciliation

### 1.3- Screenshots

|     Home     | Transactions |  New / Edit  |    Budgets   |
| :----------: | :----------: | :----------: | :----------: |
||||

|   Reports    |    Alerts    |  Categories  |  Statements  |
| :----------: | :----------: | :----------: | :----------: |
||||

<br>

## 2- Architecture

### 2.1- Tech Stack

**Tools**
- Flutter Framework 
- Dart Language
- Local SQLite Database

**Packages**
- State management with `provider`
- Efficient charting with `fl_chart`
- File management with `file_picker` + parser 

**Standardization**
- Google design rules with `flutter_lints`
- Automatic formatting with `dart format` 
- Commit messages with `conventional commits`

### 2.2- Folder Structure (Layer-First)

```
lib/
    models/                  # data classes
    views/                   # screens
    widgets/                 # reusable components
    services/                # data logic (database, parsers)
    viewmodels/              # state logic (providers, notifiers)
    constants/               # global resources (colors, routes)
    main.dart
```

<br>

## 3- Requirements

### 3.1- Functional Requirements

- **FR-01:** The system must display monthly data along with weekly details about expenses and income, as well as recent transactions, to the user
- **FR-02:** The system must allow the user to view financial transaction history by type (all, income, or expenses)
- **FR-03:** The system must allow the user to record transactions by specifying type (income/expense), category, amount, date, and description
- **FR-04:** The system must allow the user to check monthly budget broken down by category, showing total assigned amount, consumed amount, and available balance
- **FR-05:** The system must allow the user to set monthly budgets per category with spending limit amounts and customizable alerts
- **FR-06:** The system must allow the user to view and manage alerts and adjust preferences
- **FR-07:** The system must generate statistical charts for expense and income distribution, historical behavior and analysis interpretation of key metrics
- **FR-08:** The system must be able to evaluate attached bank statements, process text, and map discovered transactions to app categories
- **FR-09:** Storage must operate locally via SQLite, ensuring total security without requiring linked bank accounts
- **FR-10:** The system must handle data asynchronously using try-catch blocks to prevent unexpected crashes

### 3.2- Non-Functional Requirements

- **NFR-01:** Performance, the interface must maintain a constant frame rate of 60 frames per second (FPS) during transitions and navigation
- **NFR-02:** Offline Availability, the application must be fully functional without an internet connection
- **NFR-03:** Compatibility, the application must have native support for Android and iOS platforms

<br>

## 4- Development and Execution Guide

### 4.1- Setup Environment

**Pre-Requisites**
- Flutter SDK `>=3.19.0`
- Dart SDK `>=3.3.0`
- Android Studio / Xcode 

**Local Execution**
- Clone repository `git clone url.git`
- Open terminal `ctrl + j`
- Go to project root `cd app`
- Clean cache `flutter clean`
- Install dependencies `flutter pub get`
- Run Unit Tests `flutter test`
- Run project `flutter run`