import 'dart:html';
import 'package:TP_EXO6/model/dartlero_contacts_personne.dart';
import 'package:web_ui/web_ui.dart';

class PersonneAdd extends WebComponent {
  Personnes personnes;

  add() {
    InputElement nom = querySelector('#add-persone-nom');
    InputElement prenom = querySelector('#add-persone-prenom');
    Element message = querySelector("#add-persone-message");
    var error = false;
    message.text = '';
    if (nom.value.trim() == '') {
      message.text = 'Veuillez saisir le nom svp.';
      error = true;
    }
    
    if (prenom.value.trim() == '') {
      if(error){
          message.text = 'Veuillez saisir le nom et le prénom svp.';
      }
      else{
        message.text = 'Veuillez saisir le prénom svp.';
        error = true;
      }         
   }   
    
   if (!error) {
    var personne = new Personne();
      personne.nom = nom.value;
      personne.prenom = prenom.value;
      if (personnes.add(personne)) {
        message.text = 'added';
        personnes.order();
      } else {
        message.text = 'La personne existe déjà.';
      }
   }
  }
}