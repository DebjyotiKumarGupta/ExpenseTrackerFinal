
## Personal Expense Tracker App

### Overview

This mobile application is designed to help users track and manage their personal expenses efficiently. It offers features such as adding, viewing, editing, and deleting expenses, along with expense summaries categorized by type on a weekly or monthly basis. Additionally, users can set up reminder notifications to ensure they record their daily expenses. The app is built using Flutter, implementing Clean Architecture principles and employing the MVVM design pattern along with GetX for state management.

### Setup Instructions

1. Clone the repository:
   ```
   git clone https://github.com/your-username/ExpenseTrackerFinal.git
   ```
2. Navigate to the project directory:
   ```
   cd expense-tracker-app
   ```
3. Ensure you have Flutter installed. If not, follow the installation instructions [here](https://flutter.dev/docs/get-started/install).
4. Get the dependencies:
   ```
   flutter pub get
   ```
5. Run the app on your device or emulator:
   ```
   flutter run
   ```

### Features

- **Add Expense**: Users can input the amount, date, and description of the expense.
- **View Expenses**: Display expenses in a list, sorted and filterable by date.
- **Edit/Delete Expense**: Modify or remove expense entries.
- **Expense Summary**: Show summaries categorized by type, on a weekly or monthly basis.
- **Reminder Notifications**: Set up reminders for users to record their daily expenses.

### Architecture & Design Decisions

- **MVVM Architecture**: Separation of concerns between the View, ViewModel, and Model layers for better maintainability and testability.
- **GetX State Management**: Utilized for its simplicity and ease of use, providing reactive state management and dependency injection.
- **Clean Architecture**: Emphasized to ensure modularity, testability, and maintainability by clearly defining layers and dependencies.
- **Local Data Persistence**: Implemented using SQLite for efficient storage and retrieval of expense data.
- **Responsive UI/UX**: Utilized Flutter's responsive widgets and consistent theme for a visually appealing interface.
- **Local Notifications**: Employed for reminder notifications using Flutter's local notification plugin, ensuring effective scheduling and management.

### Testing Approach

- **Unit Testing**: Conducted thorough unit testing, part
  icularly focusing on business logic within ViewModel classes.
- **Code Coverage**: Aimed for substantial code coverage using relevant testing frameworks and practices to ensure the reliability and robustness of the application.

For any further inquiries or assistance, please contact [karanguptadev123@gmail.com](mailto:karanguptadev123@gmail.com).
#
