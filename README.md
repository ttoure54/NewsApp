# NewsApp
NewsApp est une application simple qui permet de récupérer les derniers articles français de l'API "newsapi"
 
## Previews
 
 
## Realisation
Cette application est conçue en se basant sur une architecture MVVM. Elle possèede 3 views. Developpé avec UIkit afin de permettre une plus grande compatibilité iOS, en particluier pour les anciennes versions < 13.0.
 
- LaunchScreen: View affiché au lancement de l'application 
- NewsTableViewController : View principale qui liste les articles récupérer via l'API. J'ai choisi d'utiliser une "TableView" qui semble être l'élément le plus adapté pour ce type d'affichage.
- NewsDetailViewController : Affiche plus d'informations sur l'article choisi.

 Ces 3 views sont mise en place par le biais d'un NaviagationViewController
