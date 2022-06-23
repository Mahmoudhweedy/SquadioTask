** About APP: 
     -  an application which is depending on API returns movies and describtions about them and the main actor, through the app, the user can Find those           main actors and with thier photos.
        By selecting an actor, it redirects to his/her profile and can download thier photos as well.


*** Notice: The application runs with Clean Architecture, I separated the layers to ( Data - Domaim - Presentation ) layer to make the code more cleaner                and structed.

    Dart version : 2.17.0
        
    Flutter version : 3.0.0
    
    Install Dependencies: 
      in the terminal run:
        - flutter pub get
        
    Run App: 
      in the terminal run:
        - flutter run
        
    Run Tests: 
      in the terminal run:
        - flutter test
        
        
App Features:
  - List the actors in list view with infinite scroll pagination.
  - The selected actor opens in new screen which contains his/her images in grid view.
  - The selected image opens in its dimensions with a button which can save the image to the gallery.
        
        
     
