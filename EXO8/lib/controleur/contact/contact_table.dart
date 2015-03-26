import 'package:EXO8/dartlero_contacts_personne.dart';
import 'package:polymer/polymer.dart';
import 'dart:html';
import 'package:EXO8/controleur/contact/contact_add.dart';
import 'package:EXO8/controleur/contact/contact_edit.dart';
import 'dart:convert';

@CustomTag('contact-table')
class ContactTable extends PolymerElement {

  @published Contacts contacts;
  @observable bool showContactAdd = false;
  @observable bool showContactEdit = false;   
  @observable Personnes personnes;
  @published Personne personne;
  @published ButtonElement ShowAddContactFormButton;

  @observable Contact contact;
//  ContactAdd contactAdd;
//  ContactEdit contactedit;
//  int nbContactBase = 0;
//
//  TableElement contactTable;
//  SpanElement textCaptionContactTable;

  
  ContactTable.created() : super.created();
  
    
//  void intialisation() {
//    textCaptionContactTable = querySelector('#id-text-caption-contact');
//    contactTable = querySelector('#table-contact');
//    contactedit.contactTable = this;
//    contactedit.initialisation();
//    contactAdd.contactTable = this;
//    contactAdd.intialisation();
//    nbContactBase = contactTable.children.length;
//  }

  ShowEditFormContact(Event e, var detail, Node target) {
//    contact = personne.contacts.find(event.target.id);
//    contactedit.ShowEditFormContact(event);
//    
     ShowAddContactFormButton =  shadowRoot.querySelector('#ShowAddContactFormButton');
    String code = target.attributes['idContact'];
       contact = toObservable(contacts.find(code));
       showContactAdd = false;
       showContactEdit = true;
       ShowAddContactFormButton.text = 'Show Add';
  }

  ShowAddFormContact(Event e, var detail, Node target) {
    
     ShowAddContactFormButton =  shadowRoot.querySelector('#ShowAddContactFormButton');
         if (ShowAddContactFormButton.text == 'Show Add') {
           showContactAdd = true;
           showContactEdit = false;  
           ShowAddContactFormButton.text = 'Hide Add';
         } else {
           showContactAdd = false;
           ShowAddContactFormButton.text = 'Show Add';
         }
       
    
  //  contact = personne.contacts.find(event.target.id);
  //  contactAdd.ShowAddFormContact(event);

  }

//  showContactList() {
//    while (contactTable.children.length > nbContactBase) {
//      contactTable.children.removeLast();
//    }
//
//    if (personne == null) {
//      contactAdd.buttonShowaddContactForm.style.display = "none";
//      contactAdd.buttonShowaddContactForm.text = 'Show Add';
//      contactedit.divFormEditContact.style.display = "none";
//      textCaptionContactTable.text = "";
//    } else {
//      contactAdd.buttonShowaddContactForm.style.display = "block";
//      textCaptionContactTable.text =
//          "contacts de: ${personne.prenom} ${personne.nom}";
//      contactAdd.spanTitleFormeAddContact.text =
//          "contact de: ${personne.prenom} ${personne.nom}";
//      contactedit.divFormEditContact.style.display = "none";
//      for (var contactsCourant in personne.contacts.internalList) {
//        addRowData(contactsCourant);
//      }
//    }
//  }
//  addRowData(Contact contact) {
//    var contactRow = new Element.tr();
//    var emailCell = new Element.td();
//    var telephoneCell = new Element.td();
//    var editCell = new Element.td();
//    var deleteCell = new Element.td();
//
//    emailCell.text = contact.email;
//    telephoneCell.text = contact.telephone;
//
//    var editButonConcact = new ButtonElement();
//    editButonConcact.text = "Edit";
//    editButonConcact.title = "Modifier";
//    editButonConcact.id = contact.idContact;
//    editButonConcact.onClick.listen(ShowEditFormContact);
//    editCell.children.add(editButonConcact);
//
//    var deleteButonConcact = new ButtonElement();
//    deleteButonConcact.text = "Delete";
//    deleteButonConcact.title = "Supprier";
//    deleteButonConcact.id = contact.idContact;
//    deleteButonConcact.onClick.listen(deleteContact);
//    deleteCell.children.add(deleteButonConcact);
//
//    contactRow.children.add(emailCell);
//    contactRow.children.add(telephoneCell);
//    contactRow.children.add(editCell);
//    contactRow.children.add(deleteCell);
//    contactRow.id = contact.idContact;
//    contactTable.children.add(contactRow);
//  }

  void deleteContact(Event e, var detail, Node target)  {
    //contact = personne.contacts.find(event.target.id);
    String code = target.attributes['idContact'];
           contact = contacts.find(code);
    contacts.remove(contact);
  //  personne.contacts.remove(contact);
  //  personne.contacts.order();
  //  this.showContactList();
  }
}
