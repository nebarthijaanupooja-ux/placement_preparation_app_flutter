# Production notes

The app is intentionally self-contained and uses local SharedPreferences.

For a real multi-student/admin product:
- Firebase Authentication for students/admins
- Firestore for modules, questions, progress and student activity
- Firestore Security Rules for role-based access
- Cloud Functions/FCM or a reliable local notification implementation for reminders
- Server-side validation for question answers and admin writes
- Do not keep admin credentials in the Flutter client
