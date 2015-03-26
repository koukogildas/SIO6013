//part of dartlero_contacts_personne;
import 'package:EXO8/dartlero_contacts_personne.dart';
import 'package:polymer/polymer.dart';
import 'dart:html';
import 'package:EXO8/controleur/personne/personne_add.dart';
import 'package:EXO8/controleur/personne/personne_edit.dart';
import 'package:EXO8/controleur/contact/contact_table.dart';
import 'dart:convert';

@CustomTag('personne-table')
class PersonneTable extends PolymerElement{

  @published Personnes personnes;
  @observable Personne personne;
  @observable bool showAdd = false;
  @observable bool showEdit = false;
  @observable bool showPersonneContacts = false;
  ContactTable contactTable;
  
  
 // PersonneAdd personneAdd;
 // ContactTable contactTable;
 // PersonneEdit personneEdit;
  //PersonneTable myself; //new Element.tag('personne-table');
 // int nbPersonneBase = 0;

 
 // TableElement personneTable;
 // ButtonElement buttonPersonneSaveData;
  ButtonElement showAddPersonneForm ;
  PersonneTable.created() : super.created();
    
  
  factory  PersonneTable() {
    
   // if(myself == null){      
   //   myself = new Element.tag('personne-table');
      
   // }
     return new Element.tag('personne-table');
   // return this;//myself;
   }
  
//  showPeopleList() {
//
//    while (personneTable.children.length > nbPersonneBase) {
//      personneTable.children.removeLast();
//    }
//
//    if (personnes.length == 0) {
//      buttonPersonneSaveData.style.display = "none";
//    } else {
//      buttonPersonneSaveData.style.display = "block";
//      for (var personneCourant in personnes.internalList) {
//        addRowData(personneCourant);
//      }
//    }
//  }
  
  void hideFormAnEditdAddOfContact(){
    if(showPersonneContacts){
          contactTable = shadowRoot.querySelector('#contact-table');
               contactTable.showContactEdit = false;
               contactTable.showContactAdd = false;
              if( contactTable.ShowAddContactFormButton != null)
               contactTable.ShowAddContactFormButton.text = 'Show Add';
    }
  }
  
  
  showAddFormPersonne(Event e, var detail, Node target) {
     showAddPersonneForm  =  shadowRoot.querySelector('#showPersonneAddFormButton');
      if (showAddPersonneForm.text == 'Show Add') {
        showAdd = true;
        showAddPersonneForm.text = 'Hide Add';
        showEdit = false;
      } else {
        showAdd = false;
        showAddPersonneForm.text = 'Show Add';
      }
    }

  savePersonne(Event e, var detail, Element target) {
    window.localStorage['dartlero_contacts_personne'] =
        JSON.encode(personnes.toJson());
  }
  
  

  void initialisation() {
//    
//    personneTable = querySelector('#table-Personne');
//    nbPersonneBase = personneTable.children.length;
//  //  buttonPersonneSaveData = querySelector("#savePersonnesData");
// //   buttonPersonneSaveData.onClick.listen(savePersonne);
//
//    contactTable = new ContactTable();
//
//    contactTable.personnes = personnes;
//    contactTable.contactedit = new ContactEdit();
//    contactTable.contactAdd = new ContactAdd();
//    contactTable.intialisation();

//    personneAdd = new PersonneAdd();
//   // personneAdd.personneTable = new PersonneTable();//this;
//    personneAdd.intialisation();
//
//    personneEdit = new PersonneEdit();
//    //personneEdit.personneTable = this;
//    personneEdit.intialisation();

  }

//  showAddFormPersonne(MouseEvent event) {
//    personne = personnes.find(event.target.id);
//    personneAdd.showAddFormPersonne(event);
//  }

//  showEditFormPersonne(MouseEvent event) {
//    personne = personnes.find(event.target.id);
//    personneEdit.showEditFormPersonne(event);
//  }
  
  showEditFormPersonne(Event e, var detail, Element target) {
    showAddPersonneForm  =  shadowRoot.querySelector('#showPersonneAddFormButton');
      String code = target.attributes['idPersonne'];
      personne = toObservable(personnes.find(code));
      personne.contacts.internalList = toObservable(personne.contacts.internalList);
      showEdit = true;
      showAddPersonneForm.text = 'Show Add';
      showAdd = false;
      hideFormAnEditdAddOfContact();
    }

  addRowData(Personne personne) {
//    var personneRow = new Element.tr();
//    var nomCell = new Element.td();
//    var prenomCell = new Element.td();
//    var editCell = new Element.td();
//    var deleteCell = new Element.td();
//    var contactCell = new Element.td();
//
//    nomCell.text = personne.nom;
//    prenomCell.text = personne.prenom;
//
//    var ContactButonPersonne = new ButtonElement();
//    ContactButonPersonne.text = "Contacts";
//    ContactButonPersonne.title = "Afficher les contacts";
//    ContactButonPersonne.id = personne.idPersonne;
//    ContactButonPersonne.onClick.listen(showContactPersonList);
//    contactCell.children.add(ContactButonPersonne);
//
//    var editButonPersonne = new ButtonElement();
//    editButonPersonne.text = "Edit";
//    editButonPersonne.title = "Modifier";
//    editButonPersonne.id = personne.idPersonne;
//    editButonPersonne.onClick.listen(showEditFormPersonne);
//    editCell.children.add(editButonPersonne);
//
//
//    var deleteButonPersonne = new ButtonElement();
//    deleteButonPersonne.text = "Delete";
//    deleteButonPersonne.title = "Supprier";
//    deleteButonPersonne.id = personne.idPersonne;
//    deleteButonPersonne.onClick.listen(deletePersonne);
//    deleteCell.children.add(deleteButonPersonne);
//
//    personneRow.children.add(nomCell);
//    personneRow.children.add(prenomCell);
//    personneRow.children.add(editCell);
//    personneRow.children.add(deleteCell);
//    personneRow.children.add(contactCell);
//    personneRow.id = personne.idPersonne;
//    personneTable.children.add(personneRow);
  }

  
  
  deletePersonne(Event e, var detail, Element target) {
      String code = target.attributes['idPersonne'];
      personnes.remove(personnes.find(code));
     showPersonneContacts = false;
    }
  
//  void deletePersonne(MouseEvent event) {
//
//    var personToDelete = personnes.find(event.target.id);
//
//    if (personne !=
//        null) if (personToDelete.idPersonne == personne.idPersonne) {
//      contactTable.contactAdd.divFormAddContact.style.display = "none";
//      contactTable.contactedit.divFormEditContact.style.display = "none";
//      personne = null;
//    }
//    
//    if (personneEdit.buttonEditPersonne.name == personToDelete.idPersonne) {
//      personneEdit.divFormulaireEditPersonne.style.display = "none";
//    }
//    
//    personToDelete.contacts.clear();
//    personnes.remove(personToDelete);
//    this.showContactPersonList(null);
//    this.showPeopleList();
//    personnes.order();
//
//  }

  showContactPersonList(Event e, var detail, Element target) {
    
    String code = target.attributes['idPersonne'];
        personne = personnes.find(code);
        personne.contacts.internalList = toObservable(personne.contacts.internalList);
        hideFormAnEditdAddOfContact();
        showPersonneContacts = true;
    //if (event != null) personne = personnes.find(event.target.id);
    //contactTable.personne = personne;
   // contactTable.showContactList();
  }

}
