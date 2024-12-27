### Geodetect
This Flutter application allows users to detect and count the number of people in a photo selected from the camera or gallery. It also visualizes the detected locations on a map using Google Maps.


#### **Setup**

**Install Dependencies**  
   ```
   flutter pub get
   ```

**Add Google Maps API Keys**
   - **For Android:**  
     Add this line to `android/app/src/main/AndroidManifest.xml`:  
     ```xml
     <meta-data
         android:name="com.google.android.geo.API_KEY"
         android:value="YOUR_ANDROID_GOOGLE_MAPS_API_KEY"/>
     ```

   - **For iOS:**  
     Add this line to `ios/Runner/AppDelegate.swift`:  
     ```swift
     GMSServices.provideAPIKey("YOUR_IOS_GOOGLE_MAPS_API_KEY")
     ```

**Provide a Human Detection Model Endpoint**  
   - The application requires a backend service that processes the images and predicts the number of people in them.
   - You can use the YOLOv8-based detection model available in this repository:  
     [Human Detection with YOLOv8](https://github.com/ozdemirberkay/human-detection-yolov8).
   - Alternatively, set up your own endpoint. Update the serverURL variable in the HumanDetector class, located in the human_detector.dart file:
     ```dart
     static final serverURL = "YOUR_SERVER_BASE_URL";
     ```
   - Ensure your server provides an endpoint (`/predict`) that accepts an image file and responds with a JSON object containing the key `"count"`.  
     Example response:  
     ```json
     {
       "count": 3
     }
     ```

**Run the App**  
   ```
   flutter run
   ```


 








<div align="center">
  <img src="https://github.com/user-attachments/assets/d690500f-5320-4171-a8f0-4639292e97c1" width="270" height="570">
  <img src="https://github.com/user-attachments/assets/2fa45caa-80f0-464d-ac92-c96f64dca2ab" width="270" height="570">
  <img src="https://github.com/user-attachments/assets/1b037c7c-ce87-43a9-9f8c-2b70136a39cd" width="270" height="570">
</div>
