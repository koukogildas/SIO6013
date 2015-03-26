//part of dartlero_contacts_personne;

import 'package:EXO8/controleur/personne/personne_table.dart';
import 'package:EXO8/dartlero_contacts_personne.dart';
import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('personne-add')
class PersonneAdd extends PolymerElement {

 // @published PersonneTable personneTable;//  = new PersonneTable();
  @published Personnes personnes;
  @published Personne personne;

//  ButtonElement buttonPersonneShowaddForm, buttonAddPersonne;
//  DivElement divFormulaireAddPersonne;
  InputElement nom, prenom;
  Element message;

  PersonneAdd.created() : super.created();
//    
//    factory  PersonneAdd() {
//      if(myself == null){      
//        myself = new Element.tag('personne-add');
//        
//      }
//       //return new Element.tag('personne-table');
//      return myself;
//     }
//  void intialisation() {
//    divFormulaireAddPersonne = querySelector("#showPersonneAddForm");
//    message = querySelector("#add-personne-message");
//    nom = querySelector("#add-personne-nom");
//    prenom = querySelector("#add-personne-prenom");
//
//    buttonPersonneShowaddForm = querySelector("#showPersonneAddFormButton");
//    buttonPersonneShowaddForm.onClick.listen(showAddFormPersonne);
//    buttonAddPersonne = querySelector("#AddPersonne");
//    buttonAddPersonne.onClick.listen(addPersonne);
//
//  }

//  showAddFormPersonne(MouseEvent event) {
//    if (buttonPersonneShowaddForm.text == 'Show Add') {
//      divFormulaireAddPersonne.style.display = "block";
//      buttonPersonneShowaddForm.text = 'Hide Add';
//   //   personneTable.personneEdit.divFormulaireEditPersonne.style.display =
//          "none";
//    } else {
//      divFormulaireAddPersonne.style.display = "none";
//      buttonPersonneShowaddForm.text = 'Show Add';
//
//      message.text = "";
//      nom.value = "";
//      prenom.value = "";
//    }
//  }

  addPersonne(Event e, var detail, Node target) {
    var error = false;
    message = shadowRoot.querySelector("#add-personne-message");
    nom = shadowRoot.querySelector("#add-personne-nom");
    prenom = shadowRoot.querySelector("#add-personne-prenom");
    message.text = '';
    
    if (nom.value.isEmpty) {
      message.text = 'Veuillez saisir un nom svp.';
      error = true;
    }

    if (prenom.value.isEmpty) {
      if (error) {
        message.text = 'Veuillez saisir un nom et un prénom svp.';
      } else {
        message.text = 'Veuillez saisir un prénom svp.';
        error = true;
      }
    }

    if (!error) {
      var personne = new Personne();
      personne.nom = nom.value;
      personne.prenom = prenom.value;
      personne.idPersonne = '${nom} + ${prenom}';
      personne.contacts = new Contacts();
      if (personnes.add(personne)) {
        message.text = 'La personne est ajoutée.';
        personnes.order();
        //personneTable.showPeopleList();
        message.text = "";
        nom.value = "";
        prenom.value = "";
      } else {
        message.text = 'La personne existe déjà.';
      }
    }
  }
}
