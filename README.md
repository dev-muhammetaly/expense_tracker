# Expense Tracker

A Flutter app for recording expenses with an amount, date and category. You can add an expense, remove it and undo a removal.

The layout changes between narrow and wide screens.

## Run locally

```sh
flutter pub get
flutter run
```

No backend setup is needed.

## Current state

Expenses are stored in memory, with a few sample entries at startup. Changes are lost when the app restarts. The chart area is still a placeholder.

This project focuses on forms, date input, list updates and responsive layouts. The main screen is in `lib/expanse_tracker/widget/expense.dart`.
