# Mobile Migration Next Steps

## Desktop Code Removal Plan

For our mobile-only conversion, we need to remove all desktop-specific code. This document outlines the specific steps to take.

### Directories to Remove

The following directories contain desktop-specific code and should be removed:

1. `webdirectories/lib/PanelBeatersDirectory/desktop/` - All desktop views for Panel Beaters
2. `webdirectories/lib/WebDirectories/` (except for the `Mobile` subdirectory) - Desktop Web views

### Steps for Removal

1. **Backup the codebase** before removing any files
   ```bash
   cp -r webdirectories webdirectories_backup
   ```

2. **Remove desktop directories**
   ```bash
   # Remove Panel Beaters desktop code
   rm -rf webdirectories/lib/PanelBeatersDirectory/desktop/
   
   # Create a temporary directory for mobile content
   mkdir -p temp_mobile
   
   # Copy mobile content to a safe location
   cp -r webdirectories/lib/WebDirectories/Mobile/* temp_mobile/
   
   # Remove WebDirectories (which contains both desktop and mobile)
   rm -rf webdirectories/lib/WebDirectories/
   
   # Create a new Mobile directory and restore mobile content
   mkdir -p webdirectories/lib/WebDirectories/Mobile
   cp -r temp_mobile/* webdirectories/lib/WebDirectories/Mobile/
   
   # Clean up
   rm -rf temp_mobile
   ```

3. **Update imports and references**
   - Search for and update/remove any remaining imports that reference desktop components
   - Update router configurations to use mobile-only routes

### Testing After Removal

After removing the desktop code:

1. Run the Flutter doctor to check for any issues:
   ```bash
   flutter doctor -v
   ```

2. Clean the project:
   ```bash
   flutter clean
   ```

3. Get dependencies:
   ```bash
   flutter pub get
   ```

4. Run a build to check for errors:
   ```bash
   flutter build apk --debug
   ```

5. Test on a mobile device or emulator:
   ```bash
   flutter run
   ```

### Benefits of Removing Desktop Code

- **Reduced codebase size**: Smaller app size and faster build times
- **Simplified maintenance**: No need to maintain two separate view hierarchies
- **Focused development**: All effort can be directed at improving the mobile experience
- **Cleaner architecture**: Removal of conditional logic based on screen size
- **Improved performance**: Mobile app doesn't need to load unused desktop components

### Potential Issues to Watch For

- Missing shared components that were in desktop directories
- Broken navigation routes that previously referenced desktop views
- Business logic that was embedded in desktop components rather than in shared services

If you encounter any issues during this process, refer to the backup codebase to identify and extract any necessary shared components or business logic that may have been inadvertently removed. 