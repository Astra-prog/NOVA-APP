# NOVA - Authentication Setup Guide

## 🔥 Firebase Configuration

This guide will help you configure Firebase for Google & Apple authentication in your NOVA app.

### Prerequisites

- Firebase account
- Apple Developer account (for Apple Sign-In)
- Android Studio / Xcode installed

---

## Step 1: Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Click "Add project"
3. Enter project name: `NOVA Groundwater`
4. Enable Google Analytics (optional)
5. Create project

---

## Step 2: Android Setup

### 2.1 Add Android App to Firebase

1. In Firebase Console, click "Add app" → Android
2. Enter package name: `com.nova.groundwater` (or your package name from `android/app/build.gradle`)
3. Download `google-services.json`
4. Place file in `android/app/google-services.json`

### 2.2 Update Android Build Files

**`android/build.gradle`:**
```gradle
buildscript {
    dependencies {
        // Add this line
        classpath 'com.google.gms:google-services:4.4.0'
    }
}
```

**`android/app/build.gradle`:**
```gradle
// At the bottom of the file, add:
apply plugin: 'com.google.gms.google-services'
```

### 2.3 Get SHA-1 Fingerprint

For Google Sign-In to work, you need to add your SHA-1 fingerprint:

```bash
cd android
./gradlew signingReport
```

Copy the SHA-1 fingerprint and add it in Firebase Console:
- Project Settings → Your apps → Android app → Add fingerprint

---

## Step 3: iOS Setup

### 3.1 Add iOS App to Firebase

1. In Firebase Console, click "Add app" → iOS
2. Enter bundle ID from `ios/Runner.xcodeproj`
3. Download `GoogleService-Info.plist`
4. Open `ios/Runner.xcworkspace` in Xcode
5. Drag `GoogleService-Info.plist` into Runner folder (check "Copy items if needed")

### 3.2 Configure URL Schemes

1. Open `GoogleService-Info.plist` in a text editor
2. Find `REVERSED_CLIENT_ID` value
3. Open `ios/Runner/Info.plist` in Xcode
4. Add URL scheme:

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <!-- Copy REVERSED_CLIENT_ID here -->
            <string>com.googleusercontent.apps.YOUR-CLIENT-ID</string>
        </array>
    </dict>
</array>
```

### 3.3 Enable Apple Sign-In Capability

1. Open `ios/Runner.xcworkspace` in Xcode
2. Select Runner target
3. Go to "Signing & Capabilities"
4. Click "+ Capability"
5. Add "Sign in with Apple"

---

## Step 4: Enable Authentication Methods in Firebase

1. Go to Firebase Console
2. Navigate to **Authentication** → **Sign-in method**
3. Enable the following providers:

### Email/Password
- Click "Email/Password"
- Enable it
- Save

### Google
- Click "Google"
- Enable it
- Add support email
- Save

### Apple
- Click "Apple"
- Enable it
- Configure (requires Apple Developer Account):
  - Create Service ID in Apple Developer Portal
  - Configure Sign in with Apple
  - Add Service ID and Team ID in Firebase

---

## Step 5: Apple Developer Portal Configuration

### 5.1 Create App ID

1. Go to [Apple Developer Portal](https://developer.apple.com/account)
2. Certificates, Identifiers & Profiles → Identifiers
3. Click "+" → App IDs
4. Enter description and bundle ID (must match your iOS app)
5. Enable "Sign in with Apple"
6. Save

### 5.2 Create Service ID

1. Certificates, Identifiers & Profiles → Identifiers
2. Click "+" → Services IDs
3. Enter identifier (e.g., `com.nova.groundwater.signin`)
4. Enable "Sign in with Apple"
5. Configure:
   - Primary App ID: Select the App ID from step 5.1
   - Domains: Copy from Firebase Console  
   - Return URLs: Copy from Firebase Console
6. Save

### 5.3 Create Key

1. Certificates, Identifiers & Profiles → Keys
2. Click "+" → Create a key
3. Enable "Sign in with Apple"
4. Download the `.p8` key file
5. Note the Key ID

### 5.4 Configure in Firebase

1. Firebase Console → Authentication → Sign-in method → Apple
2. Enter:
   - Service ID
   -Team ID (find in Apple Developer Portal)
   - Key ID
   - Upload `.p8` file
3. Save

---

## Step 6: Test Authentication

### Test on Android

```bash
flutter run -d <android-device>
```

1. Navigate to login screen
2. Tap "Google" button
3. Select Google account
4. Verify successful login

### Test on iOS

```bash
flutter run -d <ios-device>
```

1. Navigate to login screen
2. Tap "Apple" button
3. Authenticate with Face ID/Touch ID
4. Verify successful login

### Test Email Signup

1. Click "Sign Up"
2. Fill in form
3. Create account
4. Verify account creation

---

## Troubleshooting

### Google Sign-In Issues

**Problem**: "Developer Error" or "12500 error"
**Solution**: 
- Ensure SHA-1 fingerprint is added in Firebase
- Check package name matches
- Rebuild app after adding SHA-1

**Problem**: "Sign in failed"
**Solution**:
- Check `google-services.json` is in correct location
- Verify Google Sign-In is enabled in Firebase Console
- Clear app data and try again

### Apple Sign-In Issues

**Problem**: "Invalid client" error
**Solution**:
- Verify Service ID is correctly configured
- Check bundle ID matches
- Ensure capability is added in Xcode

**Problem**: "Not supported" error
**Solution**:
- Apple Sign-In only works on iOS devices (not simulator in some cases)
- Test on real device

### Firebase Initialization Failed

**Problem**: App crashes on startup
**Solution**:
- Check `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) are correctly placed
- Verify Firebase project is active
- Check internet connection

---

## Security Best Practices

1. **Never commit Firebase config files to public repos**
   - Add to `.gitignore`:
     ```
     android/app/google-services.json
     ios/Runner/GoogleService-Info.plist
     ```

2. **Use Firebase App Check** (optional but recommended)
   - Protects backend from abuse
   - Set up in Firebase Console

3. **Implement Email Verification**
   - Send verification emails
   - Block unverified users from sensitive actions

4. **Add reCAPTCHA** for web (if applicable)
   - Prevents bot attacks

---

## Next Steps

After completing Firebase setup:

1. ✅ Run the app and test all auth methods
2. ✅ Verify auth state persistence
3. ⬜ Implement email verification flow
4. ⬜ Add profile photo upload functionality
5. ⬜ Implement password reset
6. ⬜ Add account deletion feature
7. ⬜ Set up Firebase Analytics
8. ⬜ Configure Crashlytics

---

## Useful Commands

```bash
# Get packages
flutter pub get

# Run build_runner
flutter pub run build_runner build --delete-conflicting-outputs

# Clean build
flutter clean && flutter pub get

# Run on device
flutter run

# Build APK
flutter build apk

# Build iOS
flutter build ios
```

---

## Resources

- [Firebase Setup for Flutter](https://firebase.google.com/docs/flutter/setup)
- [Google Sign-In Documentation](https://pub.dev/packages/google_sign_in)
- [Apple Sign-In Documentation](https://pub.dev/packages/sign_in_with_apple)
- [Firebase Authentication Docs](https://firebase.google.com/docs/auth)

---

## Support

If you encounter issues:
1. Check Firebase Console for error logs
2. Review Flutter doctor output: `flutter doctor -v`
3. Check device logs
4. Ensure all dependencies are up to date

**Happy coding! 🚀**
