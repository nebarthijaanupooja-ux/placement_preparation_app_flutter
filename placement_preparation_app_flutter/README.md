# Placement Preparation App

A complete Flutter starter project for an aesthetic placement-preparation learning app.

## Included
- Student profile: name, roll number, email, year
- Personalized dashboard
- Forest/Candy-Crush-inspired vertical roadmap
- One module unlock per day
- Formula and definition section
- Worked example
- Five-question practice test
- Score/result screen
- Historical progress bar chart
- Daily reminder scheduling
- Local persistence with SharedPreferences
- Demo Admin login/dashboard
- Admin module/question management UI
- Student activity overview
- Dark/light adaptive Material 3 styling

## Run
```bash
flutter pub get
flutter run
```

## Demo Admin
Email: admin@placement.app
Password: admin123

## Notes
This starter uses local storage for a self-contained demo. For production:
1. Add Firebase Authentication.
2. Store students/modules/questions/progress in Firestore.
3. Use Firebase Cloud Messaging or a production notification strategy.
4. Move admin authorization to server-side security rules.
