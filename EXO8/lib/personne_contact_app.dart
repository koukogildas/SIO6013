import 'dart:html';
import 'dart:convert';
import 'package:polymer/polymer.dart';
import 'package:EXO8/dartlero_contacts_personne.dart';
import 'package:EXO8/controleur/personne/personne_table.dart';

@CustomTag('personne-contact-app')
class personneContactApp extends PolymerElement {
  
  @observable Personnes personnes;
  Model_contacts_personne model_contacts_personne;
 // @observable PersonneTable personneTable;
  
  personneContactApp.created() : super.created() {
    LoadPersonneData();
    //personneTable.personnes.internalList = toObservable(personneTable.personnes.internalList);
  }
  
  void LoadPersonneData() {

    //personneTable =  new PersonneTable();
    model_contacts_personne = new Model_contacts_personne();
    //personneTable.personnes = model_contacts_personne.personnes;
    personnes = model_contacts_personne.personnes;
    String json = window.localStorage['dartlero_contacts_personne'];
    if (json == null) {
      model_contacts_personne.init();
    } else {
      //personneTable.personnes.fromJson(JSON.decode(json));
      personnes.fromJson(JSON.decode(json));
      //if (personneTable.personnes.length == 0) {
      if (personnes.length == 0) {   
        model_contacts_personne.init();
      }
      personnes.order();
      personnes.internalList = toObservable(personnes.internalList);
    }
    
//    personneTable.personnes.order();
//    personneTable.initialisation();
//    personneTable.showPeopleList();

  }
  
}
