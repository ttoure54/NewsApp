# NewsApp
NewsApp est une application simple qui permet de récupérer les derniers articles français de l'API "newsapi"
 
## Previews

<div style="display: inline-block">
<img
  src="/Previews/LaunchScreen_pic.jpg"
  alt="LaunchScreen preview"
  title="LaunchScreen preview"
  style="display: inline-block; margin: 0 auto; max-height= 80px; max-width: 50px">
  
 <img
  src="/Previews/TableViewArtciles_pic.jpg"
  alt="TableViewArtciles preview"
  title="TableViewArtciles preview"
  style="display: inline-block; margin: 0 auto; max-height= 80px; max-width: 50px">
  
<img
  src="/Previews/DetailView_pic.jpg"
  alt="DetailView preview"
  title="DetailView preview"
  style="display: inline-block; margin: 0 auto; max-height= 80px; max-width: 50px">
</div>

  
 
## Réalisation
Cette application est conçue en se basant sur une architecture MVVM. Elle possèede 3 views. Developpé avec UIkit afin de permettre une plus grande compatibilité iOS, en particluier pour les anciennes versions < 13.0.
 
- LaunchScreen: View affiché au lancement de l'application 
- NewsTableViewController : View principale qui liste les articles récupérer via l'API. J'ai choisi d'utiliser une "TableView" qui semble être l'élément le plus adapté pour ce type d'affichage.
- NewsDetailViewController : Affiche plus d'informations sur l'article choisi.

 Ces 3 views sont mise en place par le biais d'un NaviagationViewController afin de pouvoir naviguer à travers les différentes views. 

## Améliorations
Plusieurs points d'améliorations sont envisagables pour cette application, qui sont les suivants: 
- Chargement des articles: Le chargement des articles en particulier des images peut être améliorer, afin de bénéficier d'une meilleure expérience utilisateur.  
- Gestion des erreurs : La gestion des erreurs peut être amélioré,par exmeple en affichant un pop-up ou une view en cas de connection internet manquante. 
- Design : Le design de l'application, notamment l'affichage du détail des articles peut également être améliorer.
