# 📱 **Fampay-assignment**

**Description:**  
An Android app that dynamically renders contextual cards fetched from an API. The cards display text, images, buttons (CTAs), and support deeplink actions.

---

## 🚀 Features  

- **Dynamic Cards**: Renders cards based on API. 
- **Design Types**: Supports HC1, HC3, HC5, HC6, HC9 cards. 
- **Interactions**:
    - Long press HC3 cards to Dismiss Now or Remind Later.
    - Handles deeplinks on buttons and text.
- **Swipe to Refresh**: Reload cards.
- **State Management**: Handles loading, error states, and local storage.


---

### APK File Path
```bash
fampay-assignment\build\app\outputs\flutter-apk\app-release.apk
```



## 🔑 Dependencies Used  

The project uses the following dependencies:  

| **Package**            | **Purpose**                       |
|-------------------------|-----------------------------------|
| `http`                 | For making HTTP API calls                       |
| `shared_preferences`             | For storing key-value pairs locally              |
| `url_launcher`         | For launching URLs and external apps                    |
| `fluttertoast` | 	For displaying toast messages               |


---

## 📸 Screenshots  

| **Home Screen**             | **Home Screen**               | **On Long Press**               | **Drag to refresh**               |**On Buttom Click**               |**On Action button click**               |
|-----------------------------|-----------------------------|-----------------------------|-----------------------------|-----------------------------|-----------------------------|
| <img src="https://github.com/user-attachments/assets/27b7d86e-673b-4b17-9f99-8218d6bcaf34" width="150" height="300" /> | <img src="https://github.com/user-attachments/assets/fbfe481d-8efc-4c3c-b8d7-1c9a30823ce4" width="150" height="300" /> | <img src="https://github.com/user-attachments/assets/077902ac-4b5a-48f0-86b0-3818af556786" width="150" height="300" /> | <img src="https://github.com/user-attachments/assets/4b6084e0-5018-4541-89f8-9be414408dd4" width="150" height="300" /> |<img src="https://github.com/user-attachments/assets/d02cc20a-5b85-4ddb-897f-45a3a72ec380" width="150" height="300"/>|<img src="https://github.com/user-attachments/assets/859ef2b0-94c5-48ef-aa2d-1545960c5eb7" width="150" height="300"/>



## 📂 Project Setup  

Follow these steps to run the project locally:

### 1️⃣ **Prerequisites**  

Ensure you have the following installed:  
- **Flutter SDK**: [Install Flutter](https://flutter.dev/docs/get-started/install)  
- **IDE**: Android Studio or Visual Studio Code  
- **Device/Emulator**: Android/iOS device or simulator  

Check Flutter installation by running:  
```bash
flutter doctor
```

---

### 2️⃣ **Clone the Repository**  
Clone the project to your local system:  
```bash
git clone https://github.com/itsRamit/fampay-assignment.git
```
```bash
cd fampay-assignment
```

---

### 3️⃣ **Install Dependencies**  
Install the required Flutter dependencies:  
```bash
flutter pub get
```

---

### 4️⃣ **Run the Application**  

To run on an **Android** device:  
```bash
flutter run
```
